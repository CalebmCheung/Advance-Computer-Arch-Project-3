package mips64;

public class MemWbStage {

    PipelineSimulator simulator;
    boolean halted;
    boolean shouldWriteback = false;
    int instPC;
    int opcode;
    int aluIntData;
    int loadIntData;

    public MemWbStage(PipelineSimulator sim) {
        simulator = sim;
    }

    public boolean isHalted() {
        return halted;
    }

    public void update() {
        

        ExMemStage prevStage = simulator.getExMemStage();
        this.opcode = prevStage.opcode;
        this.aluIntData = prevStage.aluIntData;
        //this.loadIntData =

    }
}
