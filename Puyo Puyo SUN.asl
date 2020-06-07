state("puyo3")
{
	byte stagenum : 0x00AB4CC, 0x110;
	byte wincheck : 0x0006C88, 0x2;
	byte losecheck : 0x0007C7C, 0x4;
	byte schezoplayer : 0x4CCF44;
	
}

startup
{
    vars.timerModel = new TimerModel { CurrentState = timer };

}

init{
	vars.CarbuncleUndo = false;
	vars.PlayingAsSchezo = false;
}


start
{
	if(old.stagenum != 1 && current.stagenum == 1){
	vars.CarbuncleUndo = false;
	if (current.schezoplayer == 1){
		vars.PlayingAsSchezo = true;
	}
	return true;
	}
}

update
{
	if(current.stagenum == 9 && vars.CarbuncleUndo == false && vars.PlayingAsSchezo == true){
		vars.timerModel.UndoSplit();
		vars.CarbuncleUndo = true;
	}
}	
split
{
	if(current.losecheck == 0) {
		return (current.wincheck == 1 && old.wincheck == 0);
	}
	else if(vars.CarbuncleUndo == true) {
		return (current.wincheck == 1 && old.wincheck == 0);
	}
	

}
