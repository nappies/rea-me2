function nothing() end

tr = reaper.GetSelectedTrack(0,0)
if tr then
  tr_items = reaper.CountTrackMediaItems(tr)
  if tr_items > 0 then
    reaper.Undo_BeginBlock()
    
    for i = 0, tr_items-1 do
      item = reaper.GetTrackMediaItem(tr, i)
      startOut, endOut = reaper.GetSet_LoopTimeRange(0, 0, 0, 0, 0)
      item_pos = reaper.GetMediaItemInfo_Value(item, 'D_POSITION')
      if item_pos >= startOut and item_pos <= endOut then
        selected = reaper.IsMediaItemSelected(item)
        reaper.SetMediaItemSelected(item, not selected)
      end
    end
    reaper.UpdateArrange()
    reaper.Undo_EndBlock('invert item selection on sel tr in time selection', -1)
  else reaper.defer(nothing) end
else reaper.defer(nothing) end
