package mips64;

public class MemWbStage {

    PipelineSimulator simulator;
    boolean halted;
    boolean isSquashed;
    boolean jump;
    boolean shouldWriteback;

    int instPC;
    int opcode;
    int aluIntData;
    int storeIntData;
    int loadIntData;
    int WBaddr;
    int WBdata;

    int oldLoadIntData;
    int oldAluIntData;
    Instruction oldInst;
    String oldName;
    boolean oldShouldWriteBack;

    Instruction inst;

    public MemWbStage(PipelineSimulator sim) {
        simulator = sim;
    }

    public boolean isHalted() {
        return halted;
    }

    public void update() {
        MemoryModel mem = simulator.getMemory();
        IdExStage reg = simulator.getIdExStage();

        // WB
        if (inst != null) {
            oldInst = inst;
            oldAluIntData = aluIntData;
            oldName = Instruction.getNameFromOpcode(oldInst.getOpcode());
            oldShouldWriteBack = shouldWriteback;
            oldLoadIntData = loadIntData;
            //write back old variables
            if(oldName == "LW"){
                WBaddr = ((ITypeInst)oldInst).getRT();
                WBdata = oldLoadIntData;
                reg.updateReg(WBaddr,WBdata);
            }else if(oldShouldWriteBack == true) {
                if (inst instanceof ITypeInst){
                    WBaddr = ((ITypeInst)oldInst).getRT();
                }
                else{
                    WBaddr = ((RTypeInst)oldInst).getRD();
                }
                
                WBdata = oldAluIntData;
                reg.updateReg(WBaddr,WBdata);
            }

            if(oldName == "HALT") {
                halted = true;
            }
        }

        // Data memory
        ExMemStage prevStage = simulator.getExMemStage();
        inst = prevStage.inst;
        if(inst == null){
            return;
        }
        opcode = prevStage.opcode;
        aluIntData = prevStage.aluIntData;
        storeIntData = prevStage.storeIntData;
        instPC = prevStage.instPC;
        jump = prevStage.jump;
        isSquashed = prevStage.isSquashed;
        shouldWriteback = prevStage.shouldWriteback;

        if (isSquashed == true){
            return;
        }

        // load and store
        String name = Instruction.getNameFromOpcode(opcode);
        
        loadIntData = -1;
        if (name == "LW"){
            loadIntData = mem.getIntDataAtAddr(aluIntData);;
        }
        
        if(name == "SW") {
            mem.setIntDataAtAddr(aluIntData,storeIntData);
            return;
        }
    }
}

// hand JR case where we store stuff in R31
// handle Jtype instructions because of different structure
