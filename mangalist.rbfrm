#tag WindowBegin Window mangalist   BackColor       =   16777215   Backdrop        =   ""   CloseButton     =   True   Composite       =   True   Frame           =   0   FullScreen      =   False   HasBackColor    =   False   Height          =   488   ImplicitInstance=   True   LiveResize      =   True   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   False   MaxWidth        =   32000   MenuBar         =   1408782882   MenuBarVisible  =   True   MinHeight       =   64   MinimizeButton  =   True   MinWidth        =   64   Placement       =   0   Resizeable      =   False   Title           =   "Manga List Lookup"   Visible         =   True   Width           =   649   Begin Listbox List      AutoDeactivate  =   True      AutoHideScrollbars=   True      Bold            =   ""      Border          =   True      ColumnCount     =   1      ColumnsResizable=   ""      ColumnWidths    =   ""      DataField       =   ""      DataSource      =   ""      DefaultRowHeight=   -1      Enabled         =   True      EnableDrag      =   ""      EnableDragReorder=   ""      GridLinesHorizontal=   0      GridLinesVertical=   0      HasHeading      =   ""      HeadingIndex    =   -1      Height          =   422      HelpTag         =   ""      Hierarchical    =   True      Index           =   -2147483648      InitialParent   =   ""      InitialValue    =   ""      Italic          =   ""      Left            =   0      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   ""      RequiresSelection=   ""      Scope           =   0      ScrollbarHorizontal=   ""      ScrollBarVertical=   True      SelectionType   =   0      TabIndex        =   3      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   11      TextUnit        =   0      Top             =   42      Underline       =   ""      UseFocusRing    =   False      Visible         =   True      Width           =   649      _ScrollWidth    =   -1   End   Begin httpsocket socket1      Address         =   ""      Enabled         =   True      Height          =   32      Index           =   -2147483648      Left            =   9      LockedInPosition=   False      Port            =   0      Scope           =   0      TabIndex        =   1      TabPanelIndex   =   0      TabStop         =   True      Top             =   17      Visible         =   True      Width           =   32      yield           =   0   End   Begin PushButton PushButton1      AutoDeactivate  =   True      Bold            =   ""      Cancel          =   ""      Caption         =   "Lookup"      Default         =   False      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   558      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   4      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   10      Underline       =   ""      Visible         =   True      Width           =   80   End   Begin TextField TextField1      AcceptTabs      =   ""      Alignment       =   0      AutoDeactivate  =   True      BackColor       =   16777215      Bold            =   ""      Border          =   True      CueText         =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Format          =   ""      Height          =   22      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   112      LimitText       =   0      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Mask            =   ""      Password        =   ""      ReadOnly        =   ""      Scope           =   0      TabIndex        =   5      TabPanelIndex   =   0      TabStop         =   True      Text            =   ""      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   10      Underline       =   ""      UseFocusRing    =   True      Visible         =   True      Width           =   434   End   Begin StaticText StaticText1      AutoDeactivate  =   True      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   9      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Multiline       =   ""      Scope           =   0      TabIndex        =   6      TabPanelIndex   =   0      TabStop         =   True      Text            =   "MAL Username:"      TextAlign       =   0      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      TextUnit        =   0      Top             =   11      Underline       =   ""      Visible         =   True      Width           =   100   End   Begin ProgressWheel ProgressWheel1      AutoDeactivate  =   True      Enabled         =   True      Height          =   16      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   5      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Scope           =   0      TabIndex        =   7      TabPanelIndex   =   0      TabStop         =   True      Top             =   468      Visible         =   False      Width           =   16   End   Begin StaticText statustext      AutoDeactivate  =   True      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   33      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   ""      LockRight       =   ""      LockTop         =   ""      Multiline       =   ""      Scope           =   0      TabIndex        =   8      TabPanelIndex   =   0      TabStop         =   True      Text            =   "Loading List..."      TextAlign       =   0      TextColor       =   0      TextFont        =   "System"      TextSize        =   11      TextUnit        =   0      Top             =   466      Underline       =   ""      Visible         =   False      Width           =   201   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Open()		  dim sysVersion as Integer		  // Set Interface		  If System.Gestalt("sysv", sysVersion) and sysVersion >= &h1050 then		    SetWindow.SetRoundWindowTopBottom(self,42,24 )		    		  else		    //Revert to metal window if Mac OS X is 10.4 or 10.3		    SetWindow.Metal(self,true)		    		  end if		  //set up list listbox		  list.columncount=6		  list.columnwidths="0,50%,12%,10%,10%,28%"		  list.HasHeading=True		  list.Heading(0)="ID"		  list.Heading(1)="Title"		  list.Heading(2)="Chapters Read"		  list.Heading(3)="Volumes Read"		  list.Heading(4)="Rating"		  list.Heading(5)="Status"		  list.Column(0).UserResizable=false		End Sub	#tag EndEvent	#tag MenuHandler		Function FileClose() As Boolean Handles FileClose.Action			me.close			Return True					End Function	#tag EndMenuHandler	#tag Method, Flags = &h0		Sub getlist(MUsername as string)		  dim data as string		  socket1.yield = true		  progresswheel1.visible = true		  statustext.visible = true		  data= socket1.get("http://myanimelist.net/malappinfo.php?u=" + MUsername + "&status=all&type=manga" ,10)		  // debugList.text = data		  If data is nil then		    app.errboxshowdialog("There is a problem while retreving your list",   "Unable to refresh your Anime List. Make sure you are connected to the internet!")		    progresswheel1.visible = false		    statustext.visible = false		  else		    //Populate data to the list		    // clear list		    List.DeleteAllRows		    dim XML as new XMLDocument		    XML.LoadXML(Data)		    r = getXMLroot(xml)		    p = getmangaList(r)		    c = p.Length - 1		    list.visible = false		    dim mangastatus as string		    for i = 0 to c		      d = parseAnime(p.Item(i))		      List.AddRow(d.Value("series_mangadb_id"))		      List.Cell(List.LastIndex, 1) = d.Value("series_title")		      List.Cell(List.LastIndex, 2) = d.Value("my_read_chapters") + "/" + d.Value("series_chapters")		      List.Cell(List.LastIndex, 3) = d.Value("my_read_volumes") + "/" + d.value("series_volumes")		      List.Cell(List.LastIndex, 4) = d.Value("my_score")		      If d.Value("my_status") = 1 then		        mangastatus = "reading"		        List.Cell(List.LastIndex, 5) = mangastatus		      elseif d.Value("my_status") = 2 then		        mangastatus = "completed"		        List.Cell(List.LastIndex, 5) = mangastatus		      elseif d.Value("my_status") = 3 then		        mangastatus = "on hold"		        List.Cell(List.LastIndex, 5) = mangastatus		      elseif d.Value("my_status") = 3 then		        mangastatus = "on hold"		        List.Cell(List.LastIndex, 5) = mangastatus		      elseif d.Value("my_status") = 4 then		        mangastatus = "dropped"		        List.Cell(List.LastIndex, 5) = mangastatus		      elseif d.Value("my_status") = 6 then		        mangastatus = "plan to read"		        List.Cell(List.LastIndex, 5) = mangastatus		      end if		    next		    list.visible = true		    xml = nil		    r = nil		    d = nil		    c = 0		    progresswheel1.visible = false		    statustext.visible = false		    //Sort list		    List.ColumnsortDirection(5)=ListBox.SortDescending		    List.SortedColumn=5 //sort by Watch status		    List.Sort		    		  end if		  		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub listlookup()		  showURL "http://myanimelist.net/manga/" + list.cell(list.listindex,0)		End Sub	#tag EndMethod	#tag Property, Flags = &h0		c As Integer	#tag EndProperty	#tag Property, Flags = &h0		d As dictionary	#tag EndProperty	#tag Property, Flags = &h0		i As Integer	#tag EndProperty	#tag Property, Flags = &h0		p As XmlNodeList	#tag EndProperty	#tag Property, Flags = &h0		r As XmlNode	#tag EndProperty#tag EndWindowCode#tag Events List	#tag Event		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean		  if row mod 2 = 0 then		    g.forecolor = App.GetThemeColor(app.kThemeBrushListViewOddRowBackground)		  else		    g.forecolor = App.GetThemeColor(app.kThemeBrushListViewEvenRowBackground)		  end		  g.fillrect(0,0,g.width,g.height)		End Function	#tag EndEvent	#tag Event		Function KeyDown(Key As String) As Boolean		  if key = chr(13) then		    listlookup		  end if		End Function	#tag EndEvent	#tag Event		Sub DoubleClick()		  listlookup		End Sub	#tag EndEvent#tag EndEvents#tag Events PushButton1	#tag Event		Sub Action()		  getlist(textfield1.text)		End Sub	#tag EndEvent#tag EndEvents#tag Events TextField1	#tag Event		Function KeyDown(Key As String) As Boolean		  if key = chr(13) then		    getlist(me.text)		  end if		End Function	#tag EndEvent#tag EndEvents