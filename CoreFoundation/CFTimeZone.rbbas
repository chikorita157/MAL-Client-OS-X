	#tag Class	Class CFTimeZone	Inherits CFType		#tag Event			Function ClassID() As CFTypeID			  return me.ClassID			End Function		#tag EndEvent		#tag Method, Flags = &h0			Function Abbreviation(d as Date) As CFString			  #if TargetMacOS			    soft declare function CFTimeZoneCopyAbbreviation lib CarbonLib (tz as Ptr, at as Double) as Ptr			    // Caution: If this would return a CFStringRef, we'd have to Retain its value!			    // Instead, using "CFString" takes care of that automagically			    			    dim theDate as new CFDate(d)			    return new CFString(CFTimeZoneCopyAbbreviation(me.Reference, theDate.AbsoluteTime), true)			  #endif			End Function		#tag EndMethod		#tag Method, Flags = &h0			 Shared Function ClassID() As CFTypeID			  #if targetMacOS			    declare function TypeID lib CarbonLib alias "CFTimeZoneGetTypeID" () as UInt32			    static id as CFTypeID = CFTypeID(TypeID)			    return id			  #endif			End Function		#tag EndMethod		#tag Method, Flags = &h0			Sub Constructor()			  // This gives the current system's time zone			  			  #if TargetMacOS			    soft declare function CFTimeZoneCopySystem lib CarbonLib () as Ptr			    			    super.Constructor CFTimeZoneCopySystem(), true			  #endif			End Sub		#tag EndMethod		#tag Method, Flags = &h0			Sub Constructor(timeZoneName as String)			  #if TargetMacOS			    soft declare function CFTimeZoneCreateWithName lib CarbonLib (allocator as Ptr, name as CFStringRef, tryAbbrev as Boolean) as Ptr			    			    super.Constructor CFTimeZoneCreateWithName(nil, timeZoneName, true), true			  #endif			End Sub		#tag EndMethod		#tag Method, Flags = &h0			Function IsDST(d as Date) As Boolean			  #if TargetMacOS			    soft declare function CFTimeZoneIsDaylightSavingsTime lib CarbonLib (tz as Ptr, at as Double) as Boolean			    			    dim theDate as new CFDate(d)			    return CFTimeZoneIsDaylightSavingsTime(me.Reference, theDate.AbsoluteTime)			  #endif			End Function		#tag EndMethod		#tag Method, Flags = &h0			 Shared Function NameList() As String()			  #if TargetMacOS			    soft declare function CFTimeZoneCopyKnownNames lib CarbonLib () as Ptr			    			    dim nameArray as new CFArray(CFTimeZoneCopyKnownNames, true)			    dim theList() as String			    for i as Integer = 0 to nameArray.Count - 1			      dim theValue as CFType = nameArray.Value(i)			      if theValue isA CFString then			        theList.Append CFString(theValue)			      else			        break // oops, this is unexpected			      end if			    next			    return theList			  #endif			End Function		#tag EndMethod		#tag Method, Flags = &h0			Function Offset(d as Date) As Double			  // returned unit: seconds			  			  #if TargetMacOS			    soft declare function CFTimeZoneGetSecondsFromGMT lib CarbonLib (tz as Ptr, at as Double) as Double			    			    dim theDate as new CFDate(d)			    return CFTimeZoneGetSecondsFromGMT(me.Reference, theDate.AbsoluteTime)			  #endif			End Function		#tag EndMethod		#tag ComputedProperty, Flags = &h0			#tag Getter				Get				  #if TargetMacOS				    soft declare function CFTimeZoneGetName lib CarbonLib (tz as Ptr) as Ptr				    // Caution: If this would return a CFStringRef, we'd have to Retain its value!				    // Instead, using "CFString" takes care of that automagically				    				    dim p as Ptr = me.Reference				    if p <> nil then				      return new CFString(CFTimeZoneGetName(p), false)				    end if				  #endif				End Get			#tag EndGetter			Name As String		#tag EndComputedProperty		#tag ViewBehavior			#tag ViewProperty				Name="Description"				Group="Behavior"				Type="String"				EditorType="MultiLineEditor"				InheritedFrom="CFType"			#tag EndViewProperty			#tag ViewProperty				Name="Index"				Visible=true				Group="ID"				InitialValue="-2147483648"				InheritedFrom="Object"			#tag EndViewProperty			#tag ViewProperty				Name="Left"				Visible=true				Group="Position"				InitialValue="0"				InheritedFrom="Object"			#tag EndViewProperty			#tag ViewProperty				Name="Name"				Visible=true				Group="ID"				InheritedFrom="Object"			#tag EndViewProperty			#tag ViewProperty				Name="Super"				Visible=true				Group="ID"				InheritedFrom="Object"			#tag EndViewProperty			#tag ViewProperty				Name="Top"				Visible=true				Group="Position"				InitialValue="0"				InheritedFrom="Object"			#tag EndViewProperty		#tag EndViewBehavior	End Class	#tag EndClass