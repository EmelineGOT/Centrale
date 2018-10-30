:-table sg/2.

go:-
    cputime(Start),
    top,
    cputime(End),
    T is End-Start,
    write('TIME:'),write(T),nl.

top:-  
    call_sg(1,400),
    fail.
top.

call_sg(N0,N):-N>N0,!.
call_sg(N0,N):-
    sg_all(N0,_),
    N1 is N0+1,
    call_sg(N0,N).

sg_all(X,Y):-sg(N,Y),fail.
sg_all(X,Y).

sg(X,X).
sg(X,Y):-edge(X1,X),edge(Y1,Y),sg(X1,Y1).

edge(1,2).
edge(1,3).
edge(2,4).
edge(2,5).
edge(3,6).
edge(3,7).
edge(4,8).
edge(4,9).
edge(5,10).
edge(5,11).
edge(6,12).
edge(6,13).
edge(7,14).
edge(7,15).
edge(8,16).
edge(8,17).
edge(9,18).
edge(9,19).
edge(10,20).
edge(10,21).
edge(11,22).
edge(11,23).
edge(12,24).
edge(12,25).
edge(13,26).
edge(13,27).
edge(14,28).
edge(14,29).
edge(15,30).
edge(15,31).
edge(16,32).
edge(16,33).
edge(17,34).
edge(17,35).
edge(18,36).
edge(18,37).
edge(19,38).
edge(19,39).
edge(20,40).
edge(20,41).
edge(21,42).
edge(21,43).
edge(22,44).
edge(22,45).
edge(23,46).
edge(23,47).
edge(24,48).
edge(24,49).
edge(25,50).
edge(25,51).
edge(26,52).
edge(26,53).
edge(27,54).
edge(27,55).
edge(28,56).
edge(28,57).
edge(29,58).
edge(29,59).
edge(30,60).
edge(30,61).
edge(31,62).
edge(31,63).
edge(32,64).
edge(32,65).
edge(33,66).
edge(33,67).
edge(34,68).
edge(34,69).
edge(35,70).
edge(35,71).
edge(36,72).
edge(36,73).
edge(37,74).
edge(37,75).
edge(38,76).
edge(38,77).
edge(39,78).
edge(39,79).
edge(40,80).
edge(40,81).
edge(41,82).
edge(41,83).
edge(42,84).
edge(42,85).
edge(43,86).
edge(43,87).
edge(44,88).
edge(44,89).
edge(45,90).
edge(45,91).
edge(46,92).
edge(46,93).
edge(47,94).
edge(47,95).
edge(48,96).
edge(48,97).
edge(49,98).
edge(49,99).
edge(50,100).
edge(50,101).
edge(51,102).
edge(51,103).
edge(52,104).
edge(52,105).
edge(53,106).
edge(53,107).
edge(54,108).
edge(54,109).
edge(55,110).
edge(55,111).
edge(56,112).
edge(56,113).
edge(57,114).
edge(57,115).
edge(58,116).
edge(58,117).
edge(59,118).
edge(59,119).
edge(60,120).
edge(60,121).
edge(61,122).
edge(61,123).
edge(62,124).
edge(62,125).
edge(63,126).
edge(63,127).
edge(64,128).
edge(64,129).
edge(65,130).
edge(65,131).
edge(66,132).
edge(66,133).
edge(67,134).
edge(67,135).
edge(68,136).
edge(68,137).
edge(69,138).
edge(69,139).
edge(70,140).
edge(70,141).
edge(71,142).
edge(71,143).
edge(72,144).
edge(72,145).
edge(73,146).
edge(73,147).
edge(74,148).
edge(74,149).
edge(75,150).
edge(75,151).
edge(76,152).
edge(76,153).
edge(77,154).
edge(77,155).
edge(78,156).
edge(78,157).
edge(79,158).
edge(79,159).
edge(80,160).
edge(80,161).
edge(81,162).
edge(81,163).
edge(82,164).
edge(82,165).
edge(83,166).
edge(83,167).
edge(84,168).
edge(84,169).
edge(85,170).
edge(85,171).
edge(86,172).
edge(86,173).
edge(87,174).
edge(87,175).
edge(88,176).
edge(88,177).
edge(89,178).
edge(89,179).
edge(90,180).
edge(90,181).
edge(91,182).
edge(91,183).
edge(92,184).
edge(92,185).
edge(93,186).
edge(93,187).
edge(94,188).
edge(94,189).
edge(95,190).
edge(95,191).
edge(96,192).
edge(96,193).
edge(97,194).
edge(97,195).
edge(98,196).
edge(98,197).
edge(99,198).
edge(99,199).
edge(100,200).
edge(100,201).
edge(101,202).
edge(101,203).
edge(102,204).
edge(102,205).
edge(103,206).
edge(103,207).
edge(104,208).
edge(104,209).
edge(105,210).
edge(105,211).
edge(106,212).
edge(106,213).
edge(107,214).
edge(107,215).
edge(108,216).
edge(108,217).
edge(109,218).
edge(109,219).
edge(110,220).
edge(110,221).
edge(111,222).
edge(111,223).
edge(112,224).
edge(112,225).
edge(113,226).
edge(113,227).
edge(114,228).
edge(114,229).
edge(115,230).
edge(115,231).
edge(116,232).
edge(116,233).
edge(117,234).
edge(117,235).
edge(118,236).
edge(118,237).
edge(119,238).
edge(119,239).
edge(120,240).
edge(120,241).
edge(121,242).
edge(121,243).
edge(122,244).
edge(122,245).
edge(123,246).
edge(123,247).
edge(124,248).
edge(124,249).
edge(125,250).
edge(125,251).
edge(126,252).
edge(126,253).
edge(127,254).
edge(127,255).
edge(128,256).
edge(128,257).
edge(129,258).
edge(129,259).
edge(130,260).
edge(130,261).
edge(131,262).
edge(131,263).
edge(132,264).
edge(132,265).
edge(133,266).
edge(133,267).
edge(134,268).
edge(134,269).
edge(135,270).
edge(135,271).
edge(136,272).
edge(136,273).
edge(137,274).
edge(137,275).
edge(138,276).
edge(138,277).
edge(139,278).
edge(139,279).
edge(140,280).
edge(140,281).
edge(141,282).
edge(141,283).
edge(142,284).
edge(142,285).
edge(143,286).
edge(143,287).
edge(144,288).
edge(144,289).
edge(145,290).
edge(145,291).
edge(146,292).
edge(146,293).
edge(147,294).
edge(147,295).
edge(148,296).
edge(148,297).
edge(149,298).
edge(149,299).
edge(150,300).
edge(150,301).
edge(151,302).
edge(151,303).
edge(152,304).
edge(152,305).
edge(153,306).
edge(153,307).
edge(154,308).
edge(154,309).
edge(155,310).
edge(155,311).
edge(156,312).
edge(156,313).
edge(157,314).
edge(157,315).
edge(158,316).
edge(158,317).
edge(159,318).
edge(159,319).
edge(160,320).
edge(160,321).
edge(161,322).
edge(161,323).
edge(162,324).
edge(162,325).
edge(163,326).
edge(163,327).
edge(164,328).
edge(164,329).
edge(165,330).
edge(165,331).
edge(166,332).
edge(166,333).
edge(167,334).
edge(167,335).
edge(168,336).
edge(168,337).
edge(169,338).
edge(169,339).
edge(170,340).
edge(170,341).
edge(171,342).
edge(171,343).
edge(172,344).
edge(172,345).
edge(173,346).
edge(173,347).
edge(174,348).
edge(174,349).
edge(175,350).
edge(175,351).
edge(176,352).
edge(176,353).
edge(177,354).
edge(177,355).
edge(178,356).
edge(178,357).
edge(179,358).
edge(179,359).
edge(180,360).
edge(180,361).
edge(181,362).
edge(181,363).
edge(182,364).
edge(182,365).
edge(183,366).
edge(183,367).
edge(184,368).
edge(184,369).
edge(185,370).
edge(185,371).
edge(186,372).
edge(186,373).
edge(187,374).
edge(187,375).
edge(188,376).
edge(188,377).
edge(189,378).
edge(189,379).
edge(190,380).
edge(190,381).
edge(191,382).
edge(191,383).
edge(192,384).
edge(192,385).
edge(193,386).
edge(193,387).
edge(194,388).
edge(194,389).
edge(195,390).
edge(195,391).
edge(196,392).
edge(196,393).
edge(197,394).
edge(197,395).
edge(198,396).
edge(198,397).
edge(199,398).
edge(199,399).
edge(200,400).
edge(200,401).
