/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP1
/////////////////////////////////////////////////////////////


module timegen ( clock, reset, reset_count, fastwatch, one_second, one_minute
 );
  input clock, reset, reset_count, fastwatch;
  output one_second, one_minute;
  wire   one_minute_reg, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35, N39, n11, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58;
  wire   [13:0] count;

  DFFARX1_RVT \count_reg[0]  ( .D(N21), .CLK(clock), .RSTB(n58), .Q(count[0]), 
        .QN(n56) );
  DFFARX1_RVT \count_reg[13]  ( .D(N34), .CLK(clock), .RSTB(n57), .Q(count[13]), .QN(n55) );
  INVX0_RVT U3 ( .A(reset), .Y(n11) );
  NAND4X0_RVT U4 ( .A1(count[1]), .A2(count[0]), .A3(count[2]), .A4(count[3]), 
        .Y(n37) );
  INVX0_RVT U5 ( .A(n37), .Y(n34) );
  NAND2X0_RVT U6 ( .A1(n34), .A2(count[4]), .Y(n33) );
  INVX0_RVT U7 ( .A(n33), .Y(n30) );
  NAND2X0_RVT U8 ( .A1(n30), .A2(count[5]), .Y(n29) );
  INVX0_RVT U9 ( .A(n29), .Y(n26) );
  NAND2X0_RVT U10 ( .A1(n26), .A2(count[6]), .Y(n25) );
  INVX0_RVT U11 ( .A(n25), .Y(n22) );
  NAND2X0_RVT U12 ( .A1(n22), .A2(count[7]), .Y(n21) );
  INVX0_RVT U13 ( .A(n21), .Y(n54) );
  NAND2X0_RVT U14 ( .A1(n54), .A2(count[8]), .Y(n18) );
  INVX0_RVT U15 ( .A(n18), .Y(n15) );
  NAND2X0_RVT U16 ( .A1(n15), .A2(count[9]), .Y(n14) );
  INVX0_RVT U17 ( .A(n14), .Y(n10) );
  NAND2X0_RVT U18 ( .A1(count[10]), .A2(n10), .Y(n9) );
  INVX0_RVT U19 ( .A(n9), .Y(n6) );
  NAND2X0_RVT U20 ( .A1(count[11]), .A2(n6), .Y(n5) );
  INVX0_RVT U21 ( .A(n5), .Y(n2) );
  NAND2X0_RVT U22 ( .A1(count[12]), .A2(n2), .Y(n50) );
  INVX0_RVT U23 ( .A(reset_count), .Y(n53) );
  NAND4X0_RVT U24 ( .A1(count[11]), .A2(n10), .A3(count[12]), .A4(count[13]), 
        .Y(n1) );
  OR2X1_RVT U25 ( .A1(count[10]), .A2(n1), .Y(n48) );
  AND2X1_RVT U26 ( .A1(n53), .A2(n48), .Y(n49) );
  AND2X1_RVT U27 ( .A1(n50), .A2(n49), .Y(n4) );
  OR2X1_RVT U28 ( .A1(n2), .A2(count[12]), .Y(n3) );
  AND2X1_RVT U29 ( .A1(n4), .A2(n3), .Y(N33) );
  AND2X1_RVT U30 ( .A1(n5), .A2(n49), .Y(n8) );
  OR2X1_RVT U31 ( .A1(n6), .A2(count[11]), .Y(n7) );
  AND2X1_RVT U32 ( .A1(n8), .A2(n7), .Y(N32) );
  AND2X1_RVT U33 ( .A1(n9), .A2(n49), .Y(n13) );
  OR2X1_RVT U34 ( .A1(n10), .A2(count[10]), .Y(n12) );
  AND2X1_RVT U35 ( .A1(n13), .A2(n12), .Y(N31) );
  AND2X1_RVT U36 ( .A1(n14), .A2(n53), .Y(n17) );
  OR2X1_RVT U37 ( .A1(count[9]), .A2(n15), .Y(n16) );
  AND2X1_RVT U38 ( .A1(n17), .A2(n16), .Y(N30) );
  AND2X1_RVT U39 ( .A1(n18), .A2(n49), .Y(n20) );
  OR2X1_RVT U40 ( .A1(count[8]), .A2(n54), .Y(n19) );
  AND2X1_RVT U41 ( .A1(n20), .A2(n19), .Y(N29) );
  AND2X1_RVT U42 ( .A1(n21), .A2(n49), .Y(n24) );
  OR2X1_RVT U43 ( .A1(count[7]), .A2(n22), .Y(n23) );
  AND2X1_RVT U44 ( .A1(n24), .A2(n23), .Y(N28) );
  AND2X1_RVT U45 ( .A1(n25), .A2(n49), .Y(n28) );
  OR2X1_RVT U46 ( .A1(count[6]), .A2(n26), .Y(n27) );
  AND2X1_RVT U47 ( .A1(n28), .A2(n27), .Y(N27) );
  AND2X1_RVT U48 ( .A1(n29), .A2(n49), .Y(n32) );
  OR2X1_RVT U49 ( .A1(count[5]), .A2(n30), .Y(n31) );
  AND2X1_RVT U50 ( .A1(n32), .A2(n31), .Y(N26) );
  AND2X1_RVT U51 ( .A1(n33), .A2(n49), .Y(n36) );
  OR2X1_RVT U52 ( .A1(count[4]), .A2(n34), .Y(n35) );
  AND2X1_RVT U53 ( .A1(n36), .A2(n35), .Y(N25) );
  AND2X1_RVT U54 ( .A1(n37), .A2(n49), .Y(n40) );
  NAND3X0_RVT U55 ( .A1(count[1]), .A2(count[0]), .A3(count[2]), .Y(n41) );
  INVX0_RVT U56 ( .A(n41), .Y(n38) );
  OR2X1_RVT U57 ( .A1(count[3]), .A2(n38), .Y(n39) );
  AND2X1_RVT U58 ( .A1(n40), .A2(n39), .Y(N24) );
  AND2X1_RVT U59 ( .A1(n41), .A2(n49), .Y(n44) );
  NAND2X0_RVT U60 ( .A1(count[1]), .A2(count[0]), .Y(n45) );
  INVX0_RVT U61 ( .A(n45), .Y(n42) );
  OR2X1_RVT U62 ( .A1(count[2]), .A2(n42), .Y(n43) );
  AND2X1_RVT U63 ( .A1(n44), .A2(n43), .Y(N23) );
  AND2X1_RVT U64 ( .A1(n45), .A2(n49), .Y(n47) );
  OR2X1_RVT U65 ( .A1(count[0]), .A2(count[1]), .Y(n46) );
  AND2X1_RVT U66 ( .A1(n47), .A2(n46), .Y(N22) );
  NOR2X0_RVT U67 ( .A1(reset_count), .A2(n48), .Y(N35) );
  AND2X1_RVT U68 ( .A1(n49), .A2(n56), .Y(N21) );
  INVX0_RVT U69 ( .A(n50), .Y(n51) );
  OA221X1_RVT U70 ( .A1(count[13]), .A2(n51), .A3(n55), .A4(n50), .A5(n49), 
        .Y(N34) );
  INVX0_RVT U71 ( .A(fastwatch), .Y(n52) );
  AO22X1_RVT U72 ( .A1(fastwatch), .A2(one_second), .A3(n52), .A4(
        one_minute_reg), .Y(one_minute) );
  AND2X1_RVT U73 ( .A1(n54), .A2(n53), .Y(N39) );
  DFFASRX1_RVT one_second_reg ( .D(N39), .CLK(clock), .RSTB(n57), .SETB(1'b1), 
        .Q(one_second) );
  DFFASRX1_RVT \count_reg[9]  ( .D(N30), .CLK(clock), .RSTB(n58), .SETB(1'b1), 
        .Q(count[9]) );
  DFFASRX1_RVT one_minute_reg_reg ( .D(N35), .CLK(clock), .RSTB(n57), .SETB(
        1'b1), .Q(one_minute_reg) );
  DFFASRX1_RVT \count_reg[2]  ( .D(N23), .CLK(clock), .RSTB(n58), .SETB(1'b1), 
        .Q(count[2]) );
  DFFASRX1_RVT \count_reg[7]  ( .D(N28), .CLK(clock), .RSTB(n57), .SETB(1'b1), 
        .Q(count[7]) );
  DFFASRX1_RVT \count_reg[6]  ( .D(N27), .CLK(clock), .RSTB(n58), .SETB(1'b1), 
        .Q(count[6]) );
  DFFASRX1_RVT \count_reg[5]  ( .D(N26), .CLK(clock), .RSTB(n57), .SETB(1'b1), 
        .Q(count[5]) );
  DFFASRX1_RVT \count_reg[10]  ( .D(N31), .CLK(clock), .RSTB(n58), .SETB(1'b1), 
        .Q(count[10]) );
  DFFASRX1_RVT \count_reg[11]  ( .D(N32), .CLK(clock), .RSTB(n57), .SETB(1'b1), 
        .Q(count[11]) );
  DFFASRX1_RVT \count_reg[4]  ( .D(N25), .CLK(clock), .RSTB(n11), .SETB(1'b1), 
        .Q(count[4]) );
  DFFASRX1_RVT \count_reg[1]  ( .D(N22), .CLK(clock), .RSTB(n11), .SETB(1'b1), 
        .Q(count[1]) );
  DFFASRX1_RVT \count_reg[8]  ( .D(N29), .CLK(clock), .RSTB(n11), .SETB(1'b1), 
        .Q(count[8]) );
  DFFASRX1_RVT \count_reg[3]  ( .D(N24), .CLK(clock), .RSTB(n11), .SETB(1'b1), 
        .Q(count[3]) );
  DFFASRX1_RVT \count_reg[12]  ( .D(N33), .CLK(clock), .RSTB(n11), .SETB(1'b1), 
        .Q(count[12]) );
  INVX0_RVT U74 ( .A(reset), .Y(n57) );
  INVX0_RVT U75 ( .A(reset), .Y(n58) );
endmodule


module counter ( clk, reset, one_minute, load_new_c, new_current_time_ms_hr, 
        new_current_time_ms_min, new_current_time_ls_hr, 
        new_current_time_ls_min, current_time_ms_hr, current_time_ms_min, 
        current_time_ls_hr, current_time_ls_min );
  input [3:0] new_current_time_ms_hr;
  input [3:0] new_current_time_ms_min;
  input [3:0] new_current_time_ls_hr;
  input [3:0] new_current_time_ls_min;
  output [3:0] current_time_ms_hr;
  output [3:0] current_time_ms_min;
  output [3:0] current_time_ls_hr;
  output [3:0] current_time_ls_min;
  input clk, reset, one_minute, load_new_c;
  wire   n75, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n76, n77, n78, n79, n80, n81;

  DFFARX1_RVT \current_time_ls_min_reg[1]  ( .D(n104), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ls_min[1]), .QN(n72) );
  DFFARX1_RVT \current_time_ls_min_reg[2]  ( .D(n103), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ls_min[2]), .QN(n68) );
  DFFARX1_RVT \current_time_ls_min_reg[3]  ( .D(n102), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ls_min[3]), .QN(n81) );
  DFFARX1_RVT \current_time_ms_min_reg[0]  ( .D(n96), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ms_min[0]), .QN(n69) );
  DFFARX1_RVT \current_time_ms_min_reg[1]  ( .D(n95), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ms_min[1]), .QN(n74) );
  DFFARX1_RVT \current_time_ms_min_reg[2]  ( .D(n94), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ms_min[2]), .QN(n73) );
  DFFARX1_RVT \current_time_ms_hr_reg[0]  ( .D(n106), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ms_hr[0]), .QN(n67) );
  DFFARX1_RVT \current_time_ms_hr_reg[2]  ( .D(n91), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ms_hr[2]), .QN(n78) );
  DFFARX1_RVT \current_time_ls_hr_reg[0]  ( .D(n100), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ls_hr[0]), .QN(n79) );
  DFFARX1_RVT \current_time_ls_hr_reg[1]  ( .D(n99), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ls_hr[1]), .QN(n70) );
  DFFARX1_RVT \current_time_ls_hr_reg[2]  ( .D(n98), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ls_hr[2]), .QN(n76) );
  DFFARX1_RVT \current_time_ls_hr_reg[3]  ( .D(n97), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ls_hr[3]), .QN(n71) );
  DFFARX1_RVT \current_time_ms_hr_reg[1]  ( .D(n92), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ms_hr[1]), .QN(n80) );
  DFFARX1_RVT \current_time_ms_hr_reg[3]  ( .D(n101), .CLK(clk), .RSTB(n75), 
        .Q(current_time_ms_hr[3]), .QN(n77) );
  INVX2_RVT U3 ( .A(reset), .Y(n75) );
  INVX0_RVT U4 ( .A(load_new_c), .Y(n47) );
  INVX0_RVT U5 ( .A(new_current_time_ms_hr[0]), .Y(n4) );
  NAND4X0_RVT U6 ( .A1(current_time_ls_hr[0]), .A2(current_time_ls_hr[3]), 
        .A3(n76), .A4(n70), .Y(n28) );
  AND2X1_RVT U7 ( .A1(current_time_ls_hr[0]), .A2(n76), .Y(n2) );
  AND4X1_RVT U8 ( .A1(n77), .A2(n71), .A3(n67), .A4(current_time_ms_hr[1]), 
        .Y(n1) );
  NAND4X0_RVT U9 ( .A1(current_time_ls_hr[1]), .A2(n2), .A3(n1), .A4(n78), .Y(
        n27) );
  NAND2X0_RVT U10 ( .A1(n28), .A2(n27), .Y(n3) );
  NAND4X0_RVT U11 ( .A1(current_time_ls_min[0]), .A2(current_time_ls_min[3]), 
        .A3(n68), .A4(n72), .Y(n43) );
  INVX0_RVT U12 ( .A(n43), .Y(n48) );
  NOR3X0_RVT U13 ( .A1(n69), .A2(n73), .A3(current_time_ms_min[3]), .Y(n57) );
  AND3X1_RVT U14 ( .A1(n74), .A2(n48), .A3(n57), .Y(n44) );
  NAND2X0_RVT U15 ( .A1(n44), .A2(one_minute), .Y(n5) );
  NAND2X0_RVT U16 ( .A1(n47), .A2(n5), .Y(n31) );
  OA21X1_RVT U17 ( .A1(load_new_c), .A2(n3), .A3(n31), .Y(n22) );
  OA22X1_RVT U18 ( .A1(n47), .A2(n4), .A3(n67), .A4(n22), .Y(n7) );
  NOR2X0_RVT U19 ( .A1(n5), .A2(load_new_c), .Y(n29) );
  INVX0_RVT U20 ( .A(n28), .Y(n6) );
  NAND2X0_RVT U21 ( .A1(n29), .A2(n6), .Y(n60) );
  INVX0_RVT U22 ( .A(n60), .Y(n20) );
  NAND2X0_RVT U23 ( .A1(n20), .A2(n67), .Y(n21) );
  NAND2X0_RVT U24 ( .A1(n7), .A2(n21), .Y(n106) );
  AO21X1_RVT U25 ( .A1(current_time_ls_min[0]), .A2(one_minute), .A3(
        load_new_c), .Y(n14) );
  INVX0_RVT U26 ( .A(n14), .Y(n9) );
  OR2X1_RVT U27 ( .A1(current_time_ls_min[0]), .A2(one_minute), .Y(n8) );
  AO22X1_RVT U28 ( .A1(load_new_c), .A2(new_current_time_ls_min[0]), .A3(n9), 
        .A4(n8), .Y(n105) );
  NAND4X0_RVT U29 ( .A1(one_minute), .A2(n47), .A3(n72), .A4(n43), .Y(n11) );
  INVX0_RVT U30 ( .A(n11), .Y(n10) );
  AO222X1_RVT U31 ( .A1(load_new_c), .A2(new_current_time_ls_min[1]), .A3(
        current_time_ls_min[0]), .A4(n10), .A5(n9), .A6(current_time_ls_min[1]), .Y(n104) );
  NAND4X0_RVT U32 ( .A1(current_time_ls_min[1]), .A2(current_time_ls_min[0]), 
        .A3(one_minute), .A4(n47), .Y(n17) );
  OA222X1_RVT U33 ( .A1(n68), .A2(n11), .A3(n68), .A4(n14), .A5(
        current_time_ls_min[2]), .A6(n17), .Y(n13) );
  NAND2X0_RVT U34 ( .A1(load_new_c), .A2(new_current_time_ls_min[2]), .Y(n12)
         );
  NAND2X0_RVT U35 ( .A1(n13), .A2(n12), .Y(n103) );
  NAND2X0_RVT U36 ( .A1(n43), .A2(n47), .Y(n15) );
  OA221X1_RVT U37 ( .A1(n15), .A2(current_time_ls_min[1]), .A3(n15), .A4(
        current_time_ls_min[2]), .A5(n14), .Y(n16) );
  AO222X1_RVT U38 ( .A1(n81), .A2(n68), .A3(n81), .A4(n17), .A5(
        current_time_ls_min[3]), .A6(n16), .Y(n19) );
  NAND2X0_RVT U39 ( .A1(load_new_c), .A2(new_current_time_ls_min[3]), .Y(n18)
         );
  NAND2X0_RVT U40 ( .A1(n19), .A2(n18), .Y(n102) );
  AND3X1_RVT U41 ( .A1(n20), .A2(current_time_ms_hr[1]), .A3(
        current_time_ms_hr[0]), .Y(n64) );
  NAND3X0_RVT U42 ( .A1(current_time_ms_hr[2]), .A2(n64), .A3(n77), .Y(n25) );
  NAND2X0_RVT U43 ( .A1(new_current_time_ms_hr[3]), .A2(load_new_c), .Y(n24)
         );
  AND2X1_RVT U44 ( .A1(n22), .A2(n21), .Y(n59) );
  OA21X1_RVT U45 ( .A1(current_time_ms_hr[1]), .A2(n60), .A3(n59), .Y(n63) );
  AO221X1_RVT U46 ( .A1(n63), .A2(current_time_ms_hr[2]), .A3(n63), .A4(n60), 
        .A5(n77), .Y(n23) );
  NAND3X0_RVT U47 ( .A1(n25), .A2(n24), .A3(n23), .Y(n101) );
  INVX0_RVT U48 ( .A(n31), .Y(n34) );
  AOI22X1_RVT U49 ( .A1(load_new_c), .A2(new_current_time_ls_hr[0]), .A3(
        current_time_ls_hr[0]), .A4(n34), .Y(n26) );
  NAND4X0_RVT U50 ( .A1(n29), .A2(n28), .A3(n79), .A4(n27), .Y(n30) );
  NAND2X0_RVT U51 ( .A1(n26), .A2(n30), .Y(n100) );
  AND3X1_RVT U52 ( .A1(n29), .A2(n28), .A3(n27), .Y(n37) );
  NAND2X0_RVT U53 ( .A1(n31), .A2(n30), .Y(n32) );
  OA222X1_RVT U54 ( .A1(current_time_ls_hr[1]), .A2(current_time_ls_hr[0]), 
        .A3(current_time_ls_hr[1]), .A4(n37), .A5(n70), .A6(n32), .Y(n33) );
  AO21X1_RVT U55 ( .A1(load_new_c), .A2(new_current_time_ls_hr[1]), .A3(n33), 
        .Y(n99) );
  AO221X1_RVT U56 ( .A1(n37), .A2(n70), .A3(n37), .A4(n79), .A5(n34), .Y(n38)
         );
  AND3X1_RVT U57 ( .A1(current_time_ls_hr[0]), .A2(current_time_ls_hr[1]), 
        .A3(n37), .Y(n36) );
  AO22X1_RVT U58 ( .A1(load_new_c), .A2(new_current_time_ls_hr[2]), .A3(n36), 
        .A4(n76), .Y(n35) );
  AO21X1_RVT U59 ( .A1(current_time_ls_hr[2]), .A2(n38), .A3(n35), .Y(n98) );
  NAND3X0_RVT U60 ( .A1(current_time_ls_hr[2]), .A2(n36), .A3(n71), .Y(n41) );
  NAND2X0_RVT U61 ( .A1(new_current_time_ls_hr[3]), .A2(load_new_c), .Y(n40)
         );
  OAI221X1_RVT U62 ( .A1(n38), .A2(n76), .A3(n38), .A4(n37), .A5(
        current_time_ls_hr[3]), .Y(n39) );
  NAND3X0_RVT U63 ( .A1(n41), .A2(n40), .A3(n39), .Y(n97) );
  AO21X1_RVT U64 ( .A1(n48), .A2(one_minute), .A3(load_new_c), .Y(n51) );
  NAND2X0_RVT U65 ( .A1(one_minute), .A2(n47), .Y(n42) );
  OR3X1_RVT U66 ( .A1(n44), .A2(n43), .A3(n42), .Y(n55) );
  AO22X1_RVT U67 ( .A1(current_time_ms_min[0]), .A2(n51), .A3(n69), .A4(n55), 
        .Y(n46) );
  NAND2X0_RVT U68 ( .A1(load_new_c), .A2(new_current_time_ms_min[0]), .Y(n45)
         );
  NAND2X0_RVT U69 ( .A1(n46), .A2(n45), .Y(n96) );
  AND4X1_RVT U70 ( .A1(n48), .A2(current_time_ms_min[1]), .A3(one_minute), 
        .A4(n47), .Y(n56) );
  AOI22X1_RVT U71 ( .A1(load_new_c), .A2(new_current_time_ms_min[1]), .A3(n56), 
        .A4(n69), .Y(n50) );
  AO222X1_RVT U72 ( .A1(n74), .A2(n69), .A3(n74), .A4(n55), .A5(
        current_time_ms_min[1]), .A6(n51), .Y(n49) );
  NAND2X0_RVT U73 ( .A1(n50), .A2(n49), .Y(n95) );
  OA221X1_RVT U74 ( .A1(n55), .A2(current_time_ms_min[0]), .A3(n55), .A4(
        current_time_ms_min[1]), .A5(n51), .Y(n54) );
  INVX0_RVT U75 ( .A(n54), .Y(n52) );
  OA222X1_RVT U76 ( .A1(current_time_ms_min[2]), .A2(current_time_ms_min[0]), 
        .A3(current_time_ms_min[2]), .A4(n56), .A5(n73), .A6(n52), .Y(n53) );
  AO21X1_RVT U77 ( .A1(load_new_c), .A2(new_current_time_ms_min[2]), .A3(n53), 
        .Y(n94) );
  OAI21X1_RVT U78 ( .A1(current_time_ms_min[2]), .A2(n55), .A3(n54), .Y(n58)
         );
  AO222X1_RVT U79 ( .A1(n58), .A2(current_time_ms_min[3]), .A3(n57), .A4(n56), 
        .A5(load_new_c), .A6(new_current_time_ms_min[3]), .Y(n93) );
  AO222X1_RVT U80 ( .A1(n80), .A2(n60), .A3(n80), .A4(n67), .A5(
        current_time_ms_hr[1]), .A6(n59), .Y(n62) );
  NAND2X0_RVT U81 ( .A1(load_new_c), .A2(new_current_time_ms_hr[1]), .Y(n61)
         );
  NAND2X0_RVT U82 ( .A1(n62), .A2(n61), .Y(n92) );
  INVX0_RVT U83 ( .A(n63), .Y(n66) );
  AO22X1_RVT U84 ( .A1(load_new_c), .A2(new_current_time_ms_hr[2]), .A3(n64), 
        .A4(n78), .Y(n65) );
  AO21X1_RVT U85 ( .A1(current_time_ms_hr[2]), .A2(n66), .A3(n65), .Y(n91) );
  DFFASRX1_RVT \current_time_ls_min_reg[0]  ( .D(n105), .CLK(clk), .RSTB(n75), 
        .SETB(1'b1), .Q(current_time_ls_min[0]) );
  DFFASRX1_RVT \current_time_ms_min_reg[3]  ( .D(n93), .CLK(clk), .RSTB(n75), 
        .SETB(1'b1), .Q(current_time_ms_min[3]) );
endmodule


module alarm_reg ( new_alarm_ms_hr, new_alarm_ls_hr, new_alarm_ms_min, 
        new_alarm_ls_min, load_new_alarm, clock, reset, alarm_time_ms_hr, 
        alarm_time_ls_hr, alarm_time_ms_min, alarm_time_ls_min );
  input [3:0] new_alarm_ms_hr;
  input [3:0] new_alarm_ls_hr;
  input [3:0] new_alarm_ms_min;
  input [3:0] new_alarm_ls_min;
  output [3:0] alarm_time_ms_hr;
  output [3:0] alarm_time_ls_hr;
  output [3:0] alarm_time_ms_min;
  output [3:0] alarm_time_ls_min;
  input load_new_alarm, clock, reset;
  wire   n2, n3, n5, n7, n9, n11, n13, n15, n17, n19, n21, n23, n25, n27, n29,
         n31, n33, n1;

  IBUFFX2_RVT U2 ( .A(load_new_alarm), .Y(n1) );
  INVX4_RVT U3 ( .A(reset), .Y(n2) );
  AO22X1_RVT U4 ( .A1(load_new_alarm), .A2(new_alarm_ls_hr[3]), .A3(n1), .A4(
        alarm_time_ls_hr[3]), .Y(n33) );
  AO22X1_RVT U5 ( .A1(load_new_alarm), .A2(new_alarm_ls_hr[2]), .A3(n1), .A4(
        alarm_time_ls_hr[2]), .Y(n31) );
  AO22X1_RVT U6 ( .A1(load_new_alarm), .A2(new_alarm_ls_hr[1]), .A3(n1), .A4(
        alarm_time_ls_hr[1]), .Y(n29) );
  AO22X1_RVT U7 ( .A1(load_new_alarm), .A2(new_alarm_ls_hr[0]), .A3(n1), .A4(
        alarm_time_ls_hr[0]), .Y(n27) );
  AO22X1_RVT U8 ( .A1(load_new_alarm), .A2(new_alarm_ms_min[3]), .A3(n1), .A4(
        alarm_time_ms_min[3]), .Y(n25) );
  AO22X1_RVT U9 ( .A1(load_new_alarm), .A2(new_alarm_ms_min[2]), .A3(n1), .A4(
        alarm_time_ms_min[2]), .Y(n23) );
  AO22X1_RVT U10 ( .A1(load_new_alarm), .A2(new_alarm_ms_min[1]), .A3(n1), 
        .A4(alarm_time_ms_min[1]), .Y(n21) );
  AO22X1_RVT U11 ( .A1(load_new_alarm), .A2(new_alarm_ms_min[0]), .A3(n1), 
        .A4(alarm_time_ms_min[0]), .Y(n19) );
  AO22X1_RVT U12 ( .A1(load_new_alarm), .A2(new_alarm_ls_min[3]), .A3(n1), 
        .A4(alarm_time_ls_min[3]), .Y(n17) );
  AO22X1_RVT U13 ( .A1(load_new_alarm), .A2(new_alarm_ls_min[2]), .A3(n1), 
        .A4(alarm_time_ls_min[2]), .Y(n15) );
  AO22X1_RVT U14 ( .A1(load_new_alarm), .A2(new_alarm_ls_min[1]), .A3(n1), 
        .A4(alarm_time_ls_min[1]), .Y(n13) );
  AO22X1_RVT U15 ( .A1(load_new_alarm), .A2(new_alarm_ls_min[0]), .A3(n1), 
        .A4(alarm_time_ls_min[0]), .Y(n11) );
  AO22X1_RVT U16 ( .A1(load_new_alarm), .A2(new_alarm_ms_hr[3]), .A3(n1), .A4(
        alarm_time_ms_hr[3]), .Y(n9) );
  AO22X1_RVT U17 ( .A1(load_new_alarm), .A2(new_alarm_ms_hr[2]), .A3(n1), .A4(
        alarm_time_ms_hr[2]), .Y(n7) );
  AO22X1_RVT U18 ( .A1(load_new_alarm), .A2(new_alarm_ms_hr[1]), .A3(n1), .A4(
        alarm_time_ms_hr[1]), .Y(n5) );
  AO22X1_RVT U19 ( .A1(load_new_alarm), .A2(new_alarm_ms_hr[0]), .A3(n1), .A4(
        alarm_time_ms_hr[0]), .Y(n3) );
  DFFASRX1_RVT \alarm_time_ms_min_reg[3]  ( .D(n25), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ms_min[3]) );
  DFFASRX1_RVT \alarm_time_ms_min_reg[2]  ( .D(n23), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ms_min[2]) );
  DFFASRX1_RVT \alarm_time_ms_min_reg[1]  ( .D(n21), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ms_min[1]) );
  DFFASRX1_RVT \alarm_time_ms_min_reg[0]  ( .D(n19), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ms_min[0]) );
  DFFASRX1_RVT \alarm_time_ms_hr_reg[3]  ( .D(n9), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ms_hr[3]) );
  DFFASRX1_RVT \alarm_time_ms_hr_reg[2]  ( .D(n7), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ms_hr[2]) );
  DFFASRX1_RVT \alarm_time_ms_hr_reg[1]  ( .D(n5), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ms_hr[1]) );
  DFFASRX1_RVT \alarm_time_ms_hr_reg[0]  ( .D(n3), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ms_hr[0]) );
  DFFASRX1_RVT \alarm_time_ls_min_reg[3]  ( .D(n17), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ls_min[3]) );
  DFFASRX1_RVT \alarm_time_ls_min_reg[2]  ( .D(n15), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ls_min[2]) );
  DFFASRX1_RVT \alarm_time_ls_min_reg[1]  ( .D(n13), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ls_min[1]) );
  DFFASRX1_RVT \alarm_time_ls_min_reg[0]  ( .D(n11), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ls_min[0]) );
  DFFASRX1_RVT \alarm_time_ls_hr_reg[3]  ( .D(n33), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ls_hr[3]) );
  DFFASRX1_RVT \alarm_time_ls_hr_reg[2]  ( .D(n31), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ls_hr[2]) );
  DFFASRX1_RVT \alarm_time_ls_hr_reg[1]  ( .D(n29), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ls_hr[1]) );
  DFFASRX1_RVT \alarm_time_ls_hr_reg[0]  ( .D(n27), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(alarm_time_ls_hr[0]) );
endmodule


module keyreg ( reset, clock, shift, key, key_buffer_ls_min, key_buffer_ms_min, 
        key_buffer_ls_hr, key_buffer_ms_hr );
  input [3:0] key;
  output [3:0] key_buffer_ls_min;
  output [3:0] key_buffer_ms_min;
  output [3:0] key_buffer_ls_hr;
  output [3:0] key_buffer_ms_hr;
  input reset, clock, shift;
  wire   n2, n3, n5, n7, n9, n11, n13, n15, n17, n19, n21, n23, n25, n27, n29,
         n31, n33, n1;

  IBUFFX2_RVT U2 ( .A(shift), .Y(n1) );
  INVX4_RVT U3 ( .A(reset), .Y(n2) );
  AO22X1_RVT U4 ( .A1(shift), .A2(key[3]), .A3(n1), .A4(key_buffer_ls_min[3]), 
        .Y(n33) );
  AO22X1_RVT U5 ( .A1(shift), .A2(key_buffer_ls_min[3]), .A3(n1), .A4(
        key_buffer_ms_min[3]), .Y(n31) );
  AO22X1_RVT U6 ( .A1(shift), .A2(key_buffer_ms_min[3]), .A3(n1), .A4(
        key_buffer_ls_hr[3]), .Y(n29) );
  AO22X1_RVT U7 ( .A1(shift), .A2(key_buffer_ls_hr[3]), .A3(n1), .A4(
        key_buffer_ms_hr[3]), .Y(n27) );
  AO22X1_RVT U8 ( .A1(shift), .A2(key[2]), .A3(n1), .A4(key_buffer_ls_min[2]), 
        .Y(n25) );
  AO22X1_RVT U9 ( .A1(shift), .A2(key_buffer_ls_min[2]), .A3(n1), .A4(
        key_buffer_ms_min[2]), .Y(n23) );
  AO22X1_RVT U10 ( .A1(shift), .A2(key_buffer_ms_min[2]), .A3(n1), .A4(
        key_buffer_ls_hr[2]), .Y(n21) );
  AO22X1_RVT U11 ( .A1(shift), .A2(key_buffer_ls_hr[2]), .A3(n1), .A4(
        key_buffer_ms_hr[2]), .Y(n19) );
  AO22X1_RVT U12 ( .A1(shift), .A2(key[1]), .A3(n1), .A4(key_buffer_ls_min[1]), 
        .Y(n17) );
  AO22X1_RVT U13 ( .A1(shift), .A2(key_buffer_ls_min[1]), .A3(n1), .A4(
        key_buffer_ms_min[1]), .Y(n15) );
  AO22X1_RVT U14 ( .A1(shift), .A2(key_buffer_ms_min[1]), .A3(n1), .A4(
        key_buffer_ls_hr[1]), .Y(n13) );
  AO22X1_RVT U15 ( .A1(shift), .A2(key_buffer_ls_hr[1]), .A3(n1), .A4(
        key_buffer_ms_hr[1]), .Y(n11) );
  AO22X1_RVT U16 ( .A1(shift), .A2(key[0]), .A3(n1), .A4(key_buffer_ls_min[0]), 
        .Y(n9) );
  AO22X1_RVT U17 ( .A1(shift), .A2(key_buffer_ls_min[0]), .A3(n1), .A4(
        key_buffer_ms_min[0]), .Y(n7) );
  AO22X1_RVT U18 ( .A1(shift), .A2(key_buffer_ms_min[0]), .A3(n1), .A4(
        key_buffer_ls_hr[0]), .Y(n5) );
  AO22X1_RVT U19 ( .A1(shift), .A2(key_buffer_ls_hr[0]), .A3(n1), .A4(
        key_buffer_ms_hr[0]), .Y(n3) );
  DFFASRX1_RVT \key_buffer_ms_min_reg[3]  ( .D(n31), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ms_min[3]) );
  DFFASRX1_RVT \key_buffer_ms_min_reg[2]  ( .D(n23), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ms_min[2]) );
  DFFASRX1_RVT \key_buffer_ms_min_reg[1]  ( .D(n15), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ms_min[1]) );
  DFFASRX1_RVT \key_buffer_ms_min_reg[0]  ( .D(n7), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ms_min[0]) );
  DFFASRX1_RVT \key_buffer_ms_hr_reg[3]  ( .D(n27), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ms_hr[3]) );
  DFFASRX1_RVT \key_buffer_ms_hr_reg[2]  ( .D(n19), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ms_hr[2]) );
  DFFASRX1_RVT \key_buffer_ms_hr_reg[1]  ( .D(n11), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ms_hr[1]) );
  DFFASRX1_RVT \key_buffer_ms_hr_reg[0]  ( .D(n3), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ms_hr[0]) );
  DFFASRX1_RVT \key_buffer_ls_hr_reg[3]  ( .D(n29), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ls_hr[3]) );
  DFFASRX1_RVT \key_buffer_ls_hr_reg[2]  ( .D(n21), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ls_hr[2]) );
  DFFASRX1_RVT \key_buffer_ls_hr_reg[1]  ( .D(n13), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ls_hr[1]) );
  DFFASRX1_RVT \key_buffer_ls_hr_reg[0]  ( .D(n5), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ls_hr[0]) );
  DFFASRX1_RVT \key_buffer_ls_min_reg[3]  ( .D(n33), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ls_min[3]) );
  DFFASRX1_RVT \key_buffer_ls_min_reg[2]  ( .D(n25), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ls_min[2]) );
  DFFASRX1_RVT \key_buffer_ls_min_reg[1]  ( .D(n17), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ls_min[1]) );
  DFFASRX1_RVT \key_buffer_ls_min_reg[0]  ( .D(n9), .CLK(clock), .RSTB(n2), 
        .SETB(1'b1), .Q(key_buffer_ls_min[0]) );
endmodule


module fsm ( clock, reset, one_second, time_button, alarm_button, key, 
        reset_count, load_new_a, show_a, show_new_time, load_new_c, shift );
  input [3:0] key;
  input clock, reset, one_second, time_button, alarm_button;
  output reset_count, load_new_a, show_a, show_new_time, load_new_c, shift;
  wire   N102, N106, N109, N112, n49, n60, n61, n62, n63, n64, n65, n66, n67,
         n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n41, n42, n43, n44, n45,
         n46, n47, n48, n50;
  wire   [3:0] count1;
  wire   [2:0] pre_state;
  wire   [3:0] count2;
  wire   [2:0] next_state;
  assign load_new_a = N102;
  assign show_a = N106;
  assign load_new_c = N109;
  assign shift = N112;

  DFFARX1_RVT \pre_state_reg[0]  ( .D(next_state[0]), .CLK(clock), .RSTB(n49), 
        .Q(pre_state[0]), .QN(n41) );
  DFFARX1_RVT \count2_reg[1]  ( .D(n60), .CLK(clock), .RSTB(n49), .Q(count2[1]), .QN(n44) );
  DFFARX1_RVT \count2_reg[2]  ( .D(n61), .CLK(clock), .RSTB(n49), .Q(count2[2]), .QN(n47) );
  DFFARX1_RVT \count2_reg[3]  ( .D(n63), .CLK(clock), .RSTB(n49), .Q(count2[3]), .QN(n48) );
  DFFARX1_RVT \pre_state_reg[2]  ( .D(next_state[2]), .CLK(clock), .RSTB(n49), 
        .Q(pre_state[2]), .QN(n42) );
  DFFARX1_RVT \pre_state_reg[1]  ( .D(next_state[1]), .CLK(clock), .RSTB(n49), 
        .Q(pre_state[1]), .QN(n45) );
  DFFARX1_RVT \count1_reg[1]  ( .D(n64), .CLK(clock), .RSTB(n49), .Q(count1[1]), .QN(n43) );
  DFFARX1_RVT \count1_reg[2]  ( .D(n65), .CLK(clock), .RSTB(n49), .Q(count1[2]), .QN(n46) );
  DFFARX1_RVT \count1_reg[3]  ( .D(n67), .CLK(clock), .RSTB(n49), .Q(count1[3]), .QN(n50) );
  AND3X2_RVT U3 ( .A1(pre_state[0]), .A2(pre_state[2]), .A3(n45), .Y(N109) );
  INVX2_RVT U4 ( .A(reset), .Y(n49) );
  INVX0_RVT U5 ( .A(N109), .Y(n1) );
  INVX0_RVT U6 ( .A(n1), .Y(reset_count) );
  AND3X1_RVT U7 ( .A1(pre_state[2]), .A2(n41), .A3(n45), .Y(N102) );
  AND3X1_RVT U8 ( .A1(pre_state[1]), .A2(pre_state[0]), .A3(n42), .Y(N106) );
  NAND2X0_RVT U9 ( .A1(pre_state[1]), .A2(n41), .Y(n18) );
  NAND3X0_RVT U10 ( .A1(pre_state[0]), .A2(n45), .A3(n42), .Y(n4) );
  NAND2X2_RVT U11 ( .A1(n18), .A2(n4), .Y(show_new_time) );
  INVX0_RVT U12 ( .A(n18), .Y(n22) );
  AND2X1_RVT U13 ( .A1(n22), .A2(n42), .Y(N112) );
  NAND2X0_RVT U14 ( .A1(count2[0]), .A2(one_second), .Y(n38) );
  NAND4X0_RVT U15 ( .A1(count2[0]), .A2(count2[3]), .A3(n44), .A4(n47), .Y(n13) );
  AND3X1_RVT U16 ( .A1(n22), .A2(pre_state[2]), .A3(n13), .Y(n39) );
  AND2X1_RVT U17 ( .A1(n38), .A2(n39), .Y(n3) );
  OR2X1_RVT U18 ( .A1(one_second), .A2(count2[0]), .Y(n2) );
  AND2X1_RVT U19 ( .A1(n3), .A2(n2), .Y(n62) );
  NAND4X0_RVT U20 ( .A1(count1[1]), .A2(count1[2]), .A3(count1[0]), .A4(
        one_second), .Y(n29) );
  INVX0_RVT U21 ( .A(n4), .Y(n28) );
  NAND4X0_RVT U22 ( .A1(count1[0]), .A2(count1[3]), .A3(n43), .A4(n46), .Y(n11) );
  AND2X1_RVT U23 ( .A1(n28), .A2(n11), .Y(n31) );
  AND2X1_RVT U24 ( .A1(n29), .A2(n31), .Y(n7) );
  AND3X1_RVT U25 ( .A1(count1[1]), .A2(count1[0]), .A3(one_second), .Y(n5) );
  OR2X1_RVT U26 ( .A1(n5), .A2(count1[2]), .Y(n6) );
  AND2X1_RVT U27 ( .A1(n7), .A2(n6), .Y(n65) );
  NAND2X0_RVT U28 ( .A1(count1[0]), .A2(one_second), .Y(n32) );
  AND2X1_RVT U29 ( .A1(n32), .A2(n31), .Y(n9) );
  OR2X1_RVT U30 ( .A1(one_second), .A2(count1[0]), .Y(n8) );
  AND2X1_RVT U31 ( .A1(n9), .A2(n8), .Y(n66) );
  NAND2X0_RVT U32 ( .A1(key[3]), .A2(key[1]), .Y(n10) );
  OR3X1_RVT U33 ( .A1(key[0]), .A2(key[2]), .A3(n10), .Y(n19) );
  NAND3X0_RVT U34 ( .A1(n13), .A2(n11), .A3(n19), .Y(n12) );
  AO21X1_RVT U35 ( .A1(pre_state[2]), .A2(n12), .A3(n18), .Y(n26) );
  INVX0_RVT U36 ( .A(alarm_button), .Y(n23) );
  NAND3X0_RVT U37 ( .A1(n31), .A2(n13), .A3(n23), .Y(n17) );
  OAI22X1_RVT U38 ( .A1(time_button), .A2(n17), .A3(pre_state[0]), .A4(
        pre_state[2]), .Y(n14) );
  NAND2X0_RVT U39 ( .A1(n14), .A2(n19), .Y(n16) );
  NAND2X0_RVT U40 ( .A1(pre_state[0]), .A2(n45), .Y(n15) );
  NAND3X0_RVT U41 ( .A1(alarm_button), .A2(n42), .A3(n15), .Y(n21) );
  NAND3X0_RVT U42 ( .A1(n26), .A2(n16), .A3(n21), .Y(next_state[1]) );
  OA21X1_RVT U43 ( .A1(n42), .A2(n18), .A3(n17), .Y(n20) );
  OA22X1_RVT U44 ( .A1(n22), .A2(n21), .A3(n20), .A4(n19), .Y(n25) );
  NAND3X0_RVT U45 ( .A1(n23), .A2(n28), .A3(time_button), .Y(n24) );
  NAND2X0_RVT U46 ( .A1(n25), .A2(n24), .Y(next_state[0]) );
  INVX0_RVT U47 ( .A(n26), .Y(n27) );
  AO221X1_RVT U48 ( .A1(n28), .A2(alarm_button), .A3(n28), .A4(time_button), 
        .A5(n27), .Y(next_state[2]) );
  INVX0_RVT U49 ( .A(n29), .Y(n30) );
  OA221X1_RVT U50 ( .A1(count1[3]), .A2(n30), .A3(n50), .A4(n29), .A5(n31), 
        .Y(n67) );
  INVX0_RVT U51 ( .A(n32), .Y(n33) );
  OA221X1_RVT U52 ( .A1(count1[1]), .A2(n33), .A3(n43), .A4(n32), .A5(n31), 
        .Y(n64) );
  OA21X1_RVT U53 ( .A1(n44), .A2(n38), .A3(n39), .Y(n36) );
  AND3X1_RVT U54 ( .A1(count2[0]), .A2(count2[1]), .A3(n48), .Y(n34) );
  OA221X1_RVT U55 ( .A1(count2[2]), .A2(count2[3]), .A3(n47), .A4(n34), .A5(
        n39), .Y(n35) );
  AO22X1_RVT U56 ( .A1(count2[3]), .A2(n36), .A3(one_second), .A4(n35), .Y(n63) );
  AND3X1_RVT U57 ( .A1(count2[0]), .A2(one_second), .A3(n39), .Y(n37) );
  OA222X1_RVT U58 ( .A1(count2[2]), .A2(count2[1]), .A3(count2[2]), .A4(n37), 
        .A5(n47), .A6(n36), .Y(n61) );
  OA222X1_RVT U59 ( .A1(n44), .A2(n39), .A3(n44), .A4(n38), .A5(n37), .A6(
        count2[1]), .Y(n60) );
  DFFASRX1_RVT \count2_reg[0]  ( .D(n62), .CLK(clock), .RSTB(n49), .SETB(1'b1), 
        .Q(count2[0]) );
  DFFASRX1_RVT \count1_reg[0]  ( .D(n66), .CLK(clock), .RSTB(n49), .SETB(1'b1), 
        .Q(count1[0]) );
endmodule


module alarm_clock_top ( clock, key, reset, time_button, alarm_button, 
        fastwatch, ms_hour, ls_hour, ms_minute, ls_minute, alarm_sound );
  input [3:0] key;
  output [7:0] ms_hour;
  output [7:0] ls_hour;
  output [7:0] ms_minute;
  output [7:0] ls_minute;
  input clock, reset, time_button, alarm_button, fastwatch;
  output alarm_sound;
  wire   one_second, one_minute, reset_count, load_new_c, load_new_a, shift,
         show_a, show_current_time, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148;
  wire   [3:0] key_buffer_ms_min;
  wire   [3:0] key_buffer_ls_min;
  wire   [3:0] key_buffer_ms_hr;
  wire   [3:0] key_buffer_ls_hr;
  wire   [3:0] current_time_ms_min;
  wire   [3:0] current_time_ls_min;
  wire   [3:0] current_time_ms_hr;
  wire   [3:0] current_time_ls_hr;
  wire   [3:0] alarm_time_ms_hr;
  wire   [3:0] alarm_time_ls_hr;
  wire   [3:0] alarm_time_ms_min;
  wire   [3:0] alarm_time_ls_min;

  NOR2X0_RVT U110 ( .A1(show_current_time), .A2(show_a), .Y(n143) );
  AND2X1_RVT U112 ( .A1(show_a), .A2(n91), .Y(n142) );
  AO222X1_RVT U113 ( .A1(show_current_time), .A2(key_buffer_ls_min[3]), .A3(
        n143), .A4(current_time_ls_min[3]), .A5(n142), .A6(
        alarm_time_ls_min[3]), .Y(ls_minute[3]) );
  INVX0_RVT U114 ( .A(ls_minute[3]), .Y(n131) );
  AO222X1_RVT U115 ( .A1(show_current_time), .A2(key_buffer_ls_min[2]), .A3(
        n142), .A4(alarm_time_ls_min[2]), .A5(n143), .A6(
        current_time_ls_min[2]), .Y(n130) );
  INVX0_RVT U116 ( .A(n130), .Y(n129) );
  AOI222X1_RVT U117 ( .A1(show_current_time), .A2(key_buffer_ls_min[1]), .A3(
        n142), .A4(alarm_time_ls_min[1]), .A5(n143), .A6(
        current_time_ls_min[1]), .Y(n128) );
  OAI21X1_RVT U118 ( .A1(n131), .A2(n129), .A3(n128), .Y(ls_minute[1]) );
  AO222X1_RVT U119 ( .A1(show_current_time), .A2(key_buffer_ms_hr[3]), .A3(
        n143), .A4(current_time_ms_hr[3]), .A5(n142), .A6(alarm_time_ms_hr[3]), 
        .Y(ms_hour[3]) );
  INVX0_RVT U120 ( .A(ms_hour[3]), .Y(n148) );
  AO222X1_RVT U121 ( .A1(show_current_time), .A2(key_buffer_ms_hr[2]), .A3(
        n142), .A4(alarm_time_ms_hr[2]), .A5(n143), .A6(current_time_ms_hr[2]), 
        .Y(n147) );
  INVX0_RVT U122 ( .A(n147), .Y(n146) );
  AOI222X1_RVT U123 ( .A1(show_current_time), .A2(key_buffer_ms_hr[1]), .A3(
        n142), .A4(alarm_time_ms_hr[1]), .A5(n143), .A6(current_time_ms_hr[1]), 
        .Y(n145) );
  OAI21X1_RVT U124 ( .A1(n148), .A2(n146), .A3(n145), .Y(ms_hour[1]) );
  AO222X1_RVT U125 ( .A1(show_current_time), .A2(key_buffer_ms_min[3]), .A3(
        n143), .A4(current_time_ms_min[3]), .A5(n142), .A6(
        alarm_time_ms_min[3]), .Y(ms_minute[3]) );
  INVX0_RVT U126 ( .A(ms_minute[3]), .Y(n136) );
  AO222X1_RVT U127 ( .A1(show_current_time), .A2(key_buffer_ms_min[2]), .A3(
        n142), .A4(alarm_time_ms_min[2]), .A5(n143), .A6(
        current_time_ms_min[2]), .Y(n135) );
  INVX0_RVT U128 ( .A(n135), .Y(n134) );
  AOI222X1_RVT U129 ( .A1(show_current_time), .A2(key_buffer_ms_min[1]), .A3(
        n142), .A4(alarm_time_ms_min[1]), .A5(n143), .A6(
        current_time_ms_min[1]), .Y(n133) );
  OAI21X1_RVT U130 ( .A1(n136), .A2(n134), .A3(n133), .Y(ms_minute[1]) );
  AO222X1_RVT U131 ( .A1(show_current_time), .A2(key_buffer_ls_hr[3]), .A3(
        n143), .A4(current_time_ls_hr[3]), .A5(n142), .A6(alarm_time_ls_hr[3]), 
        .Y(ls_hour[3]) );
  INVX0_RVT U132 ( .A(ls_hour[3]), .Y(n141) );
  AO222X1_RVT U133 ( .A1(show_current_time), .A2(key_buffer_ls_hr[2]), .A3(
        n142), .A4(alarm_time_ls_hr[2]), .A5(n143), .A6(current_time_ls_hr[2]), 
        .Y(n140) );
  INVX0_RVT U134 ( .A(n140), .Y(n139) );
  AOI222X1_RVT U135 ( .A1(show_current_time), .A2(key_buffer_ls_hr[1]), .A3(
        n142), .A4(alarm_time_ls_hr[1]), .A5(n143), .A6(current_time_ls_hr[1]), 
        .Y(n138) );
  OAI21X1_RVT U136 ( .A1(n141), .A2(n139), .A3(n138), .Y(ls_hour[1]) );
  INVX0_RVT U137 ( .A(alarm_time_ms_hr[0]), .Y(n94) );
  INVX0_RVT U138 ( .A(alarm_time_ms_hr[1]), .Y(n93) );
  AOI22X1_RVT U139 ( .A1(n94), .A2(current_time_ms_hr[0]), .A3(n93), .A4(
        current_time_ms_hr[1]), .Y(n92) );
  OA221X1_RVT U140 ( .A1(n94), .A2(current_time_ms_hr[0]), .A3(n93), .A4(
        current_time_ms_hr[1]), .A5(n92), .Y(n126) );
  INVX0_RVT U141 ( .A(alarm_time_ls_hr[3]), .Y(n97) );
  INVX0_RVT U142 ( .A(alarm_time_ls_hr[2]), .Y(n96) );
  AOI22X1_RVT U143 ( .A1(n97), .A2(current_time_ls_hr[3]), .A3(n96), .A4(
        current_time_ls_hr[2]), .Y(n95) );
  OA221X1_RVT U144 ( .A1(n97), .A2(current_time_ls_hr[3]), .A3(n96), .A4(
        current_time_ls_hr[2]), .A5(n95), .Y(n125) );
  INVX0_RVT U145 ( .A(current_time_ms_hr[2]), .Y(n106) );
  INVX0_RVT U146 ( .A(alarm_time_ms_hr[2]), .Y(n105) );
  INVX0_RVT U147 ( .A(current_time_ms_hr[3]), .Y(n103) );
  INVX0_RVT U148 ( .A(alarm_time_ms_hr[3]), .Y(n102) );
  INVX0_RVT U149 ( .A(alarm_time_ls_hr[0]), .Y(n100) );
  INVX0_RVT U150 ( .A(alarm_time_ls_hr[1]), .Y(n99) );
  AOI22X1_RVT U151 ( .A1(n100), .A2(current_time_ls_hr[0]), .A3(n99), .A4(
        current_time_ls_hr[1]), .Y(n98) );
  OA221X1_RVT U152 ( .A1(n100), .A2(current_time_ls_hr[0]), .A3(n99), .A4(
        current_time_ls_hr[1]), .A5(n98), .Y(n101) );
  OA221X1_RVT U153 ( .A1(alarm_time_ms_hr[3]), .A2(n103), .A3(n102), .A4(
        current_time_ms_hr[3]), .A5(n101), .Y(n104) );
  OA221X1_RVT U154 ( .A1(alarm_time_ms_hr[2]), .A2(n106), .A3(n105), .A4(
        current_time_ms_hr[2]), .A5(n104), .Y(n124) );
  INVX0_RVT U155 ( .A(alarm_time_ms_min[3]), .Y(n109) );
  INVX0_RVT U156 ( .A(alarm_time_ms_min[2]), .Y(n108) );
  AOI22X1_RVT U157 ( .A1(n109), .A2(current_time_ms_min[3]), .A3(n108), .A4(
        current_time_ms_min[2]), .Y(n107) );
  OA221X1_RVT U158 ( .A1(n109), .A2(current_time_ms_min[3]), .A3(n108), .A4(
        current_time_ms_min[2]), .A5(n107), .Y(n122) );
  INVX0_RVT U159 ( .A(alarm_time_ms_min[0]), .Y(n112) );
  INVX0_RVT U160 ( .A(alarm_time_ms_min[1]), .Y(n111) );
  AOI22X1_RVT U161 ( .A1(n112), .A2(current_time_ms_min[0]), .A3(n111), .A4(
        current_time_ms_min[1]), .Y(n110) );
  OA221X1_RVT U162 ( .A1(n112), .A2(current_time_ms_min[0]), .A3(n111), .A4(
        current_time_ms_min[1]), .A5(n110), .Y(n121) );
  INVX0_RVT U163 ( .A(alarm_time_ls_min[3]), .Y(n115) );
  INVX0_RVT U164 ( .A(alarm_time_ls_min[2]), .Y(n114) );
  AOI22X1_RVT U165 ( .A1(n115), .A2(current_time_ls_min[3]), .A3(n114), .A4(
        current_time_ls_min[2]), .Y(n113) );
  OA221X1_RVT U166 ( .A1(n115), .A2(current_time_ls_min[3]), .A3(n114), .A4(
        current_time_ls_min[2]), .A5(n113), .Y(n120) );
  INVX0_RVT U167 ( .A(alarm_time_ls_min[0]), .Y(n118) );
  INVX0_RVT U168 ( .A(alarm_time_ls_min[1]), .Y(n117) );
  AOI22X1_RVT U169 ( .A1(n118), .A2(current_time_ls_min[0]), .A3(n117), .A4(
        current_time_ls_min[1]), .Y(n116) );
  OA221X1_RVT U170 ( .A1(n118), .A2(current_time_ls_min[0]), .A3(n117), .A4(
        current_time_ls_min[1]), .A5(n116), .Y(n119) );
  AND4X1_RVT U171 ( .A1(n122), .A2(n121), .A3(n120), .A4(n119), .Y(n123) );
  AND4X1_RVT U172 ( .A1(n126), .A2(n125), .A3(n124), .A4(n123), .Y(alarm_sound) );
  AO222X1_RVT U173 ( .A1(show_current_time), .A2(key_buffer_ls_min[0]), .A3(
        alarm_time_ls_min[0]), .A4(n142), .A5(n143), .A6(
        current_time_ls_min[0]), .Y(n127) );
  OA221X1_RVT U174 ( .A1(n131), .A2(n129), .A3(n131), .A4(n128), .A5(n127), 
        .Y(ls_minute[0]) );
  AND2X1_RVT U175 ( .A1(n131), .A2(n130), .Y(ls_minute[2]) );
  AO222X1_RVT U176 ( .A1(show_current_time), .A2(key_buffer_ms_min[0]), .A3(
        n143), .A4(current_time_ms_min[0]), .A5(n142), .A6(
        alarm_time_ms_min[0]), .Y(n132) );
  OA221X1_RVT U177 ( .A1(n136), .A2(n134), .A3(n136), .A4(n133), .A5(n132), 
        .Y(ms_minute[0]) );
  AND2X1_RVT U178 ( .A1(n136), .A2(n135), .Y(ms_minute[2]) );
  AO222X1_RVT U179 ( .A1(show_current_time), .A2(key_buffer_ls_hr[0]), .A3(
        n143), .A4(current_time_ls_hr[0]), .A5(n142), .A6(alarm_time_ls_hr[0]), 
        .Y(n137) );
  OA221X1_RVT U180 ( .A1(n141), .A2(n139), .A3(n141), .A4(n138), .A5(n137), 
        .Y(ls_hour[0]) );
  AND2X1_RVT U181 ( .A1(n141), .A2(n140), .Y(ls_hour[2]) );
  AO222X1_RVT U182 ( .A1(show_current_time), .A2(key_buffer_ms_hr[0]), .A3(
        n143), .A4(current_time_ms_hr[0]), .A5(n142), .A6(alarm_time_ms_hr[0]), 
        .Y(n144) );
  OA221X1_RVT U183 ( .A1(n148), .A2(n146), .A3(n148), .A4(n145), .A5(n144), 
        .Y(ms_hour[0]) );
  AND2X1_RVT U184 ( .A1(n148), .A2(n147), .Y(ms_hour[2]) );
  timegen tgen1 ( .clock(clock), .reset(reset), .reset_count(reset_count), 
        .fastwatch(fastwatch), .one_second(one_second), .one_minute(one_minute) );
  counter count1 ( .clk(clock), .reset(reset), .one_minute(one_minute), 
        .load_new_c(load_new_c), .new_current_time_ms_hr(key_buffer_ms_hr), 
        .new_current_time_ms_min(key_buffer_ms_min), .new_current_time_ls_hr(
        key_buffer_ls_hr), .new_current_time_ls_min(key_buffer_ls_min), 
        .current_time_ms_hr(current_time_ms_hr), .current_time_ms_min(
        current_time_ms_min), .current_time_ls_hr(current_time_ls_hr), 
        .current_time_ls_min(current_time_ls_min) );
  alarm_reg alreg1 ( .new_alarm_ms_hr(key_buffer_ms_hr), .new_alarm_ls_hr(
        key_buffer_ls_hr), .new_alarm_ms_min(key_buffer_ms_min), 
        .new_alarm_ls_min(key_buffer_ls_min), .load_new_alarm(load_new_a), 
        .clock(clock), .reset(reset), .alarm_time_ms_hr(alarm_time_ms_hr), 
        .alarm_time_ls_hr(alarm_time_ls_hr), .alarm_time_ms_min(
        alarm_time_ms_min), .alarm_time_ls_min(alarm_time_ls_min) );
  keyreg keyreg1 ( .reset(reset), .clock(clock), .shift(shift), .key(key), 
        .key_buffer_ls_min(key_buffer_ls_min), .key_buffer_ms_min(
        key_buffer_ms_min), .key_buffer_ls_hr(key_buffer_ls_hr), 
        .key_buffer_ms_hr(key_buffer_ms_hr) );
  fsm fsm1 ( .clock(clock), .reset(reset), .one_second(one_second), 
        .time_button(time_button), .alarm_button(alarm_button), .key(key), 
        .reset_count(reset_count), .load_new_a(load_new_a), .show_a(show_a), 
        .show_new_time(show_current_time), .load_new_c(load_new_c), .shift(
        shift) );
  INVX0_RVT U78 ( .A(show_current_time), .Y(n91) );
  INVX0_RVT U79 ( .A(1'b0), .Y(ls_minute[4]) );
  INVX0_RVT U81 ( .A(1'b0), .Y(ls_minute[5]) );
  INVX0_RVT U83 ( .A(1'b1), .Y(ls_minute[6]) );
  INVX0_RVT U85 ( .A(1'b1), .Y(ls_minute[7]) );
  INVX0_RVT U87 ( .A(1'b0), .Y(ms_minute[4]) );
  INVX0_RVT U89 ( .A(1'b0), .Y(ms_minute[5]) );
  INVX0_RVT U91 ( .A(1'b1), .Y(ms_minute[6]) );
  INVX0_RVT U93 ( .A(1'b1), .Y(ms_minute[7]) );
  INVX0_RVT U95 ( .A(1'b0), .Y(ls_hour[4]) );
  INVX0_RVT U97 ( .A(1'b0), .Y(ls_hour[5]) );
  INVX0_RVT U99 ( .A(1'b1), .Y(ls_hour[6]) );
  INVX0_RVT U101 ( .A(1'b1), .Y(ls_hour[7]) );
  INVX0_RVT U103 ( .A(1'b0), .Y(ms_hour[4]) );
  INVX0_RVT U105 ( .A(1'b0), .Y(ms_hour[5]) );
  INVX0_RVT U107 ( .A(1'b1), .Y(ms_hour[6]) );
  INVX0_RVT U109 ( .A(1'b1), .Y(ms_hour[7]) );
endmodule

