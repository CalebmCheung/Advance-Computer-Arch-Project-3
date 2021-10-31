package mips64;

public class IdExStage {

    PipelineSimulator simulator;
    boolean shouldWriteback = false;
    int instPC;
    int opcode;
    int regAData;
    int regBData;
    int immediate;
    int aluResult;
    Instruction inst;

    public IdExStage(PipelineSimulator sim) {
        simulator = sim;
    }

    int getIntRegister(int regNum) {
        // todo - add supporting code
        return 0;
    }

    public void update() {
        //move instrcution down pipeline
        inst = simulator.ifId.inst;
    }
}
