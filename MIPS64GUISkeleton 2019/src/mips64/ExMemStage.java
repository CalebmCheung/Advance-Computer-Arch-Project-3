package mips64;

public class ExMemStage {

    PipelineSimulator simulator;
    boolean shouldWriteback = false;
    int instPC;
    int opcode;
    int aluIntData;
    int regA;
    int regB;
    int immediate;
    int storeIntData;
    boolean branchTaken = false;
    Instruction inst;
    int aluResult;

    public ExMemStage(PipelineSimulator sim) {
        simulator = sim;
    }
    
    public boolean isZero(){

    }

    public void update() {
        IdExStage prevStage = simulator.getIdExStage();
        
        String name = Instruction.getNameFromOpcode(opcode);
        //ALU Operations
        if (name == "LW") {
            return INST_LW;
          }
          else if (name == "SW") {
            return INST_SW;
          }
          else if (name == "LWC1") {
            return INST_LWC1;
          }
          else if (name == "SWC1") {
            return INST_SWC1;
          }
          else if (name == "ADD") {
            return INST_ADD;
          }
          else if (name == "ADDI") {
            return INST_ADDI;
          }
          else if (name == "SUB") {
            return INST_SUB;
          }
          else if (name == "MUL") {
            return INST_MUL;
          }
          else if (name == "DIV") {
            return INST_DIV;
          }
          else if (name == "AND") {
            return INST_AND;
          }
          else if (name == "ANDI") {
            return INST_ANDI;
          }
          else if (name == "OR") {
            return INST_OR;
          }
          else if (name == "ORI") {
            return INST_ORI;
          }
          else if (name == "XOR") {
            return INST_XOR;
          }
          else if (name == "XORI") {
            return INST_XORI;
          }
          else if (name == "SLL") {
            return INST_SLL;
          }
          else if (name == "SRL") {
            return INST_SRL;
          }
          else if (name == "SRA") {
            return INST_SRA;
          }
          else if (name == "ADD.S") {
            return INST_ADD_S;
          }
          else if (name == "SUB.S") {
            return INST_SUB_S;
          }
          else if (name == "MUL.S") {
            return INST_MUL_S;
          }
          else if (name == "DIV.S") {
            return INST_DIV_S;
          }
          else if (name == "CTV.W.S") {
            return INST_CVT_W_S;
          }
          else if (name == "CTV.S.W") {
            return INST_CVT_S_W;
          }
          else if (name == "LT.S") {
            return INST_C_LT_S;
          }
          else if (name == "LE.S") {
            return INST_C_LE_S;
          }
          else if (name == "GT.S") {
            return INST_C_GT_S;
          }
          else if (name == "GE.S") {
            return INST_C_GE_S;
          }
          else if (name == "EQ.S") {
            return INST_C_EQ_S;
          }
          else if (name == "NE.S") {
            return INST_C_NE_S;
          }
          else if (name == "BEQ") {
            return INST_BEQ;
          }
          else if (name == "BNE") {
            return INST_BNE;
          }
          else if (name == "BLTZ") {
            return INST_BLTZ;
          }
          else if (name == "BLEZ") {
            return INST_BLEZ;
          }
          else if (name == "BGTZ") {
            return INST_BGTZ;
          }
          else if (name == "BGEZ") {
            return INST_BGEZ;
          }
          else if (name == "BC1T") {
            return INST_BC1T;
          }
          else if (name == "BC1F") {
            return INST_BC1F;
          }
          else if (name == "J") {
            return INST_J;
          }
          else if (name == "JR") {
            return INST_JR;
          }
          else if (name == "JAL") {
            return INST_JAL;
          }
          else if (name == "JALR") {
            return INST_JALR;
          }
          else if (name == "MTC1") {
            return INST_MTC1;
          }
          else if (name == "MFC1") {
            return INST_MFC1;
          }
      
          else if (name == "NOP") {
            return INST_NOP;
          }
          else if (name == "HALT") {
            return INST_HALT;
          }
          else {
            throw new MIPSException("unexpected operation name: "+name);
          }
        }
            
    }
}
