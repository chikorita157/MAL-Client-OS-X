RbBF              BlokpVew<�|�      �             NameStrn   melupdatewindow ContInt     paswStrn    bClsInt    SuprStrn   Window  flagInt    bNtrInt     CompStrn    MethGrup  �  �nameStrn   melpostupdate   CompStrn    VsblInt    sorcGrup    �EncoInt   srclStrn   Sub melpostupdate() srclStrn   pushbutton1.enabled = false srclStrn   dim data as string  srclStrn    srclStrn   &// create and populate the form object  srclStrn   dim form2 as New Dictionary srclStrn   // Set content  srclStrn    srclStrn   // Use Normal Updating  srclStrn   X// Figure out the num of episodes. If zero, episode part will not be shown in the updatesrclStrn   If checkbox1.value= true then   srclStrn   If epi.text = "" then   srclStrn   dform2.value("message") = TextField1.text + " /anime/" + titletext.text + "/ : " + commentsfield.textsrclStrn   elsesrclStrn   yform2.value("message") = TextField1.text + " /anime/" + titletext.text+ "/Episode "+ epi.text + ": " + commentsfield.text   srclStrn   end if  srclStrn   elsesrclStrn   dform2.value("message") = TextField1.text + " /anime/" + titletext.text + "/ : " + commentsfield.textsrclStrn   end if  srclStrn   I// Set Client ( e.g. <username> in anime <time> ago from MAL Client OS X)   srclStrn   )form2.value("source") = "MAL Client OS X"   srclStrn   $// setup the socket to POST the formsrclStrn   socket1.setFormData form2   srclStrn   Gsocket1.setrequestheader "Authorization","Basic " + prefs.StringMelAuth srclStrn   Cdata = socket1.post("http://melative.com/api/micro/update.json",10) srclStrn    srclStrn   // release data from memory srclStrn   form2 = nil srclStrn   $If socket1.httpstatuscode = 200 thensrclStrn   // if successfulsrclStrn   	doIt=true   srclStrn   hidesrclStrn   elsesrclStrn   // Show Error   srclStrn   �app.errboxshow("There was a problem when we were trying to update your status.",   "Unable to post update on Melative . Make sure you are connected to the internet!")  srclStrn   pushbutton1.enabled = true  srclStrn   end if  srclStrn    srclStrn   End Sub EndGInt   �EncoInt   AlasStrn    flagInt     shrdInt     parmStrn    rsltStrn    EndGInt   �PropGrup   �  �nameStrn   doitCompStrn    VsblInt    sorcGrup   8  �EncoInt   srclStrn   doit As boolean srclStrn    EndGInt   �EncoInt   declStrn   doit As boolean flagInt     shrdInt     EndGInt   �PDefGrup   <  �nameStrn   ImplicitInstanceEncoInt   PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   MenuBar PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	MacProcID   PValInt     EndGInt   �PDefGrup   4  �nameStrn   MinimizeButton  PValStrn   False   EndGInt   �PDefGrup   4  �nameStrn   MaximizeButton  PValStrn   False   EndGInt   �PDefGrup   0  �nameStrn   
LiveResize  PValStrn   False   EndGInt   �PDefGrup   0  �nameStrn   
Resizeable  PValStrn   False   EndGInt   �PDefGrup   0  �nameStrn   CloseButton PValStrn   False   EndGInt   �PDefGrup   0  �nameStrn   MenuBarVisible  PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   
FullScreen  PValStrn   False   EndGInt   �PDefGrup   (  �nameStrn   Visible PValStrn   TrueEndGInt   �PDefGrup   H  �nameStrn   Title   EncoInt   PValStrn   Posting Melative Update EndGInt   �PDefGrup   $  �nameStrn   BackdropPValStrn    EndGInt   �PDefGrup   (  �nameStrn   	BackColor   PValInt  ���EndGInt   �PDefGrup   0  �nameStrn   HasBackColorPValStrn   False   EndGInt   �PDefGrup   ,  �nameStrn   	Composite   PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   Frame   PValInt    EndGInt   �PDefGrup   (  �nameStrn   	MaxHeight   PValInt   } EndGInt   �PDefGrup   $  �nameStrn   MaxWidthPValInt   } EndGInt   �PDefGrup   (  �nameStrn   	MinHeight   PValInt    @EndGInt   �PDefGrup   $  �nameStrn   MinWidthPValInt    @EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    �EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt   EndGInt   �PDefGrup   (  �nameStrn   	Placement   PValInt     EndGInt   �VwBhGrup  D  �VwPrGrup   D  �NameStrn   NameVsblInt    PrGpStrn   ID  CPifStrn   Window  EndGInt   �VwPrGrup   L  �NameStrn   
Interfaces  VsblInt    PrGpStrn   ID  CPifStrn   Window  EndGInt   �VwPrGrup   H  �NameStrn   Super   VsblInt    PrGpStrn   ID  CPifStrn   Window  EndGInt   �VwPrGrup  0  �NameStrn   	Placement   VsblInt    PrGpStrn   PositionPValStrn   0   typeStrn   Integer vbETStrn   EnumCPifStrn   Window  EnumGrup   �  �defnStrn   0 - Default defnStrn   1 - Parent Window   defnStrn   2 - Main Screen defnStrn   3 - Parent Window ScreendefnStrn   4 - Stagger EndGInt   �EndGInt   �VwPrGrup   p  �NameStrn   Width   VsblInt    PrGpStrn   PositionPValStrn   600 typeStrn   Integer CPifStrn   Window  EndGInt   �VwPrGrup   p  �NameStrn   Height  VsblInt    PrGpStrn   PositionPValStrn   400 typeStrn   Integer CPifStrn   Window  EndGInt   �VwPrGrup   p  �NameStrn   MinWidthVsblInt    PrGpStrn   PositionPValStrn   64  typeStrn   Integer CPifStrn   Window  EndGInt   �VwPrGrup   t  �NameStrn   	MinHeight   VsblInt    PrGpStrn   PositionPValStrn   64  typeStrn   Integer CPifStrn   Window  EndGInt   �VwPrGrup   t  �NameStrn   MaxWidthVsblInt    PrGpStrn   PositionPValStrn   32000   typeStrn   Integer CPifStrn   Window  EndGInt   �VwPrGrup   x  �NameStrn   	MaxHeight   VsblInt    PrGpStrn   PositionPValStrn   32000   typeStrn   Integer CPifStrn   Window  EndGInt   �VwPrGrup    �NameStrn   Frame   VsblInt    PrGpStrn   
Appearance  PValStrn   0   typeStrn   Integer vbETStrn   EnumCPifStrn   Window  EnumGrup  p  �defnStrn   0 - DocumentdefnStrn   1 - Movable Modal   defnStrn   2 - Modal DialogdefnStrn   3 - Floating Window defnStrn   4 - Plain Box   defnStrn   5 - Shadowed BoxdefnStrn   6 - Rounded Window  defnStrn   7 - Global Floating Window  defnStrn   8 - Sheet WindowdefnStrn   9 - Metal WindowdefnStrn   10 - Drawer Window  defnStrn   11 - Modeless DialogEndGInt   �EndGInt   �VwPrGrup   |   NameStrn   	Composite   VsblInt    PrGpStrn   
Appearance  PValStrn   False   typeStrn   Boolean CPifStrn   Window  EndGInt    VwPrGrup   |  NameStrn   HasBackColorVsblInt    PrGpStrn   
Appearance  PValStrn   False   typeStrn   Boolean CPifStrn   Window  EndGInt   VwPrGrup   |  NameStrn   	BackColor   VsblInt    PrGpStrn   
Appearance  PValStrn   &hFFFFFFtypeStrn   Color   CPifStrn   Window  EndGInt   VwPrGrup   x  NameStrn   BackdropVsblInt    PrGpStrn   
Appearance  typeStrn   Picture vbETStrn   Picture CPifStrn   Window  EndGInt   VwPrGrup   x  NameStrn   Title   VsblInt    PrGpStrn   
Appearance  PValStrn   UntitledtypeStrn   String  CPifStrn   Window  EndGInt   VwPrGrup   t  NameStrn   Visible VsblInt    PrGpStrn   
Appearance  PValStrn   TruetypeStrn   Boolean CPifStrn   Window  EndGInt   VwPrGrup   |  NameStrn   
FullScreen  VsblInt    PrGpStrn   
Appearance  PValStrn   False   typeStrn   Boolean CPifStrn   Window  EndGInt   VwPrGrup   |  NameStrn   MenuBarVisible  VsblInt    PrGpStrn   
Appearance  PValStrn   TruetypeStrn   Boolean CPifStrn   Window  EndGInt   VwPrGrup   x  NameStrn   CloseButton VsblInt    PrGpStrn   
Appearance  PValStrn   TruetypeStrn   Boolean CPifStrn   Window  EndGInt   VwPrGrup   x  	NameStrn   
Resizeable  VsblInt    PrGpStrn   
Appearance  PValStrn   TruetypeStrn   Boolean CPifStrn   Window  EndGInt   	VwPrGrup   x  
NameStrn   
LiveResize  VsblInt    PrGpStrn   
Appearance  PValStrn   TruetypeStrn   Boolean CPifStrn   Window  EndGInt   
VwPrGrup   �  NameStrn   MaximizeButton  VsblInt    PrGpStrn   
Appearance  PValStrn   False   typeStrn   Boolean CPifStrn   Window  EndGInt   VwPrGrup   |  NameStrn   MinimizeButton  VsblInt    PrGpStrn   
Appearance  PValStrn   TruetypeStrn   Boolean CPifStrn   Window  EndGInt   VwPrGrup   x  NameStrn   	MacProcID   VsblInt    PrGpStrn   
Appearance  PValStrn   0   typeStrn   Integer CPifStrn   Window  EndGInt   VwPrGrup   x  NameStrn   MenuBar VsblInt    PrGpStrn   
Appearance  typeStrn   MenuBar vbETStrn   MenuBar CPifStrn   Window  EndGInt   VwPrGrup   |  NameStrn   ImplicitInstanceVsblInt    PrGpStrn   
Appearance  PValStrn   TruevbETStrn   Boolean CPifStrn   Window  EndGInt   VwPrGrup   <  NameStrn   doitPrGpStrn   BehaviortypeStrn   boolean EndGInt   EndGInt   �CBhvGrup     SuprStrn   
StaticText  EndGInt   CBhvGrup     SuprStrn   
StaticText  EndGInt   CBhvGrup   �  SuprStrn   BevelButton HInsGrup   �  nameStrn   Action  CompStrn    VsblInt    sorcGrup   �  EncoInt   srclStrn   Sub Action()srclStrn   8showurl "http://melative.pbworks.com/Known-Action-Verbs"srclStrn   End Sub EndGInt   EndGInt   EndGInt   CBhvGrup     SuprStrn   TextAreaEndGInt   CBhvGrup     SuprStrn   
StaticText  EndGInt   CBhvGrup     SuprStrn   CheckBoxEndGInt   CBhvGrup  �  SuprStrn   
PushButton  HInsGrup  �  nameStrn   Action  CompStrn    VsblInt    sorcGrup  D  EncoInt   srclStrn   Sub Action()srclStrn   If textfield1.text = "" thensrclStrn   �app.errboxshow("MAL Client OS X was unable to post the update.", "You cannot leave the action field blank. You must use a valid action or 'on' to post this update")srclStrn   elsesrclStrn   if commentsfield.text = "" then srclStrn   �app.errboxshow("MAL Client OS X was unable to post the update.", "You cannot leave the message field blank. You must have a message written.")  srclStrn   else    srclStrn   melpostupdate   srclStrn   end if  srclStrn   end if  srclStrn   End Sub EndGInt   EndGInt   EndGInt   CBhvGrup   �  SuprStrn   
PushButton  HInsGrup   �  nameStrn   Action  CompStrn    VsblInt    sorcGrup   L  EncoInt   srclStrn   Sub Action()srclStrn   hidesrclStrn   End Sub EndGInt   EndGInt   EndGInt   CBhvGrup     SuprStrn   
httpsocket  EndGInt   CBhvGrup      SuprStrn   
StaticText  EndGInt    CBhvGrup  �  !SuprStrn   	TextField   HInsGrup  �  "nameStrn   KeyDown CompStrn    VsblInt    sorcGrup  \  #EncoInt   srclStrn   *Function KeyDown(Key As String) As Boolean  srclStrn   cif instr("0123456789."+chr(28)+ chr(29)+ chr(30)+ chr(31)+chr(3)+chr(9)+chr(10)+chr(8),key)>-1 then srclStrn   %// handle specific keys from our list   srclStrn   elsesrclStrn   // ignore the key   srclStrn   return true srclStrn   end srclStrn   End FunctionEndGInt   #EndGInt   "EndGInt   !CBhvGrup     $SuprStrn   ComboBoxEndGInt   $CtrlGrup  T  %cclsStrn   
StaticText  nameStrn   
StaticText  PDefGrup   8  &nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   &PDefGrup   4  'nameStrn   	DataField   EncoInt    PValStrn    EndGInt   'PDefGrup   4  (nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   (PDefGrup   (  )nameStrn   	Underline   PValStrn    EndGInt   )PDefGrup   $  *nameStrn   Italic  PValStrn    EndGInt   *PDefGrup      +nameStrn   BoldPValStrn    EndGInt   +PDefGrup   (  ,nameStrn   TextUnitPValStrn   0   EndGInt   ,PDefGrup   (  -nameStrn   TextSizePValStrn   0   EndGInt   -PDefGrup   8  .nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   .PDefGrup   0  /nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   /PDefGrup   0  0nameStrn   HelpTag EncoInt    PValStrn    EndGInt   0PDefGrup   (  1nameStrn   Visible PValStrn   TrueEndGInt   1PDefGrup   (  2nameStrn   Enabled PValStrn   TrueEndGInt   2PDefGrup   (  3nameStrn   	Multiline   PValStrn    EndGInt   3PDefGrup   (  4nameStrn   	TextColor   PValInt     EndGInt   4PDefGrup   (  5nameStrn   	TextAlign   PValInt     EndGInt   5PDefGrup   4  6nameStrn   TextEncoInt   PValStrn   UntitledEndGInt   6PDefGrup   $  7nameStrn   TabIndexPValInt     EndGInt   7PDefGrup   ,  8nameStrn   TabPanelIndex   PValInt     EndGInt   8PDefGrup   (  9nameStrn   
LockBottom  PValStrn    EndGInt   9PDefGrup   (  :nameStrn   	LockRight   PValStrn    EndGInt   :PDefGrup   $  ;nameStrn   LockTop PValStrn    EndGInt   ;PDefGrup   $  <nameStrn   LockLeftPValStrn    EndGInt   <PDefGrup   $  =nameStrn   Height  PValInt    EndGInt   =PDefGrup   $  >nameStrn   Width   PValInt   �EndGInt   >PDefGrup      ?nameStrn   Top PValInt    EndGInt   ?PDefGrup      @nameStrn   LeftPValInt    EndGInt   @PDefGrup   (  AnameStrn   Scope   PValStrn   0   EndGInt   APDefGrup   <  BnameStrn   Super   EncoInt   PValStrn   
StaticText  EndGInt   BPDefGrup   $  CnameStrn   Index   PValInt �   EndGInt   CPDefGrup   8  DnameStrn   NameEncoInt   PValStrn   	titletext   EndGInt   DCBixInt     iLckInt     EndGInt   %CtrlGrup  T  EcclsStrn   
StaticText  nameStrn   
StaticText  PDefGrup   8  FnameStrn   InitialParent   EncoInt    PValStrn    EndGInt   FPDefGrup   4  GnameStrn   	DataField   EncoInt    PValStrn    EndGInt   GPDefGrup   4  HnameStrn   
DataSource  EncoInt    PValStrn    EndGInt   HPDefGrup   (  InameStrn   	Underline   PValStrn    EndGInt   IPDefGrup   $  JnameStrn   Italic  PValStrn    EndGInt   JPDefGrup      KnameStrn   BoldPValStrn    EndGInt   KPDefGrup   (  LnameStrn   TextUnitPValStrn   0   EndGInt   LPDefGrup   (  MnameStrn   TextSizePValStrn   0   EndGInt   MPDefGrup   8  NnameStrn   TextFontEncoInt   PValStrn   System  EndGInt   NPDefGrup   0  OnameStrn   AutoDeactivate  PValStrn   TrueEndGInt   OPDefGrup   0  PnameStrn   HelpTag EncoInt    PValStrn    EndGInt   PPDefGrup   (  QnameStrn   Visible PValStrn   TrueEndGInt   QPDefGrup   (  RnameStrn   Enabled PValStrn   TrueEndGInt   RPDefGrup   (  SnameStrn   	Multiline   PValStrn    EndGInt   SPDefGrup   (  TnameStrn   	TextColor   PValInt     EndGInt   TPDefGrup   (  UnameStrn   	TextAlign   PValInt     EndGInt   UPDefGrup   4  VnameStrn   TextEncoInt   PValStrn   Action: EndGInt   VPDefGrup   $  WnameStrn   TabIndexPValInt    EndGInt   WPDefGrup   ,  XnameStrn   TabPanelIndex   PValInt     EndGInt   XPDefGrup   (  YnameStrn   
LockBottom  PValStrn    EndGInt   YPDefGrup   (  ZnameStrn   	LockRight   PValStrn    EndGInt   ZPDefGrup   $  [nameStrn   LockTop PValStrn    EndGInt   [PDefGrup   $  \nameStrn   LockLeftPValStrn    EndGInt   \PDefGrup   $  ]nameStrn   Height  PValInt    EndGInt   ]PDefGrup   $  ^nameStrn   Width   PValInt    dEndGInt   ^PDefGrup      _nameStrn   Top PValInt    $EndGInt   _PDefGrup      `nameStrn   LeftPValInt    EndGInt   `PDefGrup   (  anameStrn   Scope   PValStrn   0   EndGInt   aPDefGrup   <  bnameStrn   Super   EncoInt   PValStrn   
StaticText  EndGInt   bPDefGrup   $  cnameStrn   Index   PValInt �   EndGInt   cPDefGrup   8  dnameStrn   NameEncoInt   PValStrn   StaticText2 EndGInt   dCBixInt    iLckInt     EndGInt   ECtrlGrup  �  ecclsStrn   BevelButton nameStrn   BevelButton PDefGrup   0  fnameStrn   	Underline   PValStrn   False   EndGInt   fPDefGrup   ,  gnameStrn   Italic  PValStrn   False   EndGInt   gPDefGrup   (  hnameStrn   BoldPValStrn   False   EndGInt   hPDefGrup   (  inameStrn   TextUnitPValStrn   0   EndGInt   iPDefGrup   $  jnameStrn   TextSizePValStrn    EndGInt   jPDefGrup   8  knameStrn   TextFontEncoInt   PValStrn   System  EndGInt   kPDefGrup   0  lnameStrn   AcceptFocus PValStrn   False   EndGInt   lPDefGrup   (  mnameStrn   
ButtonType  PValInt     EndGInt   mPDefGrup   (  nnameStrn   	MenuValue   PValInt     EndGInt   nPDefGrup   ,  onameStrn   Value   PValStrn   False   EndGInt   oPDefGrup   (  pnameStrn   	TextColor   PValInt     EndGInt   pPDefGrup   (  qnameStrn   	BackColor   PValInt     EndGInt   qPDefGrup   0  rnameStrn   HasBackColorPValStrn   False   EndGInt   rPDefGrup   $  snameStrn   HasMenu PValInt     EndGInt   sPDefGrup   $  tnameStrn   Bevel   PValInt     EndGInt   tPDefGrup   $  unameStrn   IconDY  PValInt     EndGInt   uPDefGrup   $  vnameStrn   IconDX  PValInt     EndGInt   vPDefGrup   (  wnameStrn   	IconAlign   PValInt     EndGInt   wPDefGrup      xnameStrn   IconPValStrn    EndGInt   xPDefGrup   (  ynameStrn   CaptionDeltaPValInt     EndGInt   yPDefGrup   ,  znameStrn   CaptionPlacementPValInt    EndGInt   zPDefGrup   (  {nameStrn   CaptionAlignPValInt    EndGInt   {PDefGrup   4  |nameStrn   Caption EncoInt   PValStrn   ?   EndGInt   |PDefGrup   (  }nameStrn   Enabled PValStrn   TrueEndGInt   }PDefGrup   0  ~nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   ~PDefGrup   h  nameStrn   HelpTag EncoInt   PValStrn   8See a valid list of actions that can be used on melativeEndGInt   PDefGrup   (  �nameStrn   Visible PValStrn   TrueEndGInt   �PDefGrup   8  �nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   TabStop PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt    EndGInt   �PDefGrup      �nameStrn   Top PValInt    "EndGInt   �PDefGrup      �nameStrn   LeftPValInt   .EndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   <  �nameStrn   Super   EncoInt   PValStrn   BevelButton EndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   8  �nameStrn   NameEncoInt   PValStrn   BevelButton1EndGInt   �CBixInt    iLckInt     EndGInt   eCtrlGrup  �  �cclsStrn   TextAreanameStrn   TextAreaPDefGrup   8  �nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   	DataField   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	Alignment   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
AcceptTabs  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LimitText   PValInt     EndGInt   �PDefGrup   $  �nameStrn   ReadOnlyPValStrn    EndGInt   �PDefGrup   ,  �nameStrn   MaskEncoInt    PValStrn    EndGInt   �PDefGrup   ,  �nameStrn   TextEncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	Underline   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   Italic  PValStrn    EndGInt   �PDefGrup      �nameStrn   BoldPValStrn    EndGInt   �PDefGrup   (  �nameStrn   TextUnitPValStrn   0   EndGInt   �PDefGrup   (  �nameStrn   TextSizePValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   �PDefGrup   0  �nameStrn   HideSelection   PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   HelpTag EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Visible PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   Format  EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Enabled PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   	BackColor   PValInt  ���EndGInt   �PDefGrup   (  �nameStrn   	TextColor   PValInt     EndGInt   �PDefGrup   0  �nameStrn   UseFocusRingPValStrn   False   EndGInt   �PDefGrup   (  �nameStrn   Styled  PValStrn   TrueEndGInt   �PDefGrup   4  �nameStrn   ScrollbarVertical   PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   ScrollbarHorizontal PValStrn    EndGInt   �PDefGrup   ,  �nameStrn   	Multiline   PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   Border  PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   TabStop PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    4EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt   �EndGInt   �PDefGrup      �nameStrn   Top PValInt    CEndGInt   �PDefGrup      �nameStrn   LeftPValInt    pEndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   Super   EncoInt   PValStrn   TextAreaEndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   <  �nameStrn   NameEncoInt   PValStrn   commentsfield   EndGInt   �CBixInt    iLckInt     EndGInt   �CtrlGrup  T  �cclsStrn   
StaticText  nameStrn   
StaticText  PDefGrup   8  �nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   	DataField   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	Underline   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   Italic  PValStrn    EndGInt   �PDefGrup      �nameStrn   BoldPValStrn    EndGInt   �PDefGrup   (  �nameStrn   TextUnitPValStrn   0   EndGInt   �PDefGrup   (  �nameStrn   TextSizePValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   �PDefGrup   0  �nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   HelpTag EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Visible PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   Enabled PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   	Multiline   PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	TextColor   PValInt     EndGInt   �PDefGrup   (  �nameStrn   	TextAlign   PValInt     EndGInt   �PDefGrup   4  �nameStrn   TextEncoInt   PValStrn   Message:EndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt    dEndGInt   �PDefGrup      �nameStrn   Top PValInt    CEndGInt   �PDefGrup      �nameStrn   LeftPValInt    EndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   <  �nameStrn   Super   EncoInt   PValStrn   
StaticText  EndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   8  �nameStrn   NameEncoInt   PValStrn   StaticText3 EndGInt   �CBixInt    iLckInt     EndGInt   �CtrlGrup  d  �cclsStrn   CheckBoxnameStrn   CheckBoxPDefGrup   8  �nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   	DataField   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   �PDefGrup   ,  �nameStrn   Value   PValStrn   False   EndGInt   �PDefGrup   (  �nameStrn   State   PValStrn   0   EndGInt   �PDefGrup   (  �nameStrn   	Underline   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   Italic  PValStrn    EndGInt   �PDefGrup      �nameStrn   BoldPValStrn    EndGInt   �PDefGrup   (  �nameStrn   TextUnitPValStrn   0   EndGInt   �PDefGrup   (  �nameStrn   TextSizePValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   �PDefGrup   0  �nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   HelpTag EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Visible PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   Enabled PValStrn   TrueEndGInt   �PDefGrup   L  �nameStrn   Caption EncoInt   PValStrn   Include Episode Information EndGInt   �PDefGrup   (  �nameStrn   TabStop PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt   EndGInt   �PDefGrup      �nameStrn   Top PValInt    �EndGInt   �PDefGrup      �nameStrn   LeftPValInt    EndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   Super   EncoInt   PValStrn   CheckBoxEndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   8  �nameStrn   NameEncoInt   PValStrn   	CheckBox1   EndGInt   �CBixInt    iLckInt     EndGInt   �CtrlGrup  �  �cclsStrn   
PushButton  nameStrn   
PushButton  PDefGrup   8  �nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   �PDefGrup   (   nameStrn   	Underline   PValStrn    EndGInt    PDefGrup   $  nameStrn   Italic  PValStrn    EndGInt   PDefGrup      nameStrn   BoldPValStrn    EndGInt   PDefGrup   (  nameStrn   TextUnitPValStrn   0   EndGInt   PDefGrup   (  nameStrn   TextSizePValStrn   0   EndGInt   PDefGrup   8  nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   PDefGrup   0  nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   PDefGrup   0  nameStrn   HelpTag EncoInt    PValStrn    EndGInt   PDefGrup   (  nameStrn   Visible PValStrn   TrueEndGInt   PDefGrup   (  	nameStrn   Enabled PValStrn   TrueEndGInt   	PDefGrup   $  
nameStrn   Cancel  PValStrn    EndGInt   
PDefGrup   (  nameStrn   Default PValStrn   TrueEndGInt   PDefGrup   4  nameStrn   Caption EncoInt   PValStrn   PostEndGInt   PDefGrup   (  nameStrn   TabStop PValStrn   TrueEndGInt   PDefGrup   $  nameStrn   TabIndexPValInt    EndGInt   PDefGrup   ,  nameStrn   TabPanelIndex   PValInt     EndGInt   PDefGrup   (  nameStrn   
LockBottom  PValStrn    EndGInt   PDefGrup   (  nameStrn   	LockRight   PValStrn    EndGInt   PDefGrup   $  nameStrn   LockTop PValStrn    EndGInt   PDefGrup   $  nameStrn   LockLeftPValStrn    EndGInt   PDefGrup   $  nameStrn   Height  PValInt    EndGInt   PDefGrup   $  nameStrn   Width   PValInt    PEndGInt   PDefGrup      nameStrn   Top PValInt    �EndGInt   PDefGrup      nameStrn   LeftPValInt   �EndGInt   PDefGrup   (  nameStrn   Scope   PValStrn   0   EndGInt   PDefGrup   <  nameStrn   Super   EncoInt   PValStrn   
PushButton  EndGInt   PDefGrup   $  nameStrn   Index   PValInt �   EndGInt   PDefGrup   8  nameStrn   NameEncoInt   PValStrn   PushButton1 EndGInt   CBixInt    iLckInt     EndGInt   �CtrlGrup  �  cclsStrn   
PushButton  nameStrn   
PushButton  PDefGrup   8  nameStrn   InitialParent   EncoInt    PValStrn    EndGInt   PDefGrup   (  nameStrn   	Underline   PValStrn    EndGInt   PDefGrup   $  nameStrn   Italic  PValStrn    EndGInt   PDefGrup       nameStrn   BoldPValStrn    EndGInt    PDefGrup   (  !nameStrn   TextUnitPValStrn   0   EndGInt   !PDefGrup   (  "nameStrn   TextSizePValStrn   0   EndGInt   "PDefGrup   8  #nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   #PDefGrup   0  $nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   $PDefGrup   0  %nameStrn   HelpTag EncoInt    PValStrn    EndGInt   %PDefGrup   (  &nameStrn   Visible PValStrn   TrueEndGInt   &PDefGrup   (  'nameStrn   Enabled PValStrn   TrueEndGInt   'PDefGrup   $  (nameStrn   Cancel  PValStrn    EndGInt   (PDefGrup   $  )nameStrn   Default PValStrn    EndGInt   )PDefGrup   8  *nameStrn   Caption EncoInt   PValStrn   Cancel  EndGInt   *PDefGrup   (  +nameStrn   TabStop PValStrn   TrueEndGInt   +PDefGrup   $  ,nameStrn   TabIndexPValInt    EndGInt   ,PDefGrup   ,  -nameStrn   TabPanelIndex   PValInt     EndGInt   -PDefGrup   (  .nameStrn   
LockBottom  PValStrn    EndGInt   .PDefGrup   (  /nameStrn   	LockRight   PValStrn    EndGInt   /PDefGrup   $  0nameStrn   LockTop PValStrn    EndGInt   0PDefGrup   $  1nameStrn   LockLeftPValStrn    EndGInt   1PDefGrup   $  2nameStrn   Height  PValInt    EndGInt   2PDefGrup   $  3nameStrn   Width   PValInt    PEndGInt   3PDefGrup      4nameStrn   Top PValInt    �EndGInt   4PDefGrup      5nameStrn   LeftPValInt   _EndGInt   5PDefGrup   (  6nameStrn   Scope   PValStrn   0   EndGInt   6PDefGrup   <  7nameStrn   Super   EncoInt   PValStrn   
PushButton  EndGInt   7PDefGrup   $  8nameStrn   Index   PValInt �   EndGInt   8PDefGrup   8  9nameStrn   NameEncoInt   PValStrn   PushButton2 EndGInt   9CBixInt    iLckInt     EndGInt   CtrlGrup  �  :cclsStrn   
httpsocket  nameStrn   
httpsocket  PDefGrup   $  ;nameStrn   Width   PValInt     EndGInt   ;PDefGrup   $  <nameStrn   Height  PValInt     EndGInt   <PDefGrup   <  =nameStrn   TabPanelIndex   EncoInt   PValStrn   0   EndGInt   =PDefGrup   (  >nameStrn   yield   PValStrn   0   EndGInt   >PDefGrup      ?nameStrn   PortPValInt     EndGInt   ?PDefGrup   0  @nameStrn   Address EncoInt    PValStrn    EndGInt   @PDefGrup   0  AnameStrn   Top EncoInt   PValStrn   19  EndGInt   APDefGrup   0  BnameStrn   LeftEncoInt   PValStrn   390 EndGInt   BPDefGrup   (  CnameStrn   Scope   PValStrn   0   EndGInt   CPDefGrup   <  DnameStrn   Super   EncoInt   PValStrn   
httpsocket  EndGInt   DPDefGrup   $  EnameStrn   Index   PValInt �   EndGInt   EPDefGrup   4  FnameStrn   NameEncoInt   PValStrn   socket1 EndGInt   FCBixInt    iLckInt     EndGInt   :CtrlGrup  T  GcclsStrn   
StaticText  nameStrn   
StaticText  PDefGrup   8  HnameStrn   InitialParent   EncoInt    PValStrn    EndGInt   HPDefGrup   4  InameStrn   	DataField   EncoInt    PValStrn    EndGInt   IPDefGrup   4  JnameStrn   
DataSource  EncoInt    PValStrn    EndGInt   JPDefGrup   (  KnameStrn   	Underline   PValStrn    EndGInt   KPDefGrup   $  LnameStrn   Italic  PValStrn    EndGInt   LPDefGrup      MnameStrn   BoldPValStrn    EndGInt   MPDefGrup   (  NnameStrn   TextUnitPValStrn   0   EndGInt   NPDefGrup   (  OnameStrn   TextSizePValStrn   0   EndGInt   OPDefGrup   8  PnameStrn   TextFontEncoInt   PValStrn   System  EndGInt   PPDefGrup   0  QnameStrn   AutoDeactivate  PValStrn   TrueEndGInt   QPDefGrup   0  RnameStrn   HelpTag EncoInt    PValStrn    EndGInt   RPDefGrup   (  SnameStrn   Visible PValStrn   TrueEndGInt   SPDefGrup   (  TnameStrn   Enabled PValStrn   TrueEndGInt   TPDefGrup   (  UnameStrn   	Multiline   PValStrn    EndGInt   UPDefGrup   (  VnameStrn   	TextColor   PValInt     EndGInt   VPDefGrup   (  WnameStrn   	TextAlign   PValInt     EndGInt   WPDefGrup   4  XnameStrn   TextEncoInt   PValStrn   Episode:EndGInt   XPDefGrup   $  YnameStrn   TabIndexPValInt    	EndGInt   YPDefGrup   ,  ZnameStrn   TabPanelIndex   PValInt     EndGInt   ZPDefGrup   (  [nameStrn   
LockBottom  PValStrn    EndGInt   [PDefGrup   (  \nameStrn   	LockRight   PValStrn    EndGInt   \PDefGrup   $  ]nameStrn   LockTop PValStrn    EndGInt   ]PDefGrup   $  ^nameStrn   LockLeftPValStrn    EndGInt   ^PDefGrup   $  _nameStrn   Height  PValInt    EndGInt   _PDefGrup   $  `nameStrn   Width   PValInt    dEndGInt   `PDefGrup      anameStrn   Top PValInt    �EndGInt   aPDefGrup      bnameStrn   LeftPValInt    EndGInt   bPDefGrup   (  cnameStrn   Scope   PValStrn   0   EndGInt   cPDefGrup   <  dnameStrn   Super   EncoInt   PValStrn   
StaticText  EndGInt   dPDefGrup   $  enameStrn   Index   PValInt �   EndGInt   ePDefGrup   8  fnameStrn   NameEncoInt   PValStrn   StaticText1 EndGInt   fCBixInt    	iLckInt     EndGInt   GCtrlGrup  
�  gcclsStrn   	TextField   nameStrn   	TextField   PDefGrup   8  hnameStrn   InitialParent   EncoInt    PValStrn    EndGInt   hPDefGrup   4  inameStrn   	DataField   EncoInt    PValStrn    EndGInt   iPDefGrup   4  jnameStrn   
DataSource  EncoInt    PValStrn    EndGInt   jPDefGrup   (  knameStrn   	Alignment   PValInt     EndGInt   kPDefGrup   (  lnameStrn   
AcceptTabs  PValStrn    EndGInt   lPDefGrup   (  mnameStrn   	LimitText   PValInt     EndGInt   mPDefGrup   $  nnameStrn   ReadOnlyPValStrn    EndGInt   nPDefGrup   ,  onameStrn   MaskEncoInt    PValStrn    EndGInt   oPDefGrup   ,  pnameStrn   TextEncoInt    PValStrn    EndGInt   pPDefGrup   0  qnameStrn   CueText EncoInt    PValStrn    EndGInt   qPDefGrup   (  rnameStrn   	Underline   PValStrn    EndGInt   rPDefGrup   $  snameStrn   Italic  PValStrn    EndGInt   sPDefGrup      tnameStrn   BoldPValStrn    EndGInt   tPDefGrup   (  unameStrn   TextUnitPValStrn   0   EndGInt   uPDefGrup   (  vnameStrn   TextSizePValStrn   0   EndGInt   vPDefGrup   8  wnameStrn   TextFontEncoInt   PValStrn   System  EndGInt   wPDefGrup   0  xnameStrn   AutoDeactivate  PValStrn   TrueEndGInt   xPDefGrup   0  ynameStrn   HelpTag EncoInt    PValStrn    EndGInt   yPDefGrup   (  znameStrn   Visible PValStrn   TrueEndGInt   zPDefGrup   0  {nameStrn   Format  EncoInt    PValStrn    EndGInt   {PDefGrup   (  |nameStrn   Enabled PValStrn   TrueEndGInt   |PDefGrup   (  }nameStrn   	BackColor   PValInt  ���EndGInt   }PDefGrup   (  ~nameStrn   	TextColor   PValInt     EndGInt   ~PDefGrup   0  nameStrn   UseFocusRingPValStrn   False   EndGInt   PDefGrup   $  �nameStrn   PasswordPValStrn    EndGInt   �PDefGrup   (  �nameStrn   Border  PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   TabStop PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    
EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt    8EndGInt   �PDefGrup      �nameStrn   Top PValInt    �EndGInt   �PDefGrup      �nameStrn   LeftPValInt    pEndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   <  �nameStrn   Super   EncoInt   PValStrn   	TextField   EndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   0  �nameStrn   NameEncoInt   PValStrn   epi EndGInt   �CBixInt    
iLckInt     EndGInt   gCtrlGrup  \  �cclsStrn   ComboBoxnameStrn   ComboBoxPDefGrup   0  �nameStrn   AutoCompletePValStrn   False   EndGInt   �PDefGrup   4  �nameStrn   	DataField   EncoInt    PValStrn    EndGInt   �PDefGrup   4  �nameStrn   
DataSource  EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	Underline   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   Italic  PValStrn    EndGInt   �PDefGrup      �nameStrn   BoldPValStrn    EndGInt   �PDefGrup   (  �nameStrn   TextUnitPValStrn   0   EndGInt   �PDefGrup   (  �nameStrn   TextSizePValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   TextFontEncoInt   PValStrn   System  EndGInt   �PDefGrup   0  �nameStrn   UseFocusRingPValStrn   False   EndGInt   �PDefGrup   0  �nameStrn   AutoDeactivate  PValStrn   TrueEndGInt   �PDefGrup   0  �nameStrn   HelpTag EncoInt    PValStrn    EndGInt   �PDefGrup   (  �nameStrn   Visible PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   	ListIndex   PValInt     EndGInt   �PDefGrup   H  �nameStrn   InitialValueEncoInt   PValStrn   watchingwriteon  EndGInt   �PDefGrup   (  �nameStrn   Enabled PValStrn   TrueEndGInt   �PDefGrup   (  �nameStrn   TabStop PValStrn   TrueEndGInt   �PDefGrup   $  �nameStrn   TabIndexPValInt    EndGInt   �PDefGrup   ,  �nameStrn   TabPanelIndex   PValInt     EndGInt   �PDefGrup   (  �nameStrn   
LockBottom  PValStrn    EndGInt   �PDefGrup   (  �nameStrn   	LockRight   PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockTop PValStrn    EndGInt   �PDefGrup   $  �nameStrn   LockLeftPValStrn    EndGInt   �PDefGrup   $  �nameStrn   Height  PValInt    EndGInt   �PDefGrup   $  �nameStrn   Width   PValInt    �EndGInt   �PDefGrup      �nameStrn   Top PValInt    #EndGInt   �PDefGrup      �nameStrn   LeftPValInt    pEndGInt   �PDefGrup   (  �nameStrn   Scope   PValStrn   0   EndGInt   �PDefGrup   8  �nameStrn   Super   EncoInt   PValStrn   ComboBoxEndGInt   �PDefGrup   $  �nameStrn   Index   PValInt �   EndGInt   �PDefGrup   8  �nameStrn   NameEncoInt   PValStrn   
TextField1  EndGInt   �CBixInt    iLckInt     EndGInt   �PadnPadn  x********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************EOF!