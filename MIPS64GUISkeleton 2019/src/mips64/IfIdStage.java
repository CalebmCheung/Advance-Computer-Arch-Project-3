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
    //check to see if the pipeline is stalled
    IdExStage idExStage = simulator.getIdExStage();
    if(idExStage.isStalled == true){
      return;
    }

    //setup instruction data
    isSquashed = false;
    ExMemStage branchStage = simulator.getExMemStage();
    branchTaken = branchStage.branchTaken;
    jump = branchStage.jump;


    ProgramCounter prevStage = simulator.getPCStage();
    instPC = prevStage.getPC();

    MemoryModel mem = simulator.getMemory();
    inst = mem.getInstAtAddr(instPC);
    opcode = inst.getOpcode();

    //PC logic
    if(branchTaken == true || jump == true ){
        prevStage.setPC(branchStage.aluIntData);
        branchTaken = false;
        jump = false;
        isSquashed = true;
    }
  }
}
