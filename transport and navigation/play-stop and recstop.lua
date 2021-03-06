script_title = "play-stop and recstop"
reaper.Undo_BeginBlock()

play_st = reaper.GetPlayState()
if play_st == 4 or play_st == 5  then -- (4 and 5 = record)
  reaper.Main_OnCommand(1013, 0) -- record
  reaper.Main_OnCommand(1016, 0) -- stop
  metr_st = reaper.GetToggleCommandState(41745)
  if metr_st == 1 then
    reaper.Main_OnCommand(41745, 0) -- enable metronome (off)
  end
elseif play_st == 1 then -- (1 = play)
  reaper.Main_OnCommand(1016, 0) -- stop
else
  reaper.Main_OnCommand(1007, 0) -- play
end

reaper.Undo_EndBlock(script_title, -1)
