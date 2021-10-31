package mips64;

public class MemWbStage {

    PipelineSimulator simulator;
    boolean halted;
    boolean shouldWriteback = false;
    boolean isLoad = false;
    int instPC;
    int opcode;
    int aluIntData;
    int storeIntData;
    int loadIntData;
    Instruction inst;
    boolean branchTaken;
    
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

        // load and store
        if(Instruction.getNameFromOpcode(opcode) == "LW") {
            isLoad = true;
        }

        if(Instruction.getNameFromOpcode(opcode) == "SW") {
            MemoryModel mem = simulator.getMemory();
            mem.setIntDataAtAddr(aluIntData,storeIntData);
        }
        
        // write back
        if(isLoad){
            simulator.ifId.updateReg(((ITypeInst)inst).getRT(), loadIntData);
        }else if(shouldWriteback) {
            simulator.ifId.updateReg(((RTypeInst)inst).getRD(), aluIntData);
        }
        
    }
}
