RbBF              BlokpVewI��      �             NameStrn   updatewindowContInt     paswStrn    bClsInt    SuprStrn   Window  flagInt    bNtrInt     CompStrn    HInsGrup    
enameStrn   OpenCompStrn    VsblInt    sorcGrup   �  
fEncoInt   srclStrn   
Sub Open()  srclStrn   &If prefs.BooleanMelUpdates = true then  srclStrn   commentsfield.visible = truesrclStrn   commentslbl.visible = true  srclStrn   end if  srclStrn   End Sub EndGInt   
fEndGInt   
eMethGrup    
gnameStrn   loadinfoCompStrn    VsblInt    sorcGrup  �  
hEncoInt   srclStrn   Sub loadinfo()  srclStrn   // load anime infomationsrclStrn   dim data as string  srclStrn   @socket1.setrequestheader "Authorization","Basic " + app.loginencsrclStrn   Fdata= socket1.get("http://mal-api.com/anime/" + AniID + "?mine=1" ,10)  srclStrn   If data is nil then srclStrn   self.truewindow.hidesrclStrn   �app.errboxshow("There is a problem looking up infomation!", "Cannot retrieve infomation. Make sure your internet connection is working.")   srclStrn   self.truewindow.showsrclStrn   updatebut.enabled = false   srclStrn   EditMAL.Enabled = false srclStrn   Vseriestitle.text = "Unable to retrieve your status on the series you chosen to update"  srclStrn   elsesrclStrn   // Parse JSON to Dictionary (d) srclStrn   d = json.parse(data)srclStrn   //Set Total EpisodessrclStrn   "eptotal.text = d.value("episodes")  srclStrn   //Set StatussrclStrn   .if d.value("watched_status") = "watching" then  srclStrn   3elseif d.value("watched_status")  ="completed" then srclStrn   status.listindex = 1srclStrn   1elseif d.value("watched_status") = "dropped" then   srclStrn   status.listindex = 3srclStrn   2elseif d.value("watched_status") ="completed" then  srclStrn   status.listindex = 4srclStrn   6elseif d.value("watched_status") ="plan to watch" then  srclStrn   status.listindex = 5srclStrn   elsesrclStrn   status.listindex =2 srclStrn   End If  srclStrn   // Set Watched Episodes srclStrn   .epiwatched.text = d.value("watched_episodes")   srclStrn   //Set Score srclStrn    If  d.value("score") is nil thensrclStrn   elsesrclStrn   (score.listindex = val(d.value("score")) srclStrn   end if  srclStrn   // Set Air Status   srclStrn   anistatus = d.value("status")   srclStrn   // Set Listed Ani IDsrclStrn   )listedaniid = d.value("listed_anime_id")    srclStrn   //clear datasrclStrn   d = nil srclStrn   	data = ""   srclStrn   end if  srclStrn   End Sub EndGInt   
hEncoInt   AlasStrn    flagInt     shrdInt     parmStrn    rsltStrn    EndGInt   
gMethGrup  �  
inameStrn   
updateinfo  CompStrn    VsblInt    sorcGrup  \  
jEncoInt   srclStrn   Sub updateinfo()srclStrn   updatebut.enabled = false   srclStrn   ProgressWheel1.visible = true   srclStrn   socket1.yield = truesrclStrn   updatebut.enabled = false   srclStrn   Dim form as Dictionary  srclStrn   dim t as booleansrclStrn   &// create and populate the form object  srclStrn   form = New Dictionary   srclStrn   form.value("_method") = "PUT"   srclStrn   "form.value("status") = status.text  srclStrn   (form.value("episodes") = epiwatched.textsrclStrn    form.value("score") = score.textsrclStrn   $// setup the socket to POST the formsrclStrn   socket1.setFormData formsrclStrn   @socket1.setrequestheader "Authorization","Basic " + app.loginencsrclStrn   =socket1.post ("http://mal-api.com/animelist/anime/" + AniID )   srclStrn   $If socket1.httpstatuscode = 200 thensrclStrn   // if successfulsrclStrn   &If prefs.BooleanMelUpdates = true then  srclStrn   // Scrobble to Melative srclStrn   melpostupdate   srclStrn   elsesrclStrn   end if  srclStrn   	doIt=true   srclStrn   t = doitsrclStrn   window1.refreshlist srclStrn   hidesrclStrn   elsesrclStrn   // Show Error   srclStrn   �app.errboxshow("There was a problem when we were trying to update your status.", "Check your internet connection and try your update again.")   srclStrn   updatebut.enabled = truesrclStrn   end if  srclStrn   End Sub EndGInt   
jEncoInt   AlasStrn    flagInt     shrdInt     parmStrn    rsltStrn    EndGInt   
iMethGrup  �  
knameStrn   melpostupdate   CompStrn    VsblInt    sorcGrup    
lEncoInt   srclStrn   Sub melpostupdate() srclStrn   dim data as string  srclStrn   dim socket2 as new httpsocket   srclStrn   &// create and populate the form object  srclStrn   dim form2 as New Dictionary srclStrn    srclStrn   dim s as string srclStrn   (// Correct Scobbling Action for MelativesrclStrn   %If status.text = "plan to watch" then   srclStrn   s = "wishlist"  srclStrn   #Elseif status.text = "on-hold" then srclStrn   s = "pause" srclStrn   #Elseif status.text = "dropped" then srclStrn   	s= "drop"   srclStrn   %Elseif  status.text = "watching" then   srclStrn   s="watched" srclStrn   elsesrclStrn   s = status.text srclStrn   end if  srclStrn   // Set content  srclStrn   If Commentsfield.text = "" then srclStrn   // Scobble Title Only   srclStrn    form2.value("anime") = titleprobsrclStrn   (form2.value("segment") = epiwatched.textsrclStrn   socket2.setFormData form2   srclStrn   Gsocket2.setrequestheader "Authorization","Basic " + prefs.StringMelAuth srclStrn   Mdata = socket2.post("http://melative.com/api/library/segment/update.json",10)   srclStrn   elsesrclStrn   // Use Normal Updating  srclStrn   X// Figure out the num of episodes. If zero, episode part will not be shown in the updatesrclStrn   If epiwatched.text = "0" then   srclStrn   Qform2.value("message") = s + " /anime/" + titleprob + "/ : " + commentsfield.text   srclStrn   elsesrclStrn   nform2.value("message") = s + " /anime/" + titleprob + "/Episode "+ epiwatched.text + ": " + commentsfield.text  srclStrn   end if  srclStrn   I// Set Client ( e.g. <username> in anime <time> ago from MAL Client OS X)   srclStrn   )form2.value("source") = "MAL Client OS X"   srclStrn   $// setup the socket to POST the formsrclStrn   socket2.setFormData form2   srclStrn   Gsocket2.setrequestheader "Authorization","Basic " + prefs.StringMelAuth srclStrn   Cdata = socket2.post("http://melative.com/api/micro/update.json",10) srclStrn   end if  srclStrn   // release data from memory srclStrn   s = ""  srclStrn   form2 = nil srclStrn   End Sub EndGInt   
lEncoInt   AlasStrn    flagInt     shrdInt     parmStrn    rsltStrn    EndGInt   
kMethGrup  �  
mnameStrn   	addseries   CompStrn    VsblInt    sorcGrup  �  
nEncoInt   srclStrn   Sub addseries() srclStrn   updatebut.enabled = false   srclStrn   ProgressWheel1.visible = true   srclStrn   updatebut.enabled = false   srclStrn   Socket1.yield = truesrclStrn   Dim form as Dictionary  srclStrn   &// create and populate the form object  srclStrn   form = New Dictionary   srclStrn   form.value("anime_id") = AniID  srclStrn   "form.value("status") = status.text  srclStrn   (form.value("episodes") = epiwatched.textsrclStrn    form.value("score") = score.textsrclStrn   $// setup the socket to POST the formsrclStrn   socket1.setFormData formsrclStrn   @socket1.setrequestheader "Authorization","Basic " + app.loginencsrclStrn   1socket1.Post "http://mal-api.com/animelist/anime"   srclStrn   $If socket1.httpstatuscode = 200 thensrclStrn   &If prefs.BooleanMelUpdates = true then  srclStrn   // Scrobble to Melative srclStrn   melpostupdate   srclStrn   elsesrclStrn   end if  srclStrn   	doIt=true   srclStrn   window1.refreshlist srclStrn   hidesrclStrn   elsesrclStrn   // Show Error   srclStrn   �app.errboxshow("There was a problem when we were trying to add a title.", "Check your internet connection and try your update again.")  srclStrn   updatebut.enabled = truesrclStrn   end if  srclStrn   End Sub EndGInt   
nEncoInt   AlasStrn    flagInt     shrdInt     parmStrn    rsltStrn    EndGInt   
mMethGrup  �  
onameStrn   addloadinfo CompStrn    VsblInt    sorcGrup  D  
pEncoInt   srclStrn   Sub addloadinfo()   srclStrn    srclStrn   // load anime infomationsrclStrn   dim data as string  srclStrn   ;data= socket1.get("http://mal-api.com/anime/" + AniID  ,10) srclStrn   If data is nil then srclStrn   self.truewindow.hidesrclStrn   �app.errboxshow("There is a problem looking up infomation!", "Cannot retrieve infomation. Make sure your internet connection is working.")   srclStrn   self.truewindow.showsrclStrn   updatebut.enabled = false   srclStrn   Sseriestitle.text = "Unable to retrieve your status on the series you chosen to add" srclStrn   elsesrclStrn   // Parse JSON to Dictionary (d) srclStrn   d = json.parse(data)srclStrn   //Set Total EpisodessrclStrn   "eptotal.text = d.value("episodes")  srclStrn   // Set Air Status   srclStrn   anistatus = d.value("status")   srclStrn   //clear datasrclStrn   d = nil srclStrn   	data = ""   srclStrn   //Set Watched Episodes to 0 srclStrn   epiwatched.text = "0"   srclStrn   updatebut.caption = "Add"   srclStrn   EditMAL.Enabled = false srclStrn   end if  srclStrn   End Sub EndGInt   
pEncoInt   AlasStrn    flagInt     shrdInt     parmStrn    rsltStrn    EndGInt   
oPropGrup   �  
qnameStrn   doitCompStrn    VsblInt    sorcGrup   8  
rEncoInt   srclStrn   doit As boolean srclStrn    EndGInt   
rEncoInt   declStrn   doit As boolean = false flagInt     shrdInt     EndGInt   
qPropGrup   �  
snameStrn   AniID   CompStrn    VsblInt    sorcGrup   8  
tEncoInt   srclStrn   AniID As string srclStrn    EndGInt   
tEncoInt   declStrn   AniID As string flagInt     shrdInt     EndGInt   
sPropGrup   �  
unameStrn   	anistatus   CompStrn    VsblInt    sorcGrup   <  
vEncoInt   srclStrn   anistatus As string srclStrn    EndGInt   
vEncoInt   declStrn   anistatus As string flagInt     shrdInt     EndGInt   
uPropGrup   �  
wnameStrn   	titleprob   CompStrn    VsblInt    sorcGrup   <  
xEncoInt   srclStrn   titleprob As string srclStrn    EndGInt   
xEncoInt   declStrn   titleprob As string flagInt     shrdInt     EndGInt   
wPropGrup   �  
ynameStrn   listedaniid CompStrn    VsblInt    sorcGrup   @  
zEncoInt   srclStrn   listedaniid As string   srclStrn    EndGInt   
zEncoInt   declStrn   listedaniid As string   flagInt     shrdInt     EndGInt   
yPropGrup   �  
{nameStrn   d   CompStrn    VsblInt    sorcGrup   8  
|EncoInt   srclStrn   d As dictionary srclStrn    EndGInt   
|EncoInt   declStrn   d As dictionary flagInt     shrdInt     EndGInt   
{PropGrup   �  
}nameStrn   upmethodCompStrn    VsblInt    sorcGrup   <  
~EncoInt   srclStrn   upmethod As string  srclStrn    EndGInt   
~EncoInt   declStrn   upmethod As string  flagInt     shrdInt     EndGInt   
}PDefGrup   <  
nameStrn   ImplicitInstanceEncoInt   PValStrn   TrueEndGInt   
PDefGrup   $  
�nameStrn   MenuBar PValStrn    EndGInt   
�PDefGrup   (  
�nameStrn   	MacProcID   PValInt     EndGInt   
�PDefGrup   0  
�nameStrn   MinimizeButton  PValStrn   TrueEndGInt   
�PDefGrup   4  
�nameStrn   MaximizeButton  PValStrn   False   EndGInt   
�PDefGrup   ,  
�nameStrn   
LiveResize  PValStrn   TrueEndGInt   
�PDefGrup   ,  
�nameStrn   
Resizeable  PValStrn   TrueEndGInt   
�PDefGrup   ,  
�nameStrn   CloseButton PValStrn   TrueEndGInt   
�PDefGrup   0  
�nameStrn   MenuBarVisible  PValStrn   TrueEndGInt   
�PDefGrup   0  
�nameStrn   
FullScreen  PValStrn   False   EndGInt   
�PDefGrup   (  
�nameStrn   Visible PValStrn   TrueEndGInt   
�PDefGrup   8  
�nameStrn   Title   EncoInt   PValStrn   UntitledEndGInt   
�PDefGrup   $  
�nameStrn   BackdropPValStrn    EndGInt   
�PDefGrup   (  
�nameStrn   	BackColor   PValInt  ���EndGInt   
�PDefGrup   0  
�nameStrn   HasBackColorPValStrn   False   EndGInt   
�PDefGrup   ,  
�nameStrn   	Composite   PValStrn   TrueEndGInt   
�PDefGrup   $  
�nameStrn   Frame   PValInt    EndGInt   
�PDefGrup   (  
�nameStrn   	MaxHeight   PValInt   } EndGInt   
�PDefGrup   $  
�nameStrn   MaxWidthPValInt   } EndGInt   
�PDefGrup   (  
�nameStrn   	MinHeight   PValInt    @EndGInt   
�PDefGrup   $  
�nameStrn   MinWidthPValInt    @EndGInt   
�PDefGrup   $  
�nameStrn   Height  PValInt    �EndGInt   
�PDefGrup   $  
�nameStrn   Width   PValInt   EndGInt   
�PDefGrup   (  
�nameStrn   	Placement   PValInt     EndGInt   
�VwBhGrup  �  
�VwPrGrup   D  
�NameStrn   NameVsblInt    PrGpStrn   ID  CPifStrn   Window  EndGInt   
�VwPrGrup   L  
�NameStrn   
Interfaces  VsblInt    PrGpStrn   ID  CPifStrn   Window  EndGInt   
�VwPrGrup   H  
�NameStrn   Super   VsblInt    PrGpStrn   ID  CPifStrn   Window  EndGInt   
�VwPrGrup  0  
�NameStrn   	Placement   VsblInt    PrGpStrn   PositionPValStrn   0   typeStrn   Integer vbETStrn   EnumCPifStrn   Window  EnumGrup   �  
�defnStrn   0 - Default defnStrn   1 - Parent Window   defnStrn   2 - Main Screen defnStrn   3 - Parent Window ScreendefnStrn   4 - Stagger EndGInt   
�EndGInt   
�VwPrGrup   p  
�NameStrn   Width   VsblInt    PrGpStrn   PositionPValStrn   600 typeStrn   Integer CPifStrn   Window  EndGInt   
�VwPrGrup   p  
�NameStrn   Height  VsblInt    PrGpStrn   PositionPValStrn   400 typeStrn   Integer CPifStrn   Window  EndGInt   
�VwPrGrup   p  
�NameStrn   MinWidthVsblInt    PrGpStrn   PositionPValStrn   64  typeStrn   Integer CPifStrn   Window  EndGInt   
�VwPrGrup   t  
�NameStrn   	MinHeight   VsblInt    PrGpStrn   PositionPValStrn   64  typeStrn   Integer CPifStrn   Window  EndGInt   
�VwPrGrup   t  
�NameStrn   MaxWidthVsblInt    PrGpStrn   PositionPValStrn   32000   typeStrn   Integer CPifStrn   Window  EndGInt   
�VwPrGrup   x  
�NameStrn   	MaxHeight   VsblInt    PrGpStrn   PositionPValStrn   32000   typeStrn   Integer CPifStrn   Window  EndGInt   
�VwPrGrup    
�NameStrn   Frame   VsblInt    PrGpStrn   
Appearance  PValStrn   0   typeStrn   Integer vbETStrn   EnumCPifStrn   Window  EnumGrup  p  
�defnStrn   0 - DocumentdefnStrn   1 - Movable Modal   defnStrn   2 - Modal DialogdefnStrn   3 - Floating Window defnStrn   4 - Plain Box   defnStrn   5 - Shadowed BoxdefnStrn   6 - Rounded Window  defnStrn   7 - Global Floating Window  defnStrn   8 - Sheet WindowdefnStrn   9 - Metal WindowdefnStrn   10 - Drawer Window  defnStrn   11 - Modeless DialogEndGInt   
�EndGInt   
�VwPrGrup   |  
�NameStrn   	Composite   VsblInt    PrGpStrn   
Appearance  PValStrn   False   typeStrn   Boolean CPifStrn   Window  EndGInt   
�VwPrGrup   |  
�NameStrn   HasBackColorVsblInt    PrGpStrn   
Appearance  PValStrn   False   typeStrn   Boolean CPifStrn   Window  EndGInt   
�VwPrGrup   |  
�NameStrn   	BackColor   VsblInt    PrGpStrn   
Appearance  PValStrn   &hFFFFFFtypeStrn   Color   CPifStrn   Window  EndGInt   
�VwPrGrup   x  
�NameStrn   BackdropVsblInt    PrGpStrn   
Appearance  typeStrn   Picture vbETStrn   Picture CPifStrn   Window  EndGInt   
�VwPrGrup   x  
�NameStrn   Title   VsblInt    PrGpStrn   
Appearance  PValStrn   UntitledtypeStrn   String  CPifStrn   Window  EndGInt   
�VwPrGrup   t  
�NameStrn   Visible VsblInt    PrGpStrn   
Appearance  PValStrn   TruetypeStrn   Boolean CPifStrn   Window  EndGInt   
�VwPrGrup   |  
�NameStrn   
FullScreen  VsblInt    PrGpStrn   
Appearance  PValStrn   False   typeStrn   Boolean CPifStrn   Window  EndGInt   
�VwPrGrup   |  
�NameStrn   MenuBarVisible  VsblInt    PrGpStrn   
Appearance  PValStrn   TruetypeStrn   Boolean CPifStrn   Window  EndGInt   
�VwPrGrup   x  
�NameStrn   CloseButton VsblInt    PrGpStrn   
Appearance  PValStrn   TruetypeStrn   Boolean CPifStrn   Window  EndGInt   
�VwPrGrup   x  
�NameStrn   
Resizeable  VsblInt    PrGpStrn   
Appearance  PValStrn   TruetypeStrn   Boolean CPifStrn   Window  EndGInt   
�VwPrGrup   x  
�NameStrn   
LiveResize  VsblInt    PrGpStrn   
Appearance  PValStrn   TruetypeStrn   Boolean CPifStrn   Window  EndGInt   
�VwPrGrup   �  
�NameStrn   MaximizeButton  VsblInt    PrGpStrn   
Appearance  PValStrn   False   typeStrn   Boolean CPifStrn   Window  EndGInt   
�VwPrGrup   |  
�NameStrn   MinimizeButton  VsblInt    PrGpStrn   
Appearance  PValStrn   TruetypeStrn   Boolean CPifStrn   Window  EndGInt   
�VwPrGrup   x  
�NameStrn   	MacProcID   VsblInt    PrGpStrn   
Appearance  PValStrn   0   typeStrn   Integer CPifStrn   Window  EndGInt   
�VwPrGrup   x  
�NameStrn   MenuBar VsblInt    PrGpStrn   
Appearance  typeStrn   MenuBar vbETStrn   MenuBar CPifStrn   Window  EndGInt   
�VwPrGrup   |  
�NameStrn   ImplicitInstanceVsblInt    PrGpStrn   
Appearance  PValStrn   TruevbETStrn   Boolean CPifStrn   Window  EndGInt   
�VwPrGrup   P  
�NameStrn   doitPrGpStrn   BehaviorPValStrn   false   typeStrn   boolean EndGInt   
�VwPrGrup   \  
�NameStrn   AniID   PrGpStrn   BehaviortypeStrn   string  vbETStrn   MultiLineEditor EndGInt   
�VwPrGrup   `  
�NameStrn   	anistatus   PrGpStrn   BehaviortypeStrn   string  vbETStrn   MultiLineEditor EndGInt   
�VwPrGrup   `  
�NameStrn   	titleprob   PrGpStrn   BehaviortypeStrn   string  vbETStrn   MultiLineEditor EndGInt   
�VwPrGrup   `  
�NameStrn   listedaniid PrGpStrn   BehaviortypeStrn   string  vbETStrn   MultiLineEditor EndGInt   
�VwPrGrup   \  
�NameStrn   upmethodPrGpStrn   BehaviortypeStrn   string  vbETStrn   MultiLineEditor EndGInt   
�EndGInt   
�CBhvGrup     
�SuprStrn   
StaticText  EndGInt   
�CBhvGrup     
�SuprStrn   	PopupMenu   EndGInt   
�CBhvGrup     
�SuprStrn   
StaticText  EndGInt   
�CBhvGrup     
�SuprStrn   
StaticText  EndGInt   
�CBhvGrup  �  
�SuprStrn   	TextField   HInsGrup  �  
�nameStrn   KeyDown CompStrn    VsblInt    sorcGrup  \  
�EncoInt   srclStrn   *Function KeyDown(Key As String) As Boolean  srclStrn   cif instr("0123456789."+chr(28)+ chr(29)+ chr(30)+ chr(31)+chr(3)+chr(9)+chr(10)+chr(8),key)>-1 then srclStrn   %// handle specific keys from our list   srclStrn   elsesrclStrn   // ignore the key   srclStrn   return true srclStrn   end srclStrn   End FunctionEndGInt   
�EndGInt   
�EndGInt   
�CBhvGrup     
�SuprStrn   
StaticText  EndGInt   
�CBhvGrup     
�SuprStrn   	PopupMenu   EndGInt   
�CBhvGrup  d  
�SuprStrn   
PushButton  HInsGrup  0  
�nameStrn   Action  CompStrn    VsblInt    sorcGrup  
�  
�EncoInt   srclStrn   Sub Action()srclStrn   .// Make sure you have valid update information  srclStrn   If upmethod = "Update" then srclStrn   #If anistatus = "Not yet aired" then srclStrn   UIf status.text = "plan to watch" and epiwatched.text = "0"  and score.text = "0" then   srclStrn   
updateinfo  srclStrn   elsesrclStrn   �app.errboxshow("Cannot Update Status.", "You cannot set the status, score, or episodes to anything else but plan to watch since this series haven't aired yet.")srclStrn   end if  srclStrn   *Elseif anistatus = "currently airing" then  srclStrn   !If status.text = "completed" then   srclStrn   sapp.errboxshow("Cannot Update Status.", "You cannot set the status as completed since the series is still airing.") srclStrn   elsesrclStrn   If eptotal.text = "0" then  srclStrn   
updateinfo  srclStrn   elsesrclStrn   1If val(epiwatched.text) > val(eptotal.text)  then   srclStrn   sapp.errboxshow("There is a problem adding a Anime series!", "Invalid Episode number, please enter a valid number.") srclStrn   elsesrclStrn   
updateinfo  srclStrn   end if  srclStrn   end if  srclStrn   end if  srclStrn   elsesrclStrn   1If val(epiwatched.text) > val(eptotal.text)  then   srclStrn   sapp.errboxshow("There is a problem adding a Anime series!", "Invalid Episode number, please enter a valid number.") srclStrn   elsesrclStrn   
updateinfo  srclStrn   end if  srclStrn   end if  srclStrn   ElseIf upMethod = "Add" thensrclStrn   #If anistatus = "Not yet aired" then srclStrn   UIf status.text = "plan to watch" and epiwatched.text = "0"  and score.text = "0" then   srclStrn   	addseries   srclStrn   elsesrclStrn   �app.errboxshow("Cannot Add Series", "You cannot set the status, score, or episodes to anything else but plan to watch since this series haven't aired yet.")srclStrn   end if  srclStrn   *Elseif anistatus = "currently airing" then  srclStrn   !If status.text = "completed" then   srclStrn   sapp.errboxshow("Cannot Update Status.", "You cannot set the status as completed since the series is still airing.") srclStrn   elsesrclStrn   If eptotal.text = "0" then  srclStrn   	addseries   srclStrn   elsesrclStrn   1If val(epiwatched.text) > val(eptotal.text)  then   srclStrn   sapp.errboxshow("There is a problem adding a Anime series!", "Invalid Episode number, please enter a valid number.") srclStrn   elsesrclStrn   	addseries   srclStrn   end if  srclStrn   end if  srclStrn   end if  srclStrn   elsesrclStrn   1If val(epiwatched.text) > val(eptotal.text)  then   srclStrn   sapp.errboxshow("There is a problem adding a Anime series!", "Invalid Episode number, please enter a valid number.") srclStrn   elsesrclStrn   	addseries   srclStrn   end if  srclStrn   end if  srclStrn   end if  srclStrn   End Sub EndGInt   
�EndGInt   
�EndGInt   
�CBhvGrup   �  
�SuprStrn   
PushButton  HInsGrup   �  
�nameStrn   Action  CompStrn    VsblInt    sorcGrup   d  
�EncoInt   srclStrn   Sub Action()srclStrn   
doIt=false  srclStrn   hidesrclStrn   End Sub EndGInt   
�EndGInt   
�EndGInt   
�CBhvGrup     
�SuprStrn   
StaticText  EndGInt   
�CBhvGrup     
�SuprStrn   
StaticText  EndGInt   
�CBhvGrup     
�SuprStrn   
HTTPSocket  EndGInt   
�CBhvGrup      
�SuprStrn   ProgressWheel   EndGInt   
�CBhvGrup     
�SuprStrn   
StaticText  EndGInt   
�CBhvGrup     
�SuprStrn   	TextField   EndGInt   
�CBhvGrup    
�SuprStrn   
PushButton  HInsGrup   �  
�nameStrn   Action  CompStrn    VsblInt    sorcGrup   �  
�EncoInt   srclStrn   Sub Action()srclStrn   Dshowurl "http://myanimelist.net/panel.php?go=edit&id=" + listedaniidsrclStrn   End Sub EndGInt   
�EndGInt   
�EndGInt   
�CBhvGrup  �  
�SuprStrn   UpDownArrowsHInsGrup    
�nameStrn   DownCompStrn    VsblInt    sorcGrup   �  
�EncoInt   srclStrn   
Sub Down()  srclStrn    if val(epiwatched.text) > 0 thensrclStrn   .epiwatched.text = cstr(val(epiwatched.text)-1)  srclStrn   elsesrclStrn   beepsrclStrn   end if  srclStrn   End Sub EndGInt   
�EndGInt   
�HInsGrup  (  
�nameStrn   Up  CompStrn    VsblInt    sorcGrup   �  
�EncoInt   srclStrn   Sub Up()srclStrn   0if val(epiwatched.text) < val(eptotal.text) thensrclStrn   .epiwatched.text = cstr(val(epiwatched.text)+1)  srclStrn   elsesrclStrn   beepsrclStrn   end if  srclStrn   End Sub EndGInt   
�EndGInt   
�EndGInt   
�CtrlGrup  T  
�cclsStrn   
StaticText  nameStrn   
StaticText  PDefGrup   8  
�nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   
�PDefGrup   4  
�nameStrn   	DataField   EncoInt    PValStrn    EndGInt   
�PDefGrup   4  
�nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   
�PDefGrup   (  
�nameStrn   	Underline   PValStrn    EndGInt   
�PDefGrup   $  
�nameStrn   Italic  PValStrn    EndGInt   
�PDefGrup   $  
�nameStrn   BoldPValStrn   TrueEndGInt   
�PDefGrup   (  
�nameStrn   TextUnitPValStrn   0   EndGInt   
�PDefGrup   (  
�nameStrn   TextSizePValStrn   0   EndGInt   
�PDefGrup   8  
�nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   
�PDefGrup   0  
�nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   
�PDefGrup   0  
�nameStrn   HelpTag EncoInt    PValStrn    EndGInt   
�PDefGrup   (  
�nameStrn   Visible PValStrn   TrueEndGInt   
�PDefGrup   (  
�nameStrn   Enabled PValStrn   TrueEndGInt   
�PDefGrup   ,  
�nameStrn   	Multiline   PValStrn   TrueEndGInt   
�PDefGrup   (  
�nameStrn   	TextColor   PValInt     EndGInt   
�PDefGrup   (  
�nameStrn   	TextAlign   PValInt     EndGInt   
�PDefGrup   ,  
�nameStrn   TextEncoInt    PValStrn    EndGInt   
�PDefGrup   $  
�nameStrn   TabIndexPValInt     EndGInt   
�PDefGrup   ,  
�nameStrn   TabPanelIndex   PValInt     EndGInt   
�PDefGrup   (  
�nameStrn   
LockBottom  PValStrn    EndGInt   
�PDefGrup   (  
�nameStrn   	LockRight   PValStrn    EndGInt   
�PDefGrup   $  
�nameStrn   LockTop PValStrn    EndGInt   
�PDefGrup   $  
�nameStrn   LockLeftPValStrn    EndGInt   
�PDefGrup   $  
�nameStrn   Height  PValInt    EndGInt   
�PDefGrup   $  
�nameStrn   Width   PValInt   �EndGInt   
�PDefGrup      
�nameStrn   Top PValInt    EndGInt   
�PDefGrup      
�nameStrn   LeftPValInt    EndGInt   
�PDefGrup   (  
�nameStrn   Scope   PValStrn   0   EndGInt   
�PDefGrup   <  
�nameStrn   Super   EncoInt   PValStrn   
StaticText  EndGInt   
�PDefGrup   $  
�nameStrn   Index   PValInt �   EndGInt   
�PDefGrup   8  
�nameStrn   NameEncoInt   PValStrn   seriestitle EndGInt   
�CBixInt     iLckInt     EndGInt   
�CtrlGrup  @  
�cclsStrn   	PopupMenu   nameStrn   	PopupMenu   PDefGrup   8  
�nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   
�PDefGrup   4  
�nameStrn   	DataField   EncoInt    PValStrn    EndGInt   
�PDefGrup   4  
�nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   
�PDefGrup   (  
�nameStrn   	Underline   PValStrn    EndGInt   
�PDefGrup   $  
�nameStrn   Italic  PValStrn    EndGInt   
�PDefGrup      
�nameStrn   BoldPValStrn    EndGInt   
�PDefGrup   (  
�nameStrn   TextUnitPValStrn   0   EndGInt   
�PDefGrup   (   nameStrn   TextSizePValStrn   0   EndGInt    PDefGrup   8  nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   PDefGrup   0  nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   PDefGrup   0  nameStrn   HelpTag EncoInt    PValStrn    EndGInt   PDefGrup   (  nameStrn   Visible PValStrn   TrueEndGInt   PDefGrup   (  nameStrn   	ListIndex   PValInt     EndGInt   PDefGrup   d  nameStrn   InitialValueEncoInt   PValStrn   0watchingcompletedon-holddroppedplan to watchEndGInt   PDefGrup   (  nameStrn   Enabled PValStrn   TrueEndGInt   PDefGrup   (  nameStrn   TabStop PValStrn   TrueEndGInt   PDefGrup   $  	nameStrn   TabIndexPValInt    EndGInt   	PDefGrup   ,  
nameStrn   TabPanelIndex   PValInt     EndGInt   
PDefGrup   (  nameStrn   
LockBottom  PValStrn    EndGInt   PDefGrup   (  nameStrn   	LockRight   PValStrn    EndGInt   PDefGrup   $  nameStrn   LockTop PValStrn    EndGInt   PDefGrup   $  nameStrn   LockLeftPValStrn    EndGInt   PDefGrup   $  nameStrn   Height  PValInt    EndGInt   PDefGrup   $  nameStrn   Width   PValInt    �EndGInt   PDefGrup      nameStrn   Top PValInt    -EndGInt   PDefGrup      nameStrn   LeftPValInt    yEndGInt   PDefGrup   (  nameStrn   Scope   PValStrn   0   EndGInt   PDefGrup   <  nameStrn   Super   EncoInt   PValStrn   	PopupMenu   EndGInt   PDefGrup   $  nameStrn   Index   PValInt �   EndGInt   PDefGrup   4  nameStrn   NameEncoInt   PValStrn   status  EndGInt   CBixInt    iLckInt     EndGInt   
�CtrlGrup  T  cclsStrn   
StaticText  nameStrn   
StaticText  PDefGrup   8  nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   PDefGrup   4  nameStrn   	DataField   EncoInt    PValStrn    EndGInt   PDefGrup   4  nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   PDefGrup   (  nameStrn   	Underline   PValStrn    EndGInt   PDefGrup   $  nameStrn   Italic  PValStrn    EndGInt   PDefGrup      nameStrn   BoldPValStrn    EndGInt   PDefGrup   (  nameStrn   TextUnitPValStrn   0   EndGInt   PDefGrup   (  nameStrn   TextSizePValStrn   0   EndGInt   PDefGrup   8   nameStrn   TextFontEncoInt   PValStrn   System  EndGInt    PDefGrup   0  !nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   !PDefGrup   0  "nameStrn   HelpTag EncoInt    PValStrn    EndGInt   "PDefGrup   (  #nameStrn   Visible PValStrn   TrueEndGInt   #PDefGrup   (  $nameStrn   Enabled PValStrn   TrueEndGInt   $PDefGrup   (  %nameStrn   	Multiline   PValStrn    EndGInt   %PDefGrup   (  &nameStrn   	TextColor   PValInt     EndGInt   &PDefGrup   (  'nameStrn   	TextAlign   PValInt     EndGInt   'PDefGrup   4  (nameStrn   TextEncoInt   PValStrn   Status: EndGInt   (PDefGrup   $  )nameStrn   TabIndexPValInt    EndGInt   )PDefGrup   ,  *nameStrn   TabPanelIndex   PValInt     EndGInt   *PDefGrup   (  +nameStrn   
LockBottom  PValStrn    EndGInt   +PDefGrup   (  ,nameStrn   	LockRight   PValStrn    EndGInt   ,PDefGrup   $  -nameStrn   LockTop PValStrn    EndGInt   -PDefGrup   $  .nameStrn   LockLeftPValStrn    EndGInt   .PDefGrup   $  /nameStrn   Height  PValInt    EndGInt   /PDefGrup   $  0nameStrn   Width   PValInt    dEndGInt   0PDefGrup      1nameStrn   Top PValInt    -EndGInt   1PDefGrup      2nameStrn   LeftPValInt    EndGInt   2PDefGrup   (  3nameStrn   Scope   PValStrn   0   EndGInt   3PDefGrup   <  4nameStrn   Super   EncoInt   PValStrn   
StaticText  EndGInt   4PDefGrup   $  5nameStrn   Index   PValInt �   EndGInt   5PDefGrup   8  6nameStrn   NameEncoInt   PValStrn   StaticText2 EndGInt   6CBixInt    iLckInt     EndGInt   CtrlGrup  X  7cclsStrn   
StaticText  nameStrn   
StaticText  PDefGrup   8  8nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   8PDefGrup   4  9nameStrn   	DataField   EncoInt    PValStrn    EndGInt   9PDefGrup   4  :nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   :PDefGrup   (  ;nameStrn   	Underline   PValStrn    EndGInt   ;PDefGrup   $  <nameStrn   Italic  PValStrn    EndGInt   <PDefGrup      =nameStrn   BoldPValStrn    EndGInt   =PDefGrup   (  >nameStrn   TextUnitPValStrn   0   EndGInt   >PDefGrup   (  ?nameStrn   TextSizePValStrn   0   EndGInt   ?PDefGrup   8  @nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   @PDefGrup   0  AnameStrn   AutoDeactivate  PValStrn   TrueEndGInt   APDefGrup   0  BnameStrn   HelpTag EncoInt    PValStrn    EndGInt   BPDefGrup   (  CnameStrn   Visible PValStrn   TrueEndGInt   CPDefGrup   (  DnameStrn   Enabled PValStrn   TrueEndGInt   DPDefGrup   (  EnameStrn   	Multiline   PValStrn    EndGInt   EPDefGrup   (  FnameStrn   	TextColor   PValInt     EndGInt   FPDefGrup   (  GnameStrn   	TextAlign   PValInt     EndGInt   GPDefGrup   8  HnameStrn   TextEncoInt   PValStrn   	Episodes:   EndGInt   HPDefGrup   $  InameStrn   TabIndexPValInt    EndGInt   IPDefGrup   ,  JnameStrn   TabPanelIndex   PValInt     EndGInt   JPDefGrup   (  KnameStrn   
LockBottom  PValStrn    EndGInt   KPDefGrup   (  LnameStrn   	LockRight   PValStrn    EndGInt   LPDefGrup   $  MnameStrn   LockTop PValStrn    EndGInt   MPDefGrup   $  NnameStrn   LockLeftPValStrn    EndGInt   NPDefGrup   $  OnameStrn   Height  PValInt    EndGInt   OPDefGrup   $  PnameStrn   Width   PValInt    dEndGInt   PPDefGrup      QnameStrn   Top PValInt    MEndGInt   QPDefGrup      RnameStrn   LeftPValInt    EndGInt   RPDefGrup   (  SnameStrn   Scope   PValStrn   0   EndGInt   SPDefGrup   <  TnameStrn   Super   EncoInt   PValStrn   
StaticText  EndGInt   TPDefGrup   $  UnameStrn   Index   PValInt �   EndGInt   UPDefGrup   8  VnameStrn   NameEncoInt   PValStrn   StaticText3 EndGInt   VCBixInt    iLckInt     EndGInt   7CtrlGrup  
�  WcclsStrn   	TextField   nameStrn   	TextField   PDefGrup   8  XnameStrn   InitialParent   EncoInt    PValStrn    EndGInt   XPDefGrup   4  YnameStrn   	DataField   EncoInt    PValStrn    EndGInt   YPDefGrup   4  ZnameStrn   
DataSource  EncoInt    PValStrn    EndGInt   ZPDefGrup   (  [nameStrn   	Alignment   PValInt     EndGInt   [PDefGrup   (  \nameStrn   
AcceptTabs  PValStrn    EndGInt   \PDefGrup   (  ]nameStrn   	LimitText   PValInt     EndGInt   ]PDefGrup   $  ^nameStrn   ReadOnlyPValStrn    EndGInt   ^PDefGrup   0  _nameStrn   MaskEncoInt   PValStrn   ### EndGInt   _PDefGrup   ,  `nameStrn   TextEncoInt    PValStrn    EndGInt   `PDefGrup   0  anameStrn   CueText EncoInt    PValStrn    EndGInt   aPDefGrup   (  bnameStrn   	Underline   PValStrn    EndGInt   bPDefGrup   $  cnameStrn   Italic  PValStrn    EndGInt   cPDefGrup      dnameStrn   BoldPValStrn    EndGInt   dPDefGrup   (  enameStrn   TextUnitPValStrn   0   EndGInt   ePDefGrup   (  fnameStrn   TextSizePValStrn   0   EndGInt   fPDefGrup   8  gnameStrn   TextFontEncoInt   PValStrn   System  EndGInt   gPDefGrup   0  hnameStrn   AutoDeactivate  PValStrn   TrueEndGInt   hPDefGrup   0  inameStrn   HelpTag EncoInt    PValStrn    EndGInt   iPDefGrup   (  jnameStrn   Visible PValStrn   TrueEndGInt   jPDefGrup   4  knameStrn   Format  EncoInt   PValStrn   ##  EndGInt   kPDefGrup   (  lnameStrn   Enabled PValStrn   TrueEndGInt   lPDefGrup   (  mnameStrn   	BackColor   PValInt  ���EndGInt   mPDefGrup   (  nnameStrn   	TextColor   PValInt     EndGInt   nPDefGrup   ,  onameStrn   UseFocusRingPValStrn   TrueEndGInt   oPDefGrup   $  pnameStrn   PasswordPValStrn    EndGInt   pPDefGrup   (  qnameStrn   Border  PValStrn   TrueEndGInt   qPDefGrup   (  rnameStrn   TabStop PValStrn   TrueEndGInt   rPDefGrup   $  snameStrn   TabIndexPValInt    EndGInt   sPDefGrup   ,  tnameStrn   TabPanelIndex   PValInt     EndGInt   tPDefGrup   (  unameStrn   
LockBottom  PValStrn    EndGInt   uPDefGrup   (  vnameStrn   	LockRight   PValStrn    EndGInt   vPDefGrup   $  wnameStrn   LockTop PValStrn    EndGInt   wPDefGrup   $  xnameStrn   LockLeftPValStrn    EndGInt   xPDefGrup   $  ynameStrn   Height  PValInt    EndGInt   yPDefGrup   $  znameStrn   Width   PValInt    'EndGInt   zPDefGrup      {nameStrn   Top PValInt    MEndGInt   {PDefGrup      |nameStrn   LeftPValInt    yEndGInt   |PDefGrup   (  }nameStrn   Scope   PValStrn   0   EndGInt   }PDefGrup   <  ~nameStrn   Super   EncoInt   PValStrn   	TextField   EndGInt   ~PDefGrup   $  nameStrn   Index   PValInt �   EndGInt   PDefGrup   8  �nameStrn   NameEncoInt   PValStrn   
epiwatched  EndGInt   �CBixInt    iLckInt     EndGInt   WCtrlGrup  T  �cclsStrn   
StaticText  nameStrn   
StaticText  PDefGrup   8  �nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   	DataField   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	Underline   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   Italic  PValStrn    EndGInt   �PDefGrup      �nameStrn   BoldPValStrn    EndGInt   �PDefGrup   (  �nameStrn   TextUnitPValStrn   0   EndGInt   �PDefGrup   (  �nameStrn   TextSizePValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   �PDefGrup   0  �nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   HelpTag EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Visible PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   Enabled PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   	Multiline   PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	TextColor   PValInt     EndGInt   �PDefGrup   (  �nameStrn   	TextAlign   PValInt     EndGInt   �PDefGrup   4  �nameStrn   TextEncoInt   PValStrn   Score   EndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt    dEndGInt   �PDefGrup      �nameStrn   Top PValInt    nEndGInt   �PDefGrup      �nameStrn   LeftPValInt    EndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   <  �nameStrn   Super   EncoInt   PValStrn   
StaticText  EndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   8  �nameStrn   NameEncoInt   PValStrn   StaticText4 EndGInt   �CBixInt    iLckInt     EndGInt   �CtrlGrup  (  �cclsStrn   	PopupMenu   nameStrn   	PopupMenu   PDefGrup   8  �nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   	DataField   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	Underline   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   Italic  PValStrn    EndGInt   �PDefGrup      �nameStrn   BoldPValStrn    EndGInt   �PDefGrup   (  �nameStrn   TextUnitPValStrn   0   EndGInt   �PDefGrup   (  �nameStrn   TextSizePValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   �PDefGrup   0  �nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   HelpTag EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Visible PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   	ListIndex   PValInt     EndGInt   �PDefGrup   L  �nameStrn   InitialValueEncoInt   PValStrn   012345678910  EndGInt   �PDefGrup   (  �nameStrn   Enabled PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   TabStop PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt    EEndGInt   �PDefGrup      �nameStrn   Top PValInt    nEndGInt   �PDefGrup      �nameStrn   LeftPValInt    yEndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   <  �nameStrn   Super   EncoInt   PValStrn   	PopupMenu   EndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   4  �nameStrn   NameEncoInt   PValStrn   score   EndGInt   �CBixInt    iLckInt     EndGInt   �CtrlGrup  �  �cclsStrn   
PushButton  nameStrn   
PushButton  PDefGrup   8  �nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	Underline   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   Italic  PValStrn    EndGInt   �PDefGrup      �nameStrn   BoldPValStrn    EndGInt   �PDefGrup   (  �nameStrn   TextUnitPValStrn   0   EndGInt   �PDefGrup   (  �nameStrn   TextSizePValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   �PDefGrup   0  �nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   HelpTag EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Visible PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   Enabled PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   Cancel  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Default PValStrn   TrueEndGInt   �PDefGrup   8  �nameStrn   Caption EncoInt   PValStrn   Update  EndGInt   �PDefGrup   (  �nameStrn   TabStop PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt    PEndGInt   �PDefGrup      �nameStrn   Top PValInt    �EndGInt   �PDefGrup      �nameStrn   LeftPValInt   �EndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   <  �nameStrn   Super   EncoInt   PValStrn   
PushButton  EndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   8  �nameStrn   NameEncoInt   PValStrn   	updatebut   EndGInt   �CBixInt    iLckInt     EndGInt   �CtrlGrup  �  �cclsStrn   
PushButton  nameStrn   
PushButton  PDefGrup   8  �nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	Underline   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   Italic  PValStrn    EndGInt   �PDefGrup      �nameStrn   BoldPValStrn    EndGInt   �PDefGrup   (  �nameStrn   TextUnitPValStrn   0   EndGInt   �PDefGrup   (  �nameStrn   TextSizePValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   �PDefGrup   0  �nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   HelpTag EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Visible PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   Enabled PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   Cancel  PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   Default PValStrn    EndGInt   �PDefGrup   8  �nameStrn   Caption EncoInt   PValStrn   Cancel  EndGInt   �PDefGrup   (  �nameStrn   TabStop PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    	EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt    PEndGInt   �PDefGrup      �nameStrn   Top PValInt    �EndGInt   �PDefGrup      �nameStrn   LeftPValInt   TEndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   <  �nameStrn   Super   EncoInt   PValStrn   
PushButton  EndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   8  �nameStrn   NameEncoInt   PValStrn   PushButton2 EndGInt   �CBixInt    iLckInt     EndGInt   �CtrlGrup  T  �cclsStrn   
StaticText  nameStrn   
StaticText  PDefGrup   8  �nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   	DataField   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   �PDefGrup   (   nameStrn   	Underline   PValStrn    EndGInt    PDefGrup   $  nameStrn   Italic  PValStrn    EndGInt   PDefGrup      nameStrn   BoldPValStrn    EndGInt   PDefGrup   (  nameStrn   TextUnitPValStrn   0   EndGInt   PDefGrup   (  nameStrn   TextSizePValStrn   0   EndGInt   PDefGrup   8  nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   PDefGrup   0  nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   PDefGrup   0  nameStrn   HelpTag EncoInt    PValStrn    EndGInt   PDefGrup   (  nameStrn   Visible PValStrn   TrueEndGInt   PDefGrup   (  	nameStrn   Enabled PValStrn   TrueEndGInt   	PDefGrup   (  
nameStrn   	Multiline   PValStrn    EndGInt   
PDefGrup   (  nameStrn   	TextColor   PValInt     EndGInt   PDefGrup   (  nameStrn   	TextAlign   PValInt     EndGInt   PDefGrup   4  nameStrn   TextEncoInt   PValStrn   out of  EndGInt   PDefGrup   $  nameStrn   TabIndexPValInt    
EndGInt   PDefGrup   ,  nameStrn   TabPanelIndex   PValInt     EndGInt   PDefGrup   (  nameStrn   
LockBottom  PValStrn    EndGInt   PDefGrup   (  nameStrn   	LockRight   PValStrn    EndGInt   PDefGrup   $  nameStrn   LockTop PValStrn    EndGInt   PDefGrup   $  nameStrn   LockLeftPValStrn    EndGInt   PDefGrup   $  nameStrn   Height  PValInt    EndGInt   PDefGrup   $  nameStrn   Width   PValInt    )EndGInt   PDefGrup      nameStrn   Top PValInt    MEndGInt   PDefGrup      nameStrn   LeftPValInt    �EndGInt   PDefGrup   (  nameStrn   Scope   PValStrn   0   EndGInt   PDefGrup   <  nameStrn   Super   EncoInt   PValStrn   
StaticText  EndGInt   PDefGrup   $  nameStrn   Index   PValInt �   EndGInt   PDefGrup   8  nameStrn   NameEncoInt   PValStrn   StaticText5 EndGInt   CBixInt    	iLckInt     EndGInt   �CtrlGrup  H  cclsStrn   
StaticText  nameStrn   
StaticText  PDefGrup   8  nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   PDefGrup   4  nameStrn   	DataField   EncoInt    PValStrn    EndGInt   PDefGrup   4  nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   PDefGrup   (   nameStrn   	Underline   PValStrn    EndGInt    PDefGrup   $  !nameStrn   Italic  PValStrn    EndGInt   !PDefGrup      "nameStrn   BoldPValStrn    EndGInt   "PDefGrup   (  #nameStrn   TextUnitPValStrn   0   EndGInt   #PDefGrup   (  $nameStrn   TextSizePValStrn   0   EndGInt   $PDefGrup   8  %nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   %PDefGrup   0  &nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   &PDefGrup   0  'nameStrn   HelpTag EncoInt    PValStrn    EndGInt   'PDefGrup   (  (nameStrn   Visible PValStrn   TrueEndGInt   (PDefGrup   (  )nameStrn   Enabled PValStrn   TrueEndGInt   )PDefGrup   (  *nameStrn   	Multiline   PValStrn    EndGInt   *PDefGrup   (  +nameStrn   	TextColor   PValInt     EndGInt   +PDefGrup   (  ,nameStrn   	TextAlign   PValInt     EndGInt   ,PDefGrup   ,  -nameStrn   TextEncoInt    PValStrn    EndGInt   -PDefGrup   $  .nameStrn   TabIndexPValInt    EndGInt   .PDefGrup   ,  /nameStrn   TabPanelIndex   PValInt     EndGInt   /PDefGrup   (  0nameStrn   
LockBottom  PValStrn    EndGInt   0PDefGrup   (  1nameStrn   	LockRight   PValStrn    EndGInt   1PDefGrup   $  2nameStrn   LockTop PValStrn    EndGInt   2PDefGrup   $  3nameStrn   LockLeftPValStrn    EndGInt   3PDefGrup   $  4nameStrn   Height  PValInt    EndGInt   4PDefGrup   $  5nameStrn   Width   PValInt    +EndGInt   5PDefGrup      6nameStrn   Top PValInt    MEndGInt   6PDefGrup      7nameStrn   LeftPValInt    �EndGInt   7PDefGrup   (  8nameStrn   Scope   PValStrn   0   EndGInt   8PDefGrup   <  9nameStrn   Super   EncoInt   PValStrn   
StaticText  EndGInt   9PDefGrup   $  :nameStrn   Index   PValInt �   EndGInt   :PDefGrup   4  ;nameStrn   NameEncoInt   PValStrn   eptotal EndGInt   ;CBixInt    
iLckInt     EndGInt   CtrlGrup  �  <cclsStrn   
HTTPSocket  nameStrn   
HTTPSocket  PDefGrup   $  =nameStrn   Width   PValInt     EndGInt   =PDefGrup   $  >nameStrn   Height  PValInt     EndGInt   >PDefGrup   <  ?nameStrn   TabPanelIndex   EncoInt   PValStrn   0   EndGInt   ?PDefGrup   (  @nameStrn   yield   PValStrn   0   EndGInt   @PDefGrup      AnameStrn   PortPValInt     EndGInt   APDefGrup   0  BnameStrn   Address EncoInt    PValStrn    EndGInt   BPDefGrup   0  CnameStrn   Top EncoInt   PValStrn   85  EndGInt   CPDefGrup   0  DnameStrn   LeftEncoInt   PValStrn   418 EndGInt   DPDefGrup   (  EnameStrn   Scope   PValStrn   0   EndGInt   EPDefGrup   <  FnameStrn   Super   EncoInt   PValStrn   
HTTPSocket  EndGInt   FPDefGrup   $  GnameStrn   Index   PValInt �   EndGInt   GPDefGrup   4  HnameStrn   NameEncoInt   PValStrn   Socket1 EndGInt   HCBixInt    iLckInt     EndGInt   <CtrlGrup  �  IcclsStrn   ProgressWheel   nameStrn   ProgressWheel   PDefGrup   (  JnameStrn   Enabled PValStrn   TrueEndGInt   JPDefGrup   0  KnameStrn   AutoDeactivate  PValStrn   TrueEndGInt   KPDefGrup   0  LnameStrn   HelpTag EncoInt    PValStrn    EndGInt   LPDefGrup   ,  MnameStrn   Visible PValStrn   False   EndGInt   MPDefGrup   8  NnameStrn   InitialParent   EncoInt    PValStrn    EndGInt   NPDefGrup   (  OnameStrn   TabStop PValStrn   TrueEndGInt   OPDefGrup   $  PnameStrn   TabIndexPValInt    EndGInt   PPDefGrup   ,  QnameStrn   TabPanelIndex   PValInt     EndGInt   QPDefGrup   (  RnameStrn   
LockBottom  PValStrn    EndGInt   RPDefGrup   (  SnameStrn   	LockRight   PValStrn    EndGInt   SPDefGrup   $  TnameStrn   LockTop PValStrn    EndGInt   TPDefGrup   $  UnameStrn   LockLeftPValStrn    EndGInt   UPDefGrup   $  VnameStrn   Height  PValInt    EndGInt   VPDefGrup   $  WnameStrn   Width   PValInt    EndGInt   WPDefGrup      XnameStrn   Top PValInt    �EndGInt   XPDefGrup      YnameStrn   LeftPValInt    EndGInt   YPDefGrup   (  ZnameStrn   Scope   PValStrn   0   EndGInt   ZPDefGrup   @  [nameStrn   Super   EncoInt   PValStrn   ProgressWheel   EndGInt   [PDefGrup   $  \nameStrn   Index   PValInt �   EndGInt   \PDefGrup   <  ]nameStrn   NameEncoInt   PValStrn   ProgressWheel1  EndGInt   ]CBixInt    iLckInt     EndGInt   ICtrlGrup  \  ^cclsStrn   
StaticText  nameStrn   
StaticText  PDefGrup   8  _nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   _PDefGrup   4  `nameStrn   	DataField   EncoInt    PValStrn    EndGInt   `PDefGrup   4  anameStrn   
DataSource  EncoInt    PValStrn    EndGInt   aPDefGrup   (  bnameStrn   	Underline   PValStrn    EndGInt   bPDefGrup   $  cnameStrn   Italic  PValStrn    EndGInt   cPDefGrup      dnameStrn   BoldPValStrn    EndGInt   dPDefGrup   (  enameStrn   TextUnitPValStrn   0   EndGInt   ePDefGrup   (  fnameStrn   TextSizePValStrn   0   EndGInt   fPDefGrup   8  gnameStrn   TextFontEncoInt   PValStrn   System  EndGInt   gPDefGrup   0  hnameStrn   AutoDeactivate  PValStrn   TrueEndGInt   hPDefGrup   0  inameStrn   HelpTag EncoInt    PValStrn    EndGInt   iPDefGrup   ,  jnameStrn   Visible PValStrn   False   EndGInt   jPDefGrup   (  knameStrn   Enabled PValStrn   TrueEndGInt   kPDefGrup   (  lnameStrn   	Multiline   PValStrn    EndGInt   lPDefGrup   (  mnameStrn   	TextColor   PValInt     EndGInt   mPDefGrup   (  nnameStrn   	TextAlign   PValInt     EndGInt   nPDefGrup   8  onameStrn   TextEncoInt   PValStrn   	Comments:   EndGInt   oPDefGrup   $  pnameStrn   TabIndexPValInt    EndGInt   pPDefGrup   ,  qnameStrn   TabPanelIndex   PValInt     EndGInt   qPDefGrup   (  rnameStrn   
LockBottom  PValStrn    EndGInt   rPDefGrup   (  snameStrn   	LockRight   PValStrn    EndGInt   sPDefGrup   $  tnameStrn   LockTop PValStrn    EndGInt   tPDefGrup   $  unameStrn   LockLeftPValStrn    EndGInt   uPDefGrup   $  vnameStrn   Height  PValInt    EndGInt   vPDefGrup   $  wnameStrn   Width   PValInt    dEndGInt   wPDefGrup      xnameStrn   Top PValInt    �EndGInt   xPDefGrup      ynameStrn   LeftPValInt    EndGInt   yPDefGrup   (  znameStrn   Scope   PValStrn   0   EndGInt   zPDefGrup   <  {nameStrn   Super   EncoInt   PValStrn   
StaticText  EndGInt   {PDefGrup   $  |nameStrn   Index   PValInt �   EndGInt   |PDefGrup   8  }nameStrn   NameEncoInt   PValStrn   commentslbl EndGInt   }CBixInt    iLckInt     EndGInt   ^CtrlGrup  
�  ~cclsStrn   	TextField   nameStrn   	TextField   PDefGrup   8  nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   PDefGrup   4  �nameStrn   	DataField   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	Alignment   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
AcceptTabs  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LimitText   PValInt     EndGInt   �PDefGrup   $  �nameStrn   ReadOnlyPValStrn    EndGInt   �PDefGrup   ,  �nameStrn   MaskEncoInt    PValStrn    EndGInt   �PDefGrup   ,  �nameStrn   TextEncoInt    PValStrn    EndGInt   �PDefGrup   0  �nameStrn   CueText EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	Underline   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   Italic  PValStrn    EndGInt   �PDefGrup      �nameStrn   BoldPValStrn    EndGInt   �PDefGrup   (  �nameStrn   TextUnitPValStrn   0   EndGInt   �PDefGrup   (  �nameStrn   TextSizePValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   �PDefGrup   0  �nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   HelpTag EncoInt    PValStrn    EndGInt   �PDefGrup   ,  �nameStrn   Visible PValStrn   False   EndGInt   �PDefGrup   0  �nameStrn   Format  EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Enabled PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   	BackColor   PValInt  ���EndGInt   �PDefGrup   (  �nameStrn   	TextColor   PValInt     EndGInt   �PDefGrup   ,  �nameStrn   UseFocusRingPValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   PasswordPValStrn    EndGInt   �PDefGrup   (  �nameStrn   Border  PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   TabStop PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt   bEndGInt   �PDefGrup      �nameStrn   Top PValInt    �EndGInt   �PDefGrup      �nameStrn   LeftPValInt    yEndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   <  �nameStrn   Super   EncoInt   PValStrn   	TextField   EndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   <  �nameStrn   NameEncoInt   PValStrn   commentsfield   EndGInt   �CBixInt    iLckInt     EndGInt   ~CtrlGrup  �  �cclsStrn   
PushButton  nameStrn   
PushButton  PDefGrup   8  �nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	Underline   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   Italic  PValStrn    EndGInt   �PDefGrup      �nameStrn   BoldPValStrn    EndGInt   �PDefGrup   (  �nameStrn   TextUnitPValStrn   0   EndGInt   �PDefGrup   (  �nameStrn   TextSizePValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   �PDefGrup   0  �nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   HelpTag EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Visible PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   Enabled PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   Cancel  PValStrn    EndGInt   �PDefGrup   $  �nameStrn   Default PValStrn    EndGInt   �PDefGrup   <  �nameStrn   Caption EncoInt   PValStrn   Edit on MAL EndGInt   �PDefGrup   (  �nameStrn   TabStop PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt    ]EndGInt   �PDefGrup      �nameStrn   Top PValInt    �EndGInt   �PDefGrup      �nameStrn   LeftPValInt    �EndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   <  �nameStrn   Super   EncoInt   PValStrn   
PushButton  EndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   4  �nameStrn   NameEncoInt   PValStrn   EditMAL EndGInt   �CBixInt    iLckInt     EndGInt   �CtrlGrup  �  �cclsStrn   UpDownArrowsnameStrn   UpDownArrowsPDefGrup   0  �nameStrn   AcceptFocus PValStrn   False   EndGInt   �PDefGrup   (  �nameStrn   Enabled PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   HelpTag EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Visible PValStrn   TrueEndGInt   �PDefGrup   8  �nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   TabStop PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt    EndGInt   �PDefGrup      �nameStrn   Top PValInt    MEndGInt   �PDefGrup      �nameStrn   LeftPValInt    �EndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   <  �nameStrn   Super   EncoInt   PValStrn   UpDownArrowsEndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   <  �nameStrn   NameEncoInt   PValStrn   UpDownArrows1   EndGInt   �CBixInt    iLckInt     EndGInt   �PadnPadn  �****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************EOF!