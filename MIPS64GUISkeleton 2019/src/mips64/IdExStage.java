package mips64;

public class IdExStage {

    PipelineSimulator simulator;
    boolean isSquashed;
    boolean shouldWriteback = false;
    boolean isStalled;

    int instPC;
    int opcode;
    int regAData;
    int regBData;
    int immediate;
    int WBaddr;
    int WBdata;

    Instruction inst;

    private int[] registers = new int[32];

    public IdExStage(PipelineSimulator sim) {
        simulator = sim;
    }

    int getIntRegister(int regNum) {
        return registers[regNum];
    }

    public void updateReg(int addr, int data){
        registers[addr] = data;
    }

    public void update() {
        // setup instruction data
        IfIdStage prevStage = simulator.getIfIdStage();
        inst = prevStage.inst;
        if(inst == null){
            return;
        }

        isStalled = false;
        instPC = prevStage.instPC;
        opcode = prevStage.opcode;
        inst = prevStage.inst;
        isSquashed = prevStage.isSquashed;
        shouldWriteback = false;

        //check to see if branch is taken and needs to be squashed
        ExMemStage exMem = simulator.getExMemStage();

        if (exMem.branchTaken == true || exMem.jump == true || isSquashed == true){
            isSquashed = true;
            return;
        }

        String name = Instruction.getNameFromOpcode(opcode);

        if (inst instanceof RTypeInst || name == "ADDI" || name == "ANDI" 
                || name == "ORI" || name == "XORI" || name == "LW") {
            shouldWriteback = true;
        }
        
        if(name == "JAL" || name == "JALR") {
            updateReg(31,instPC);
        }

        // check for dependencies

        // This stages instrustion registers
        int IR1 = 0;
        int IR2 = 0;
        if(inst instanceof ITypeInst) {
            IR1 = ((ITypeInst)inst).getRS();
            IR2 = ((ITypeInst)inst).getRT();
        } 
        else if(inst instanceof RTypeInst) {
            IR1 = ((RTypeInst)inst).getRS();
            IR2 = ((RTypeInst)inst).getRT();
        }
        
        MemWbStage MemWB = simulator.getMemWbStage();

        // check to see if the instruction ahead writes back (for dependencies)
        if(exMem.shouldWriteback == true){
            int EXTargetreg;
            if(exMem.inst instanceof ITypeInst){
                EXTargetreg = ((ITypeInst)exMem.inst).getRT();
            }
            else{
                EXTargetreg = ((RTypeInst)exMem.inst).getRD();
            }

            if(EXTargetreg == IR1 || EXTargetreg == IR2) {
                isStalled = true;
            }
        }

        if(MemWB.inst != null) {
            if (Instruction.getNameFromOpcode(MemWB.inst.getOpcode()) == "LW"){
                isStalled = true;
            }
        }

        // get register data, lowest priority first
        // data in registers may be old data, so get oldest data first
        // overwrite the old data with new data from forwarding
        //parse instruction for registers
        if(inst instanceof ITypeInst) {
            immediate = ((ITypeInst)inst).getImmed();
            regAData = getIntRegister(IR1);
            regBData = getIntRegister(IR2);
        }
        else if(inst instanceof RTypeInst){
            regAData = getIntRegister(IR1);
            regBData = getIntRegister(IR2);
        }

        // WB stage first in forwarding
        if(MemWB.oldShouldWriteBack == true){
            int WBTargetreg;
            if(MemWB.oldInst instanceof ITypeInst){
                WBTargetreg = ((ITypeInst)MemWB.oldInst).getRT();
            }
            else{
                WBTargetreg = ((RTypeInst)MemWB.oldInst).getRD();
            }

            boolean isLW = false;
            if(Instruction.getNameFromOpcode(MemWB.oldInst.getOpcode()) == "LW") {
                isLW = true;
            }

            //check if registers are the same
            if(IR1 == WBTargetreg) {
                if(isLW) {
                    regAData = MemWB.oldLoadIntData;
                }
                else{
                    regAData = MemWB.oldAluIntData;
                }
            }

            if(IR2 == WBTargetreg) {
                if(isLW) {
                    regBData = MemWB.oldLoadIntData;
                }
                else{
                    regBData = MemWB.oldAluIntData;
                }
            }
        }

        // Mem stage highest priority in forwarding
        if(MemWB.shouldWriteback == true){
            int MemTargetreg;
            if(MemWB.inst instanceof ITypeInst){
                MemTargetreg = ((ITypeInst)MemWB.inst).getRT();
            }
            else{
                MemTargetreg = ((RTypeInst)MemWB.inst).getRD();
            }

            //check if registers are the same
            if(IR1 == MemTargetreg) {
                regAData = MemWB.aluIntData;
            }

            if(IR2 == MemTargetreg) {
                regBData = MemWB.aluIntData;
            }
        }
    }
}
