package mips64;

public class ExMemStage {

    PipelineSimulator simulator;
    boolean shouldWriteback = false;
    boolean isLoad = false;
    int instPC;
    int opcode;
    int aluIntData;
    int storeIntData;
    boolean branchTaken = false;

    public ExMemStage(PipelineSimulator sim) {
        simulator = sim;
    }

    public void update() {
        IdExStage prevStage = simulator.getIdExStage();
        opcode = prevStage.opcode;
        aluIntData = prevStage.aluResult;
        branchTaken = prevStage.isZero;

        if(Instruction.getNameFromOpcode(opcode) == "LW") {
            isLoad = true;
        }

        if(Instruction.getNameFromOpcode(opcode) == "SW") {
            MemoryModel mem = simulator.getMemory();
            mem.setIntDataAtAddr(aluIntData,storeIntData);
        }
    }
}
