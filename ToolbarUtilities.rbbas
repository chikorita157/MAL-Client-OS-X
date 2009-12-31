#tag ModuleProtected Module ToolbarUtilities	#tag Method, Flags = &h0		Function DisplayMode(Extends T As Toolbar) As Integer		  #If TargetCarbon		    		    Dim Mode,OSError As Integer		    Dim TheToolbar As Integer		    		    Soft Declare Function GetWindowToolbar Lib kCarbon(InWindow As WindowPtr, ByRef OutToolbar As Integer) As Integer		    Soft Declare Function HIToolbarGetDisplayMode Lib kCarbon(InToolbar As Integer, ByRef OutDisplayMode As Integer) As Integer		    		    Dim I As Integer=GetWindowToolbar(T.Window,TheToolbar)		    		    OSError=HIToolbarGetDisplayMode(TheToolbar,Mode)		    		    If OSError=0 Then		      Return Mode		    End		    		  #EndIf		  		Exception FNF As FunctionNotFoundException		  Return 0		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub DisplayMode(Extends T As Toolbar, Assigns Mode As Integer)		  #If TargetCarbon		    		    Dim OSError As Integer		    Dim TheToolbar As Integer		    		    Soft Declare Function GetWindowToolbar Lib kCarbon(InWindow As WindowPtr,ByRef OutToolbar As Integer) As Integer		    Soft Declare Function HIToolbarSetDisplayMode Lib kCarbon(InToolbar As Integer, InDisplayMode As Integer) As Integer		    		    Dim I As Integer=GetWindowToolbar(T.Window,TheToolbar)		    		    OSError=HIToolbarSetDisplayMode(TheToolbar,Mode)		    		  #EndIf		  		Exception FNF As FunctionNotFoundException		  Return		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function DisplaySize(Extends T As Toolbar) As Integer		  #If TargetCarbon		    		    Dim Size, OSError As Integer		    Dim TheToolbar As Integer		    		    Soft Declare Function GetWindowToolbar Lib kCarbon(InWindow As WindowPtr, ByRef OutToolbar As Integer) As Integer		    Soft Declare Function HIToolbarGetDisplaySize Lib kCarbon(InToolbar As Integer, ByRef OutSize As Integer) As Integer		    		    Dim I As Integer=GetWindowToolbar(T.Window, TheToolbar)		    		    OSError=HIToolbarGetDisplaySize(TheToolbar,Size)		    		    Return Size		    		  #EndIf		  		Exception FNF As FunctionNotFoundException		  Return 0		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub DisplaySize(Extends T As Toolbar, Assigns Size As Integer)		  #If TargetCarbon		    		    Dim OSError As Integer		    Dim TheToolbar As Integer		    		    Soft Declare Function GetWindowToolbar Lib kCarbon(InWindow As WindowPtr, ByRef OutToolbar As Integer) As Integer		    Soft Declare Function HIToolbarSetDisplaySize Lib kCarbon(InToolbar As Integer, InSize As Integer) As Integer		    		    Dim I As Integer = GetWindowToolbar(T.Window,TheToolbar)		    		    OSError=HIToolbarSetDisplaySize(TheToolbar,Size)		    		  #EndIf		  		Exception FNF As FunctionNotFoundException		  Return		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function HasToolbarButton(Extends W As Window) As Boolean		  #If TargetCarbon		    		    Declare Function GetWindowAttributes Lib kCarbon (Window As WindowPtr, ByRef OutAttributes As Integer) As Integer		    		    Dim OSError,Attrs As Integer		    		    OSError=GetWindowAttributes(W,Attrs)		    		    If OSError=0 Then		      Return(Bitwise.BitAnd(Attrs,2^6)=2^6)		    End		    		  #EndIf		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub HasToolbarButton(Extends W As Window, Assigns Bool As Boolean)		  #If TargetCarbon		    		    Declare Function ChangeWindowAttributes Lib kCarbon(InWindow As WindowPtr,SetAttrs As Integer,ClearAttrs As Integer) As Integer		    		    Dim OSError As Integer		    		    If Bool Then		      OSError=ChangeWindowAttributes(w,2^6,0)		    Else		      OSError=ChangeWindowAttributes(w,0,2^6)		    End		    		  #EndIf		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function ToolbarVisible(Extends W As Window) As Boolean		  #If TargetCarbon		    		    Soft Declare Function IsWindowToolbarVisible Lib kCarbon(wPtr As WindowPtr) As Boolean		    Return IsWindowToolbarVisible(W)		    		  #EndIf		  		Exception FNF As FunctionNotFoundException		  Return False		  		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub ToolbarVisible(Extends W As Window, Assigns TheValue As Boolean)		  #If TargetCarbon		    		    Soft Declare Function ShowHideWindowToolbar Lib kCarbon (wRef As WindowPtr, InShow As Boolean, InAnimate As Boolean) As Integer		    Dim OSError As Integer=ShowHideWindowToolbar(W,TheValue,True)		    		  #EndIf		  		Exception FNF As FunctionNotFoundException		  Return		End Sub	#tag EndMethod	#tag Note, Name = Contributors				Thom McGrath		Charles Yeomans		Brad Rhine	#tag EndNote	#tag Note, Name = History				Release History				5/23/2007:		Initial Release	#tag EndNote	#tag Note, Name = License		Copyright (c) 2007, bradrhine.com				All rights reserved.				Redistribution and use in source and binary forms, with or without modification,		are permitted provided that the following conditions are met:				Redistributions of source code must retain the above copyright notice,		this list of conditions and the following disclaimer.				Redistributions in binary form must reproduce the above copyright notice,		this list of conditions and the following disclaimer in the documentation		and/or other materials provided with the distribution.				Neither the name of bradrhine.com nor the names of its contributors may be used		to endorse or promote products derived from this software without specific prior written permission.				THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS		"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT		LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR		A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR		CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,		EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,		PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR		PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF		LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING		NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS		SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.			#tag EndNote	#tag Note, Name = Usage		The Toolbar Utilities module contains eight methods. Each method is documented below.						- DisplayMode(Extends T As Toolbar) As Integer		This method returns an integer representing the display mode of the toolbar (Icon Only, Text Only, or Icon and Text). The method		can be called like this:		MyInt=Toolbar1.DisplayMode				- DisplayMode(Extends T As Toolbar, Assigns Mode As Integer)		This method sets the toolbar's display mode. Four constants are available in this module to set the mode. The method can be called		like this:		Toolbar1.DisplayMode=kDisplayModeIconAndLabel				- DisplaySize(Extends T As Toolbar) As Integer		This method returns an integer representing the display size of the toolbar (normal or small). The method can be called like this:		MyInt=Toolbar1.DisplaySize				- DisplaySize(Extends T As Toolbar, Assigns Mode As Integer)		This method sets the toolbar's display size. Three constants are available in this module to set the mode. Note that as this writing, there is		no visual difference between default and normal. The method can be called like this:		Toolbar1.DisplaySize=kToolbarSizeNormal				- HasToolbarButton(Extends W As Window) As Boolean		This method returns a boolean indicating whether the window is displaying the toolbar button (upper right corner). The method can		be called like this:		MyBool=Window1.HasToolbarButton				- HasToolbarButton(Extends W As Window, Assigns Bool As Boolean)		This method sets the visibility of the window's toolbar button. The method can be called like this:		Window1.HasToolbarButton=True				- ToolbarVisible(Extends W As Window) As Boolean		This method returns a boolean indicating whether the window's toolbar is currently visible. The method can		be called like this:		MyBool=Window1.ToolbarVisible				- ToolbarVisible(Extends W As Window, Assigns Bool As Boolean)		This method sets the visibility of the window's toolbar. The method can be called like this:		Window1.ToolbarVisible=True			#tag EndNote	#tag Property, Flags = &h1		Protected Version As Double = 1	#tag EndProperty	#tag Constant, Name = kCarbon, Type = String, Dynamic = False, Default = \"Carbon", Scope = Private		#Tag Instance, Platform = Mac Carbon PEF, Language = Default, Definition  = \"CarbonLib"		#Tag Instance, Platform = Mac Mach-O, Language = Default, Definition  = \"Carbon"	#tag EndConstant	#tag Constant, Name = kDisplayModeDefault, Type = Integer, Dynamic = False, Default = \"0", Scope = Public	#tag EndConstant	#tag Constant, Name = kDisplayModeIconAndLabel, Type = Integer, Dynamic = False, Default = \"1", Scope = Public	#tag EndConstant	#tag Constant, Name = kDisplayModeIconOnly, Type = Integer, Dynamic = False, Default = \"2", Scope = Public	#tag EndConstant	#tag Constant, Name = kDisplayModeLabelOnly, Type = Double, Dynamic = False, Default = \"3", Scope = Public	#tag EndConstant	#tag Constant, Name = kToolbarSizeDefault, Type = Double, Dynamic = False, Default = \"0", Scope = Public	#tag EndConstant	#tag Constant, Name = kToolbarSizeNormal, Type = Double, Dynamic = False, Default = \"1", Scope = Public	#tag EndConstant	#tag Constant, Name = kToolbarSizeSmall, Type = Double, Dynamic = False, Default = \"2", Scope = Public	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Module#tag EndModule