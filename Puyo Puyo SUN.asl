state("puyo3")
{
	byte stagenum : 0x00AB4CC, 0x110;
	byte wincheck : 0x0006C88, 0x2;
	byte losecheck : 0x0007C7C, 0x4;
	
}

start
{
	if(old.stagenum != 1 && current.stagenum == 1){

	return true;
	}
}

split
{
	if(current.losecheck == 0) {
		return (current.wincheck == 1 && old.wincheck == 0);
	}
}
