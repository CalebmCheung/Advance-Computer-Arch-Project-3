package mips64;

public class MemWbStage {

    PipelineSimulator simulator;
    boolean halted;
    boolean shouldWriteback = false;
    boolean isLoad = false;
    boolean isSquashed;
    boolean branchTaken;
    boolean jump;

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
        opcode = prevStage.opcode;
        aluIntData = prevStage.aluResult;
        branchTaken = prevStage.isZero();
        shouldWriteback = prevStage.shouldWriteback;
        inst = prevStage.inst;
        instPC = prevStage.instPC;
        jump = prevStage.jump;

        // load and store
        String name = Instruction.getNameFromOpcode(opcode);
        if(name == "LW") {
            isLoad = true;
        }

        if(name == "SW") {
            MemoryModel mem = simulator.getMemory();
            mem.setIntDataAtAddr(aluIntData,storeIntData);
        }

        if(name == "JAL" || name == "JALR") {
            MemoryModel mem = simulator.getMemory();
            mem.setIntDataAtAddr(aluIntData,storeIntData);
            jump = true;
        }

        if(name == "HALT") {
            halted = true;
        }
        
        // write back
        if(isLoad){
            //simulator.ifId.updateReg(((ITypeInst)inst).getRT(), loadIntData);
            WBaddr = ((ITypeInst)inst).getRT();
            WBdata = loadIntData;
        }else if(shouldWriteback) {
            //simulator.ifId.updateReg(((RTypeInst)inst).getRD(), aluIntData);
            WBaddr = ((RTypeInst)inst).getRT();
            WBdata = loadIntData;
        }
        
    }
}

// hand JR case where we store stuff in R31
// handle Jtype instructions because of different structure
