package mips64;

public class IfIdStage {
  PipelineSimulator simulator;
  boolean branchTaken;
  boolean isSquashed;
  boolean jump;

  int instPC;
  int opcode;

  Instruction inst;

  public IfIdStage(PipelineSimulator sim) {
    simulator = sim;

  }
  
  public void update() {
    MemWbStage branchStage = simulator.getMemWbStage();
    branchTaken = branchStage.branchTaken;
    jump = branchStage.jump;

    ProgramCounter prevStage = simulator.getPCStage();
    instPC = prevStage.getPC();

    MemoryModel mem = simulator.getMemory();
    inst = mem.getInstAtAddr(instPC);

    if(inst == null){
      return;
    }

    //PC logic
    if(branchTaken == true || jump == true ){
        prevStage.setPC(branchStage.aluIntData);
    }else{
        prevStage.incrPC();
    }
  }
}
