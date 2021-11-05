package mips64;

public class MemWbStage {

    PipelineSimulator simulator;
    boolean halted;
    boolean isSquashed;
    boolean branchTaken;
    boolean jump;
    boolean shouldWriteback;

    int instPC;
    int opcode;
    int aluIntData;
    int storeIntData;
    int loadIntData;
    int WBaddr;
    int WBdata;

    Instruction inst;

    public MemWbStage(PipelineSimulator sim) {
        simulator = sim;
    }

    public boolean isHalted() {
        return halted;
    }

    public void update() {

        ExMemStage prevStage = simulator.getExMemStage();
        inst = prevStage.inst;
        if(inst == null){
            return;
        }

        opcode = prevStage.opcode;
        aluIntData = prevStage.aluIntData;
        branchTaken = prevStage.branchTaken;
        instPC = prevStage.instPC;
        jump = prevStage.jump;
        shouldWriteback = prevStage.shouldWriteback;

        // load and store
        String name = Instruction.getNameFromOpcode(opcode);
        MemoryModel mem = simulator.getMemory();
        
        if(name == "SW") {
            mem.setIntDataAtAddr(aluIntData,storeIntData);
            return;
        }

        if(name == "JAL" || name == "JALR") {
            mem.setIntDataAtAddr(aluIntData,storeIntData);
            jump = true;
        }

        if(name == "HALT") {
            halted = true;
        }
        
        // write back
        if(name == "LW"){
            //simulator.ifId.updateReg(((ITypeInst)inst).getRT(), loadIntData)
            WBaddr = ((ITypeInst)inst).getRT();
            WBdata = mem.getIntDataAtAddr(aluIntData);
        }else if(shouldWriteback == true) {
            //simulator.ifId.updateReg(((RTypeInst)inst).getRD(), aluIntData);
            if (inst instanceof ITypeInst){
                WBaddr = ((ITypeInst)inst).getRT();
            }
            else{
                WBaddr = ((RTypeInst)inst).getRT();
            }
            
            WBdata = aluIntData;
        }
        
    }
}

// hand JR case where we store stuff in R31
// handle Jtype instructions because of different structure
