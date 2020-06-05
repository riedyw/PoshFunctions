---
external help file: PoshFunctions-help.xml
Module Name: PoshFunctions
online version:
schema: 2.0.0
---

# New-WPFMessageBox

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

```
New-WPFMessageBox [-Content] <Object> [[-Title] <String>] [[-ButtonType] <Array>] [[-CustomButtons] <Array>]
 [[-ContentFontSize] <Int32>] [[-TitleFontSize] <Int32>] [[-BorderThickness] <Int32>] [[-CornerRadius] <Int32>]
 [[-ShadowDepth] <Int32>] [[-BlurRadius] <Int32>] [[-WindowHost] <Object>] [[-Timeout] <Int32>]
 [[-OnLoaded] <ScriptBlock>] [[-OnClosed] <ScriptBlock>] [-ContentBackground <String>] [-FontFamily <String>]
 [-TitleFontWeight <String>] [-ContentFontWeight <String>] [-ContentTextForeground <String>]
 [-TitleTextForeground <String>] [-BorderBrush <String>] [-TitleBackground <String>]
 [-ButtonTextForeground <String>] [-Sound <String>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -BlurRadius
{{ Fill BlurRadius Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BorderBrush
{{ Fill BorderBrush Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: AliceBlue, AntiqueWhite, Aqua, Aquamarine, Azure, Beige, Bisque, Black, BlanchedAlmond, Blue, BlueViolet, Brown, BurlyWood, CadetBlue, Chartreuse, Chocolate, Coral, CornflowerBlue, Cornsilk, Crimson, Cyan, DarkBlue, DarkCyan, DarkGoldenrod, DarkGray, DarkGreen, DarkKhaki, DarkMagenta, DarkOliveGreen, DarkOrange, DarkOrchid, DarkRed, DarkSalmon, DarkSeaGreen, DarkSlateBlue, DarkSlateGray, DarkTurquoise, DarkViolet, DeepPink, DeepSkyBlue, DimGray, DodgerBlue, Firebrick, FloralWhite, ForestGreen, Fuchsia, Gainsboro, GhostWhite, Gold, Goldenrod, Gray, Green, GreenYellow, Honeydew, HotPink, IndianRed, Indigo, Ivory, Khaki, Lavender, LavenderBlush, LawnGreen, LemonChiffon, LightBlue, LightCoral, LightCyan, LightGoldenrodYellow, LightGray, LightGreen, LightPink, LightSalmon, LightSeaGreen, LightSkyBlue, LightSlateGray, LightSteelBlue, LightYellow, Lime, LimeGreen, Linen, Magenta, Maroon, MediumAquamarine, MediumBlue, MediumOrchid, MediumPurple, MediumSeaGreen, MediumSlateBlue, MediumSpringGreen, MediumTurquoise, MediumVioletRed, MidnightBlue, MintCream, MistyRose, Moccasin, NavajoWhite, Navy, OldLace, Olive, OliveDrab, Orange, OrangeRed, Orchid, PaleGoldenrod, PaleGreen, PaleTurquoise, PaleVioletRed, PapayaWhip, PeachPuff, Peru, Pink, Plum, PowderBlue, Purple, Red, RosyBrown, RoyalBlue, SaddleBrown, Salmon, SandyBrown, SeaGreen, SeaShell, Sienna, Silver, SkyBlue, SlateBlue, SlateGray, Snow, SpringGreen, SteelBlue, Tan, Teal, Thistle, Tomato, Transparent, Turquoise, Violet, Wheat, White, WhiteSmoke, Yellow, YellowGreen

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BorderThickness
{{ Fill BorderThickness Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ButtonTextForeground
{{ Fill ButtonTextForeground Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: AliceBlue, AntiqueWhite, Aqua, Aquamarine, Azure, Beige, Bisque, Black, BlanchedAlmond, Blue, BlueViolet, Brown, BurlyWood, CadetBlue, Chartreuse, Chocolate, Coral, CornflowerBlue, Cornsilk, Crimson, Cyan, DarkBlue, DarkCyan, DarkGoldenrod, DarkGray, DarkGreen, DarkKhaki, DarkMagenta, DarkOliveGreen, DarkOrange, DarkOrchid, DarkRed, DarkSalmon, DarkSeaGreen, DarkSlateBlue, DarkSlateGray, DarkTurquoise, DarkViolet, DeepPink, DeepSkyBlue, DimGray, DodgerBlue, Firebrick, FloralWhite, ForestGreen, Fuchsia, Gainsboro, GhostWhite, Gold, Goldenrod, Gray, Green, GreenYellow, Honeydew, HotPink, IndianRed, Indigo, Ivory, Khaki, Lavender, LavenderBlush, LawnGreen, LemonChiffon, LightBlue, LightCoral, LightCyan, LightGoldenrodYellow, LightGray, LightGreen, LightPink, LightSalmon, LightSeaGreen, LightSkyBlue, LightSlateGray, LightSteelBlue, LightYellow, Lime, LimeGreen, Linen, Magenta, Maroon, MediumAquamarine, MediumBlue, MediumOrchid, MediumPurple, MediumSeaGreen, MediumSlateBlue, MediumSpringGreen, MediumTurquoise, MediumVioletRed, MidnightBlue, MintCream, MistyRose, Moccasin, NavajoWhite, Navy, OldLace, Olive, OliveDrab, Orange, OrangeRed, Orchid, PaleGoldenrod, PaleGreen, PaleTurquoise, PaleVioletRed, PapayaWhip, PeachPuff, Peru, Pink, Plum, PowderBlue, Purple, Red, RosyBrown, RoyalBlue, SaddleBrown, Salmon, SandyBrown, SeaGreen, SeaShell, Sienna, Silver, SkyBlue, SlateBlue, SlateGray, Snow, SpringGreen, SteelBlue, Tan, Teal, Thistle, Tomato, Transparent, Turquoise, Violet, Wheat, White, WhiteSmoke, Yellow, YellowGreen

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ButtonType
{{ Fill ButtonType Description }}

```yaml
Type: Array
Parameter Sets: (All)
Aliases:
Accepted values: OK, OK-Cancel, Abort-Retry-Ignore, Yes-No-Cancel, Yes-No, Retry-Cancel, Cancel-TryAgain-Continue, None

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Content
{{ Fill Content Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContentBackground
{{ Fill ContentBackground Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: AliceBlue, AntiqueWhite, Aqua, Aquamarine, Azure, Beige, Bisque, Black, BlanchedAlmond, Blue, BlueViolet, Brown, BurlyWood, CadetBlue, Chartreuse, Chocolate, Coral, CornflowerBlue, Cornsilk, Crimson, Cyan, DarkBlue, DarkCyan, DarkGoldenrod, DarkGray, DarkGreen, DarkKhaki, DarkMagenta, DarkOliveGreen, DarkOrange, DarkOrchid, DarkRed, DarkSalmon, DarkSeaGreen, DarkSlateBlue, DarkSlateGray, DarkTurquoise, DarkViolet, DeepPink, DeepSkyBlue, DimGray, DodgerBlue, Firebrick, FloralWhite, ForestGreen, Fuchsia, Gainsboro, GhostWhite, Gold, Goldenrod, Gray, Green, GreenYellow, Honeydew, HotPink, IndianRed, Indigo, Ivory, Khaki, Lavender, LavenderBlush, LawnGreen, LemonChiffon, LightBlue, LightCoral, LightCyan, LightGoldenrodYellow, LightGray, LightGreen, LightPink, LightSalmon, LightSeaGreen, LightSkyBlue, LightSlateGray, LightSteelBlue, LightYellow, Lime, LimeGreen, Linen, Magenta, Maroon, MediumAquamarine, MediumBlue, MediumOrchid, MediumPurple, MediumSeaGreen, MediumSlateBlue, MediumSpringGreen, MediumTurquoise, MediumVioletRed, MidnightBlue, MintCream, MistyRose, Moccasin, NavajoWhite, Navy, OldLace, Olive, OliveDrab, Orange, OrangeRed, Orchid, PaleGoldenrod, PaleGreen, PaleTurquoise, PaleVioletRed, PapayaWhip, PeachPuff, Peru, Pink, Plum, PowderBlue, Purple, Red, RosyBrown, RoyalBlue, SaddleBrown, Salmon, SandyBrown, SeaGreen, SeaShell, Sienna, Silver, SkyBlue, SlateBlue, SlateGray, Snow, SpringGreen, SteelBlue, Tan, Teal, Thistle, Tomato, Transparent, Turquoise, Violet, Wheat, White, WhiteSmoke, Yellow, YellowGreen

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContentFontSize
{{ Fill ContentFontSize Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContentFontWeight
{{ Fill ContentFontWeight Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Black, Bold, DemiBold, ExtraBlack, ExtraBold, ExtraLight, Heavy, Light, Medium, Normal, Regular, SemiBold, Thin, UltraBlack, UltraBold, UltraLight

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContentTextForeground
{{ Fill ContentTextForeground Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: AliceBlue, AntiqueWhite, Aqua, Aquamarine, Azure, Beige, Bisque, Black, BlanchedAlmond, Blue, BlueViolet, Brown, BurlyWood, CadetBlue, Chartreuse, Chocolate, Coral, CornflowerBlue, Cornsilk, Crimson, Cyan, DarkBlue, DarkCyan, DarkGoldenrod, DarkGray, DarkGreen, DarkKhaki, DarkMagenta, DarkOliveGreen, DarkOrange, DarkOrchid, DarkRed, DarkSalmon, DarkSeaGreen, DarkSlateBlue, DarkSlateGray, DarkTurquoise, DarkViolet, DeepPink, DeepSkyBlue, DimGray, DodgerBlue, Firebrick, FloralWhite, ForestGreen, Fuchsia, Gainsboro, GhostWhite, Gold, Goldenrod, Gray, Green, GreenYellow, Honeydew, HotPink, IndianRed, Indigo, Ivory, Khaki, Lavender, LavenderBlush, LawnGreen, LemonChiffon, LightBlue, LightCoral, LightCyan, LightGoldenrodYellow, LightGray, LightGreen, LightPink, LightSalmon, LightSeaGreen, LightSkyBlue, LightSlateGray, LightSteelBlue, LightYellow, Lime, LimeGreen, Linen, Magenta, Maroon, MediumAquamarine, MediumBlue, MediumOrchid, MediumPurple, MediumSeaGreen, MediumSlateBlue, MediumSpringGreen, MediumTurquoise, MediumVioletRed, MidnightBlue, MintCream, MistyRose, Moccasin, NavajoWhite, Navy, OldLace, Olive, OliveDrab, Orange, OrangeRed, Orchid, PaleGoldenrod, PaleGreen, PaleTurquoise, PaleVioletRed, PapayaWhip, PeachPuff, Peru, Pink, Plum, PowderBlue, Purple, Red, RosyBrown, RoyalBlue, SaddleBrown, Salmon, SandyBrown, SeaGreen, SeaShell, Sienna, Silver, SkyBlue, SlateBlue, SlateGray, Snow, SpringGreen, SteelBlue, Tan, Teal, Thistle, Tomato, Transparent, Turquoise, Violet, Wheat, White, WhiteSmoke, Yellow, YellowGreen

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CornerRadius
{{ Fill CornerRadius Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CustomButtons
{{ Fill CustomButtons Description }}

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FontFamily
{{ Fill FontFamily Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Algerian, Anonymous Pro, Arial, Arial Black, Arial Narrow, Arial Rounded MT Bold, Arial Unicode MS, Bahnschrift, Bahnschrift Condensed, Bahnschrift Light, Bahnschrift Light Condensed, Bahnschrift Light SemiCondensed, Bahnschrift SemiBold, Bahnschrift SemiBold Condensed, Bahnschrift SemiBold SemiConden, Bahnschrift SemiCondensed, Bahnschrift SemiLight, Bahnschrift SemiLight Condensed, Bahnschrift SemiLight SemiConde, Baskerville Old Face, Bauhaus 93, Bell MT, Berlin Sans FB, Berlin Sans FB Demi, Bernard MT Condensed, Bitstream Vera Sans Mono, Blackadder ITC, Bodoni MT, Bodoni MT Black, Bodoni MT Condensed, Bodoni MT Poster Compressed, Book Antiqua, Bookman Old Style, Bookshelf Symbol 7, BPmono, BPtypewrite, Bradley Hand ITC, Britannic Bold, Broadway, Brush Script MT, Calibri, Calibri Light, Californian FB, Calisto MT, Cambria, Cambria Math, CamingoCode, Candara, Candara Light, Cascadia Code, Cascadia Mono, Castellar, Centaur, Century, Century Gothic, Century Schoolbook, Chiller, Cispeo, Colonna MT, Comic Sans MS, Consolas, Constantia, Cooper Black, Copperplate Gothic Bold, Copperplate Gothic Light, Corbel, Corbel Light, Courier New, Cousine, CQ Mono, Curlz MT, DejaVu Sans Mono, Ebrima, Edwardian Script ITC, Elephant, Engravers MT, Envy Code R, Eras Bold ITC, Eras Demi ITC, Eras Light ITC, Eras Medium ITC, Felix Titling, Fira Code, Fira Code iScript, Fira Mono, Fira Mono Medium, Footlight MT Light, Forte, Franklin Gothic Book, Franklin Gothic Demi, Franklin Gothic Demi Cond, Franklin Gothic Heavy, Franklin Gothic Medium, Franklin Gothic Medium Cond, Freestyle Script, French Script MT, Gabriola, Gadugi, Garamond, Georgia, Gigi, Gill Sans MT, Gill Sans MT Condensed, Gill Sans MT Ext Condensed Bold, Gill Sans Ultra Bold, Gill Sans Ultra Bold Condensed, Gloucester MT Extra Condensed, Goudy Old Style, Goudy Stout, Hack, Haettenschweiler, Harlow Solid Italic, Harrington, Hasklig, High Tower Text, HoloLens MDL2 Assets, HP Simplified, HyperFont, IBM Plex Mono, IBM Plex Mono ExtraLight, IBM Plex Mono Light, IBM Plex Mono Medium, IBM Plex Mono SemiBold, IBM Plex Mono Thin, Impact, Imprint MT Shadow, Inconsolata, Informal Roman, Ink Free, Javanese Text, JetBrains Mono, JetBrains Mono ExtraBold, JetBrains Mono Medium, Jokerman, Juice ITC, Kristen ITC, Kunstler Script, Lab Mono, Leelawadee UI, Leelawadee UI Semilight, Liberation Mono, Lucida Bright, Lucida Calligraphy, Lucida Console, Lucida Fax, Lucida Handwriting, Lucida Sans, Lucida Sans Typewriter, Lucida Sans Unicode, Magneto, Maiandra GD, Malgun Gothic, Malgun Gothic Semilight, Marlett, Matura MT Script Capitals, Menlo, MetricHPE, MetricHPE Light, MetricHPE Semibold, Microsoft Himalaya, Microsoft JhengHei, Microsoft JhengHei Light, Microsoft JhengHei UI, Microsoft JhengHei UI Light, Microsoft New Tai Lue, Microsoft PhagsPa, Microsoft Sans Serif, Microsoft Tai Le, Microsoft YaHei, Microsoft YaHei Light, Microsoft YaHei UI, Microsoft YaHei UI Light, Microsoft Yi Baiti, MingLiU-ExtB, MingLiU_HKSCS-ExtB, Mistral, Modern No. 20, Monaco, Mongolian Baiti, monofur, Monoid, Monotype Corsiva, MS Gothic, MS Outlook, MS PGothic, MS Reference Sans Serif, MS Reference Specialty, MS UI Gothic, MT Extra, Muar, MV Boli, Myanmar Text, NanumGothicCoding, Niagara Engraved, Niagara Solid, Nirmala UI, Nirmala UI Semilight, NovaMono, NSimSun, OCR A Extended, Old English Text MT, Onyx, Overpass Mono, Overpass Mono Light, Overpass Mono SemiBold, Oxygen Mono, Palace Script MT, Palatino, Palatino Linotype, Papyrus, Parchment, Perpetua, Perpetua Titling MT, Playbill, PMingLiU-ExtB, Pointfree, Poor Richard, Pristina, PT Mono, Rage Italic, Ravie, Roboto, Roboto Black, Roboto Condensed, Roboto Condensed Light, Roboto Light, Roboto Medium, Roboto Mono, Roboto Mono Light, Roboto Mono Medium, Roboto Mono Thin, Roboto Thin, Rockwell, Rockwell Condensed, Rockwell Extra Bold, Script MT Bold, Segoe MDL2 Assets, Segoe Print, Segoe Script, Segoe UI, Segoe UI Black, Segoe UI Emoji, Segoe UI Historic, Segoe UI Light, Segoe UI Semibold, Segoe UI Semilight, Segoe UI Symbol, Share Tech Mono, Showcard Gothic, SimSun, SimSun-ExtB, Sitka Banner, Sitka Display, Sitka Heading, Sitka Small, Sitka Subheading, Sitka Text, Snap ITC, Source Code Pro, Source Code Pro Black, Source Code Pro ExtraLight, Source Code Pro Light, Source Code Pro Medium, Source Code Pro Semibold, Space Mono, Stencil, Sylfaen, Symbol, Tahoma, Tempus Sans ITC, Times New Roman, Trebuchet MS, Tw Cen MT, Tw Cen MT Condensed, Tw Cen MT Condensed Extra Bold, Ubuntu Mono, Univers LT Std 45 Light, Univers LT Std 55, Univers-Black, Univers-Light, Univers-Light-Normal, Verdana, Verily Serif Mono, Viner Hand ITC, Vivaldi, Vladimir Script, Webdings, White Rabbit, Whois, Wide Latin, Wingdings, Wingdings 2, Wingdings 3, Yu Gothic, Yu Gothic Light, Yu Gothic Medium, Yu Gothic UI, Yu Gothic UI Light, Yu Gothic UI Semibold, Yu Gothic UI Semilight

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OnClosed
{{ Fill OnClosed Description }}

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OnLoaded
{{ Fill OnLoaded Description }}

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShadowDepth
{{ Fill ShadowDepth Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sound
{{ Fill Sound Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Windows Background, Windows Balloon, Windows Battery Critical, Windows Battery Low, Windows Critical Stop, Windows Default, Windows Ding, Windows Error, Windows Exclamation, Windows Feed Discovered, Windows Foreground, Windows Hardware Fail, Windows Hardware Insert, Windows Hardware Remove, Windows Information Bar, Windows Logoff Sound, Windows Logon, Windows Menu Command, Windows Message Nudge, Windows Minimize, Windows Navigation Start, Windows Notify Calendar, Windows Notify Email, Windows Notify Messaging, Windows Notify System Generic, Windows Notify, Windows Pop-up Blocked, Windows Print complete, Windows Proximity Connection, Windows Proximity Notification, Windows Recycle, Windows Restore, Windows Ringin, Windows Ringout, Windows Shutdown, Windows Startup, Windows Unlock, Windows User Account Control

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timeout
{{ Fill Timeout Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
{{ Fill Title Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleBackground
{{ Fill TitleBackground Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: AliceBlue, AntiqueWhite, Aqua, Aquamarine, Azure, Beige, Bisque, Black, BlanchedAlmond, Blue, BlueViolet, Brown, BurlyWood, CadetBlue, Chartreuse, Chocolate, Coral, CornflowerBlue, Cornsilk, Crimson, Cyan, DarkBlue, DarkCyan, DarkGoldenrod, DarkGray, DarkGreen, DarkKhaki, DarkMagenta, DarkOliveGreen, DarkOrange, DarkOrchid, DarkRed, DarkSalmon, DarkSeaGreen, DarkSlateBlue, DarkSlateGray, DarkTurquoise, DarkViolet, DeepPink, DeepSkyBlue, DimGray, DodgerBlue, Firebrick, FloralWhite, ForestGreen, Fuchsia, Gainsboro, GhostWhite, Gold, Goldenrod, Gray, Green, GreenYellow, Honeydew, HotPink, IndianRed, Indigo, Ivory, Khaki, Lavender, LavenderBlush, LawnGreen, LemonChiffon, LightBlue, LightCoral, LightCyan, LightGoldenrodYellow, LightGray, LightGreen, LightPink, LightSalmon, LightSeaGreen, LightSkyBlue, LightSlateGray, LightSteelBlue, LightYellow, Lime, LimeGreen, Linen, Magenta, Maroon, MediumAquamarine, MediumBlue, MediumOrchid, MediumPurple, MediumSeaGreen, MediumSlateBlue, MediumSpringGreen, MediumTurquoise, MediumVioletRed, MidnightBlue, MintCream, MistyRose, Moccasin, NavajoWhite, Navy, OldLace, Olive, OliveDrab, Orange, OrangeRed, Orchid, PaleGoldenrod, PaleGreen, PaleTurquoise, PaleVioletRed, PapayaWhip, PeachPuff, Peru, Pink, Plum, PowderBlue, Purple, Red, RosyBrown, RoyalBlue, SaddleBrown, Salmon, SandyBrown, SeaGreen, SeaShell, Sienna, Silver, SkyBlue, SlateBlue, SlateGray, Snow, SpringGreen, SteelBlue, Tan, Teal, Thistle, Tomato, Transparent, Turquoise, Violet, Wheat, White, WhiteSmoke, Yellow, YellowGreen

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleFontSize
{{ Fill TitleFontSize Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleFontWeight
{{ Fill TitleFontWeight Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Black, Bold, DemiBold, ExtraBlack, ExtraBold, ExtraLight, Heavy, Light, Medium, Normal, Regular, SemiBold, Thin, UltraBlack, UltraBold, UltraLight

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleTextForeground
{{ Fill TitleTextForeground Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: AliceBlue, AntiqueWhite, Aqua, Aquamarine, Azure, Beige, Bisque, Black, BlanchedAlmond, Blue, BlueViolet, Brown, BurlyWood, CadetBlue, Chartreuse, Chocolate, Coral, CornflowerBlue, Cornsilk, Crimson, Cyan, DarkBlue, DarkCyan, DarkGoldenrod, DarkGray, DarkGreen, DarkKhaki, DarkMagenta, DarkOliveGreen, DarkOrange, DarkOrchid, DarkRed, DarkSalmon, DarkSeaGreen, DarkSlateBlue, DarkSlateGray, DarkTurquoise, DarkViolet, DeepPink, DeepSkyBlue, DimGray, DodgerBlue, Firebrick, FloralWhite, ForestGreen, Fuchsia, Gainsboro, GhostWhite, Gold, Goldenrod, Gray, Green, GreenYellow, Honeydew, HotPink, IndianRed, Indigo, Ivory, Khaki, Lavender, LavenderBlush, LawnGreen, LemonChiffon, LightBlue, LightCoral, LightCyan, LightGoldenrodYellow, LightGray, LightGreen, LightPink, LightSalmon, LightSeaGreen, LightSkyBlue, LightSlateGray, LightSteelBlue, LightYellow, Lime, LimeGreen, Linen, Magenta, Maroon, MediumAquamarine, MediumBlue, MediumOrchid, MediumPurple, MediumSeaGreen, MediumSlateBlue, MediumSpringGreen, MediumTurquoise, MediumVioletRed, MidnightBlue, MintCream, MistyRose, Moccasin, NavajoWhite, Navy, OldLace, Olive, OliveDrab, Orange, OrangeRed, Orchid, PaleGoldenrod, PaleGreen, PaleTurquoise, PaleVioletRed, PapayaWhip, PeachPuff, Peru, Pink, Plum, PowderBlue, Purple, Red, RosyBrown, RoyalBlue, SaddleBrown, Salmon, SandyBrown, SeaGreen, SeaShell, Sienna, Silver, SkyBlue, SlateBlue, SlateGray, Snow, SpringGreen, SteelBlue, Tan, Teal, Thistle, Tomato, Transparent, Turquoise, Violet, Wheat, White, WhiteSmoke, Yellow, YellowGreen

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowHost
{{ Fill WindowHost Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
