package mips64;

public class IdExStage {

    PipelineSimulator simulator;
    boolean shouldWriteback = false;
    boolean isSquashed;

    int instPC;
    int opcode;
    int regAData;
    int regBData;
    int immediate;
    int WBaddr;
    int WBdata;

    Instruction inst;

    private int[] registers = new int[32];

    public IdExStage(PipelineSimulator sim) {
        simulator = sim;
    }

    int getIntRegister(int regNum) {
        return registers[regNum];
    }

    public void updateReg(int addr, int data){
        registers[addr] = data;
    }

    public void update() {
        IfIdStage prevStage = simulator.getIfIdStage();
        inst = prevStage.inst;
        if(inst == null){
            return;
        }

        instPC = prevStage.instPC;
        opcode = prevStage.opcode;
        inst = prevStage.inst;

        //get fowarded data
        MemWbStage memStage = simulator.getMemWbStage();
        WBaddr = memStage.WBaddr;
        WBdata = memStage.WBdata;
        updateReg(WBaddr,WBdata);

        //parse instruction for registers
        if(inst instanceof ITypeInst) {
            int IR1 = ((ITypeInst)inst).getRS();
            regAData = getIntRegister(IR1);
        }
        else if(inst instanceof JTypeInst){
            int IR1 = ((RTypeInst)inst).getRS();
            int IR2 = ((RTypeInst)inst).getRT();
            regAData = getIntRegister(IR1);
            regBData = getIntRegister(IR2);
        }
    }
}
