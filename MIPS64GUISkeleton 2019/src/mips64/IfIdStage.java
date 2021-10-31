package mips64;

public class IfIdStage {
  PipelineSimulator simulator;
  int instPC;
  int opcode;
  Instruction inst;
  
  private int[] registers = new int[32];

  public IfIdStage(PipelineSimulator sim) {
    simulator = sim;

  }

  public void updateReg(int addr, int data){
    registers[addr] = data;
  }
  
  public void update() {
    ProgramCounter prevStage = simulator.getPCStage();
    opcode = prevStage.opcode;

    //build instruction with opcode
    String name = Instruction.getNameFromOpcode(opcode);
    inst = Instruction.getInstructionFromName(name);

    
    //this.instPC = prevStage.
  }
}
