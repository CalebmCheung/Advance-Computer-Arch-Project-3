package mips64;
public class ExMemStage {

    PipelineSimulator simulator;
    boolean branchTaken = false;
    boolean jump = false;
    boolean isSquashed;
    boolean shouldWriteback;

    int instPC;
    int opcode;
    int operand1;
    int operand2;
    int immediate;
    int storeIntData;
    int aluIntData;

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
        //reset flags for next instruction
        jump = false;
        branchTaken = false;
        shouldWriteback = false;

        IdExStage prevStage = simulator.getIdExStage();

        if (prevStage.isStalled == true) {
            inst = Instruction.getInstructionFromName("NOP");
            return;
        }

        inst = prevStage.inst;
        if(inst == null){
            return;
        }

        instPC = prevStage.instPC;
        opcode = prevStage.opcode;
        inst = prevStage.inst;
        isSquashed = prevStage.isSquashed;
        shouldWriteback = prevStage.shouldWriteback;

        if (isSquashed == true){
            return;
        }
        
        operand1 = prevStage.regAData;
        operand2 = prevStage.regBData;
        String name = Instruction.getNameFromOpcode(opcode);
        //ALU Operations
        if (name == "LW") {
            aluIntData = operand1 + ((ITypeInst)inst).getImmed();
        }
        else if (name == "SW") {
            aluIntData = operand1 + ((ITypeInst)inst).getImmed();
            storeIntData = operand2;
        }
        else if (name == "ADD") {
            aluIntData = operand1 + operand2;
        }
        else if (name == "ADDI") {
            operand2 = ((ITypeInst)inst).getImmed();
            aluIntData = operand1 + operand2;
         }
        else if (name == "SUB") {
            aluIntData = operand1 - operand2;
        }
        else if (name == "MUL") {
            aluIntData = operand1 * operand2;
        }
        else if (name == "DIV") {
            aluIntData = operand1 / operand2;
        }
        else if (name == "AND") {
            aluIntData = operand1 & operand2;
        }
        else if (name == "ANDI") {
            operand2 = ((ITypeInst)inst).getImmed();
            aluIntData = operand1 & operand2;
        }
        else if (name == "OR") {
            aluIntData = operand1 | operand2;
        }
        else if (name == "ORI") {
            operand2 = ((ITypeInst)inst).getImmed();
            aluIntData = operand1 | operand2;
        }
        else if (name == "XOR") {
            aluIntData = operand1 ^ operand2;
        }
        else if (name == "XORI") {
            operand2 = ((ITypeInst)inst).getImmed();
            aluIntData = operand1 ^ operand2;
        }
        else if (name == "SLL") {
            operand2 = ((RTypeInst)inst).getShamt();
            aluIntData = operand1 << operand2;
        }
        else if (name == "SRL") {
            operand2 = ((RTypeInst)inst).getShamt();
            aluIntData = operand1 >>> operand2;
        }
        else if (name == "SRA") {
            operand2 = ((RTypeInst)inst).getShamt();
            aluIntData = operand1 >> operand2;
        }
        else if (name == "BEQ") {
            if (operand1 == operand2){
                branchTaken = true;
                aluIntData = instPC + ((ITypeInst)inst).getImmed();
            }
        }
        else if (name == "BNE") {
            if (operand1 != operand2){
                branchTaken = true;
                aluIntData = instPC + ((ITypeInst)inst).getImmed();
            }
        }
        else if (name == "BLTZ") {
            if (operand1 < 0){
                branchTaken = true;
                aluIntData = instPC + ((ITypeInst)inst).getImmed();
            }
        }
        else if (name == "BLEZ") {
            if (operand1 <= 0){
                branchTaken = true;
                aluIntData = instPC + ((ITypeInst)inst).getImmed();
            }
        }
        else if (name == "BGTZ") {
            if (operand1 > 0){
                branchTaken = true;
                aluIntData = instPC + ((ITypeInst)inst).getImmed();
            }
        }
        else if (name == "BGEZ") {
            if (operand1 >= 0){
                branchTaken = true;
                aluIntData = instPC + ((ITypeInst)inst).getImmed();
            }
        }
        else if (name == "J") {
            aluIntData = instPC + ((JTypeInst)inst).getOffset();
            jump = true;
        }
        else if (name == "JR") {
            aluIntData = operand1;
            jump = true;
        }
        else if (name == "JAL") {
            aluIntData = instPC + ((JTypeInst)inst).getOffset();
            jump = true;
        }
        else if (name == "JALR") {
            aluIntData = operand1;
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
