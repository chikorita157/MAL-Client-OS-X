#tag ModuleProtected Module MALClientUpdateFunctions	#tag Method, Flags = &h0		Function AddSeries(extends parentw as window, AniID as string, title as string, AirStatus as string, EpiTotal as String) As boolean		  dim w as new updatewindow		  w.aniid = aniid		  w.upmethod = "Add"		  w.seriestitle.text = "Adding: "+  title		  If app.prefs.root.GetBoolean("MelativeUpdates",false) = true then		    w.titleprob = title		  end if		  // load the interface		  If epitotal = "0"  or epitotal = ""  Then		    w.eptotal.text = "-"		  else		    w.eptotal.text = epitotal		  end if		  w.anistatus = airstatus		  //Set Watched Episodes to 0		  w.epiwatched.text = "0"		  w.updatebut.caption = "Add"		  w.EditMAL.Enabled = false		  w.ShowModalWithin(parentw)		  if w.doIt = true then		    return true		  end if		  w.close		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function DeleteSeries(extends parentw as window, animeid as string) As boolean		  dim socket1 as new httpsocket		  dim t as new dictionary		  t = window1.l.value(animeid)		  Dim d as New MessageDialog //declare the MessageDialog object		  Dim b as MessageDialogButton //for handling the result		  d.icon=MessageDialog.GraphicCaution //display warning icon		  d.ActionButton.Caption="Delete"		  d.CancelButton.Default = true // don't make Delete the default button.		  d.CancelButton.Visible=True    //show the Cancel button		  d.Message="Are you sure you want to delete " + t.value("title") + " from your list?"		  d.Explanation="Once deleted, this operation cannot be undone."		  b=d.ShowModalWithin(parentw) //display the dialog		  Select Case b //determine which button was pressed.		  Case d.ActionButton		    //user pressed Delete		    //perform delete		    dim form as dictionary		    form = New Dictionary		    form.value("_method") = "DELETE"		    // setup the socket to POST the form		    socket1.setFormData form		    socket1.setrequestheader "Authorization","Basic " + app.loginenc		    socket1.post ("http://mal-api.com/animelist/anime/" + animeid )		    form = nil		    If socket1.httpstatuscode = 200 then		      Msgbox t.value("title") + " is removed from your list."		      window1.l.remove(animeid)		      window1.filterlist		      return true		    else		      errboxshowdialog("There was a problem when we were trying to remove a title.", "Check your internet connection and try removing that title again.")		    end if		  Case d.CancelButton		    //user pressed Cancel		  End select		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function UpdateStatus(extends parentw as window, animeid as string) As boolean		  dim w as new updatewindow		  dim t as new dictionary		  t = window1.l.value(animeid)		  w.aniid = animeid		  w.upmethod = "Update"		  w.seriestitle.text = "Updating Information for: "+  t.value("title")		  w.epiwatched.text = t.value("watched_episodes")		  If t.value("episodes") = "0" Then		    w.eptotal.text = "-"		  else		    w.eptotal.text = t.value("episodes")		  end if		  w.listedaniid = t.value("listed_anime_id")		  w.score.listindex = val(t.value("score"))		  if t.value("watched_status") = "watching" then		  elseif t.value("watched_status")  ="completed" then		    w.status.listindex = 1		  elseif t.value("watched_status") = "dropped" then		    w.status.listindex = 3		  elseif t.value("watched_status") ="completed" then		    w.status.listindex = 4		  elseif t.value("watched_status") ="plan to watch" then		    w.status.listindex = 5		  else		    w.status.listindex =2		  End If		  If app.prefs.root.GetBoolean("MelativeUpdates",false) = true then		    w.titleprob =  t.value("title")		  end if		  w.anistatus = t.value("status")		  //w.loadinfo()		  w.ShowModalWithin(parentw)		  		  if w.doIt = true then		    t.value("watched_episodes") = w.epiwatched.text		    t.value("watched_status") = w.status.text		    t.value("score") = w.score.text		    window1.l.value(animeid) = t		    window1.filterlist		    //refreshlist(true)		    Return True		  end if		  w.close		End Function	#tag EndMethod	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Module#tag EndModule