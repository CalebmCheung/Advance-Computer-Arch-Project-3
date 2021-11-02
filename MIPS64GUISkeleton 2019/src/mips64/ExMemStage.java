package mips64;
public class ExMemStage {

    PipelineSimulator simulator;
    boolean shouldWriteback = false;
    boolean branchTaken = false;
    boolean jump = false;
    boolean isSquashed;

    int instPC;
    int opcode;
    int aluIntData;
    int operand1;
    int operand2;
    int immediate;
    int storeIntData;
    int aluResult;

    Instruction inst;

    public ExMemStage(PipelineSimulator sim) {
        simulator = sim;
    }
    
    public boolean isZero(){
        operand1 = simulator.getIdExStage().regAData;
        if(operand1 == 0){
            return true;
        }
        else{
            return false;
        }
    }

    public void update() {
        IdExStage prevStage = simulator.getIdExStage();
        inst = prevStage.inst;
        if(inst == null){
            return;
        }

        instPC = prevStage.instPC;
        opcode = prevStage.opcode;
        inst = prevStage.inst;
        //reset flags for next instruction
        jump = false;
        branchTaken = false;
        
        operand1 = prevStage.regAData;
        operand2 = prevStage.regBData;
        String name = Instruction.getNameFromOpcode(opcode);
        //ALU Operations
        if (name == "LW" || name == "SW") {
            aluResult = instPC + ((ITypeInst)inst).getImmed();
        }
        else if (name == "ADD") {
            aluResult = operand1 + operand2;
        }
        else if (name == "ADDI") {
            operand2 = ((ITypeInst)inst).getImmed();
            aluResult = operand1 + operand2;
        }
        else if (name == "SUB") {
            aluResult = operand1 - operand2;
        }
        else if (name == "MUL") {
            aluResult = operand1 * operand2;
        }
        else if (name == "DIV") {
            aluResult = operand1 / operand2;
        }
        else if (name == "AND") {
            aluResult = operand1 & operand2;
        }
        else if (name == "ANDI") {
            operand2 = ((ITypeInst)inst).getImmed();
            aluResult = operand1 & operand2;
        }
        else if (name == "OR") {
            aluResult = operand1 | operand2;
        }
        else if (name == "ORI") {
            operand2 = ((ITypeInst)inst).getImmed();
            aluResult = operand1 | operand2;
        }
        else if (name == "XOR") {
            aluResult = operand1 ^ operand2;
        }
        else if (name == "XORI") {
            operand2 = ((ITypeInst)inst).getImmed();
            aluResult = operand1 ^ operand2;
        }
        else if (name == "SLL") {
            operand2 = ((RTypeInst)inst).getShamt();
            aluResult = operand1 << operand2;
        }
        else if (name == "SRL") {
            operand2 = ((RTypeInst)inst).getShamt();
            aluResult = operand1 >>> operand2;
        }
        else if (name == "SRA") {
            operand2 = ((RTypeInst)inst).getShamt();
            aluResult = operand1 >> operand2;
        }
        else if (name == "BEQ") {
            if (operand1 == operand2){
                branchTaken = true;
            }
        }
        else if (name == "BNE") {
            if (operand1 != operand2){
                branchTaken = true;
            }
        }
        else if (name == "BLTZ") {
            if (operand1 < 0){
                branchTaken = true;
            }
        }
        else if (name == "BLEZ") {
            if (operand1 <= 0){
                branchTaken = true;
            }
        }
        else if (name == "BGTZ") {
            if (operand1 > 0){
                branchTaken = true;
            }
        }
        else if (name == "BGEZ") {
            if (operand1 >= 0){
                branchTaken = true;
            }
        }
        else if (name == "J") {
            aluResult = ((JTypeInst)inst).getOffset();
            jump = true;
        }
        else if (name == "JR") {
            aluResult = operand1;
            jump = true;
        }
        else if (name == "JAL") {
          aluResult = ((JTypeInst)inst).getOffset();
          jump = true;
        }
        else if (name == "JALR") {
            aluResult = operand1;
            jump = true;
        }
        else if (name == "NOP") {
            return;
        }
        else if (name == "HALT") {
            return;
        }
        else {
          throw new MIPSException("unexpected operation name: "+name);
        }    
    }
}
