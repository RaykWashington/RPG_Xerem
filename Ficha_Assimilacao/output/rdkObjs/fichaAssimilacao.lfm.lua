require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmAssimilacaoRpg()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("sheetTemplate");
    obj:setDataType("fichaAssimilacaoRPG");
    obj:setTitle("Ficha Assimilação RPG");
    obj:setName("frmAssimilacaoRpg");
    obj.grid["padding-top"] = 8;
    obj.grid["cnt-line-spacing"] = 4;
    obj:setTheme("dark");


		local function lancar_dados(instinto, conhecPrat)
			instinto = "3d6";
			conhecPrat = "2d10";
			local rolagem = Firecast.interpretarRolagem(instinto):concatenar(conhecPrat)
			local mesa = Firecast.getMesaDe(sheet);
			mesa.chat:rolarDados(rolagem, "Teste de dados");
			end;
		



	


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1.grid.role = "col";
    obj.layout1.grid.width = 12;
    obj.layout1.grid["max-width"] = 800;
    obj.layout1.grid["min-height"] = 900;
    obj.layout1.grid["horz-align"] = "center";
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("NOME:");
    obj.label1.grid.role = "col";
    obj.label1.grid.width = 2;
    obj.label1.grid["min-height"] = 60 ;
    obj.label1:setName("label1");
    obj.label1:setHeight(30);
    obj.label1:setHorzTextAlign("trailing");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 10;
    obj.edit1.grid["min-height"] = 60;
    obj.edit1:setName("edit1");
    obj.edit1:setHeight(30);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setText("Geração:");
    obj.label2.grid.role = "col";
    obj.label2.grid.width = 2;
    obj.label2:setName("label2");
    obj.label2:setHeight(30);
    obj.label2:setHorzTextAlign("trailing");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2.grid.role = "col";
    obj.edit2.grid.width = 10;
    obj.edit2:setName("edit2");
    obj.edit2:setHeight(30);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setText("Evento Marcante:");
    obj.label3.grid.role = "col";
    obj.label3.grid.width = 2;
    obj.label3:setName("label3");
    obj.label3:setHeight(30);
    obj.label3:setHorzTextAlign("trailing");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3.grid.role = "col";
    obj.edit3.grid.width = 10;
    obj.edit3:setName("edit3");
    obj.edit3:setHeight(30);

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setText("Posição Social:");
    obj.label4.grid.role = "col";
    obj.label4.grid.width = 2;
    obj.label4:setName("label4");
    obj.label4:setHeight(30);
    obj.label4:setHorzTextAlign("trailing");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4.grid.role = "col";
    obj.edit4.grid.width = 10;
    obj.edit4:setName("edit4");
    obj.edit4:setHeight(30);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2.grid.role = "col";
    obj.layout2.grid.width = 6;
    obj.layout2.grid["min-height"] = 200;
    obj.layout2.grid["margin-top"] = 10;
    obj.layout2:setName("layout2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("PROPOSITOS");
    obj.label5.grid.role = "col";
    obj.label5.grid.width = 12;
    obj.label5:setName("label5");
    obj.label5:setHeight(30);

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setText("Individuais:");
    obj.label6:setHorzTextAlign("leading");
    obj.label6.grid.role = "row";
    obj.label6.grid["min-height"] = 30;
    obj.label6:setName("label6");
    obj.label6:setHeight(30);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5.grid.role = "row";
    obj.edit5.grid["min-height"] = 60;
    obj.edit5:setName("edit5");
    obj.edit5:setHeight(30);

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setText("Relacionais:");
    obj.label7:setHorzTextAlign("leading");
    obj.label7.grid.role = "row";
    obj.label7.grid["min-height"] = 30;
    obj.label7:setName("label7");
    obj.label7:setHeight(30);

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout2);
    obj.edit6.grid.role = "row";
    obj.edit6.grid["min-height"] = 60;
    obj.edit6:setName("edit6");
    obj.edit6:setHeight(30);

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3.grid.role = "col";
    obj.layout3.grid.width = 6;
    obj.layout3.grid["min-height"] = 200;
    obj.layout3.grid["margin-top"] = 10;
    obj.layout3:setName("layout3");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setText("Determinacao");
    obj.label8.grid.role = "col";
    obj.label8.grid.width = 6;
    obj.label8:setName("label8");
    obj.label8:setHeight(30);

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout3);
    obj.edit7.grid.role = "col";
    obj.edit7.grid.width = 6;
    obj.edit7:setName("edit7");
    obj.edit7:setHeight(30);

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4.grid.role = "col";
    obj.layout4.grid.width = 1;
    obj.layout4:setName("layout4");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout3);
    obj.checkBox1:setField("dterm1");
    obj.checkBox1.grid.role = "col";
    obj.checkBox1.grid.width = 1;
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout3);
    obj.checkBox2:setField("dterm2");
    obj.checkBox2.grid.role = "col";
    obj.checkBox2.grid.width = 1;
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout3);
    obj.checkBox3:setField("dterm3");
    obj.checkBox3.grid.role = "col";
    obj.checkBox3.grid.width = 1;
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout3);
    obj.checkBox4:setField("dterm4");
    obj.checkBox4.grid.role = "col";
    obj.checkBox4.grid.width = 1;
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout3);
    obj.checkBox5:setField("dterm5");
    obj.checkBox5.grid.role = "col";
    obj.checkBox5.grid.width = 1;
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout3);
    obj.checkBox6:setField("dterm6");
    obj.checkBox6.grid.role = "col";
    obj.checkBox6.grid.width = 1;
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout3);
    obj.checkBox7:setField("dterm7");
    obj.checkBox7.grid.role = "col";
    obj.checkBox7.grid.width = 1;
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout3);
    obj.checkBox8:setField("dterm8");
    obj.checkBox8.grid.role = "col";
    obj.checkBox8.grid.width = 1;
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout3);
    obj.checkBox9:setField("dterm9");
    obj.checkBox9.grid.role = "col";
    obj.checkBox9.grid.width = 1;
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout3);
    obj.checkBox10:setField("dterm10");
    obj.checkBox10.grid.role = "col";
    obj.checkBox10.grid.width = 1;
    obj.checkBox10:setName("checkBox10");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout3);
    obj.layout5.grid.role = "col";
    obj.layout5.grid.width = 1;
    obj.layout5:setName("layout5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout3);
    obj.layout6.grid.role = "col";
    obj.layout6.grid.width = 1;
    obj.layout6:setName("layout6");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout3);
    obj.checkBox11:setField("assim1");
    obj.checkBox11.grid.role = "col";
    obj.checkBox11.grid.width = 1;
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout3);
    obj.checkBox12:setField("assim2");
    obj.checkBox12.grid.role = "col";
    obj.checkBox12.grid.width = 1;
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout3);
    obj.checkBox13:setField("assim3");
    obj.checkBox13.grid.role = "col";
    obj.checkBox13.grid.width = 1;
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout3);
    obj.checkBox14:setField("assim4");
    obj.checkBox14.grid.role = "col";
    obj.checkBox14.grid.width = 1;
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout3);
    obj.checkBox15:setField("assim5");
    obj.checkBox15.grid.role = "col";
    obj.checkBox15.grid.width = 1;
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout3);
    obj.checkBox16:setField("assim6");
    obj.checkBox16.grid.role = "col";
    obj.checkBox16.grid.width = 1;
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout3);
    obj.checkBox17:setField("assim7");
    obj.checkBox17.grid.role = "col";
    obj.checkBox17.grid.width = 1;
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout3);
    obj.checkBox18:setField("assim8");
    obj.checkBox18.grid.role = "col";
    obj.checkBox18.grid.width = 1;
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout3);
    obj.checkBox19:setField("assim9");
    obj.checkBox19.grid.role = "col";
    obj.checkBox19.grid.width = 1;
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout3);
    obj.checkBox20:setField("assim10");
    obj.checkBox20.grid.role = "col";
    obj.checkBox20.grid.width = 1;
    obj.checkBox20:setName("checkBox20");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout3);
    obj.layout7.grid.role = "col";
    obj.layout7.grid.width = 1;
    obj.layout7:setName("layout7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout3);
    obj.edit8.grid.role = "col";
    obj.edit8.grid.width = 6;
    obj.edit8:setName("edit8");
    obj.edit8:setHeight(30);

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setHorzTextAlign("leading");
    obj.label9:setText("Assimilação");
    obj.label9.grid.role = "col";
    obj.label9.grid.width = 6;
    obj.label9:setName("label9");
    obj.label9:setHeight(30);

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8.grid.role = "col";
    obj.layout8.grid.width = 6;
    obj.layout8.grid["min-height"] = 600;
    obj.layout8.grid["max-width"] = 400;
    obj.layout8:setName("layout8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout8);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("INSTINTOS");
    obj.label10.grid.role = "col";
    obj.label10.grid.width = 12;
    obj.label10:setName("label10");
    obj.label10:setHeight(30);

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout8);
    obj.edit9.grid.role = "col";
    obj.edit9.grid.width = 4;
    obj.edit9:setField("reac");
    obj.edit9:setName("edit9");
    obj.edit9:setHeight(30);

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout8);
    obj.edit10.grid.role = "col";
    obj.edit10.grid.width = 4;
    obj.edit10:setField("perc");
    obj.edit10:setName("edit10");
    obj.edit10:setHeight(30);

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout8);
    obj.edit11.grid.role = "col";
    obj.edit11.grid.width = 4;
    obj.edit11:setField("sag");
    obj.edit11:setName("edit11");
    obj.edit11:setHeight(30);

    obj.radioButton1 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.layout8);
    obj.radioButton1.grid.role = "col";
    obj.radioButton1.grid.width = 4;
    obj.radioButton1:setText("Reação");
    obj.radioButton1:setGroupName("Instintos");
    obj.radioButton1:setField("inst");
    obj.radioButton1:setFieldValue("Reac");
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.layout8);
    obj.radioButton2.grid.role = "col";
    obj.radioButton2.grid.width = 4;
    obj.radioButton2:setText("Percepção");
    obj.radioButton2:setGroupName("Instintos");
    obj.radioButton2:setField("inst");
    obj.radioButton2:setFieldValue("Perc");
    obj.radioButton2:setName("radioButton2");

    obj.radioButton3 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.layout8);
    obj.radioButton3.grid.role = "col";
    obj.radioButton3.grid.width = 4;
    obj.radioButton3:setText("Sagacidade");
    obj.radioButton3:setGroupName("Instintos");
    obj.radioButton3:setField("inst");
    obj.radioButton3:setFieldValue("Sag");
    obj.radioButton3:setName("radioButton3");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout8);
    obj.edit12.grid.role = "col";
    obj.edit12.grid.width = 4;
    obj.edit12:setField("pot");
    obj.edit12:setName("edit12");
    obj.edit12:setHeight(30);

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout8);
    obj.edit13.grid.role = "col";
    obj.edit13.grid.width = 4;
    obj.edit13:setField("infl");
    obj.edit13:setName("edit13");
    obj.edit13:setHeight(30);

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout8);
    obj.edit14.grid.role = "col";
    obj.edit14.grid.width = 4;
    obj.edit14:setField("reso");
    obj.edit14:setName("edit14");
    obj.edit14:setHeight(30);

    obj.radioButton4 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.layout8);
    obj.radioButton4.grid.role = "col";
    obj.radioButton4.grid.width = 4;
    obj.radioButton4:setText("Potência");
    obj.radioButton4:setGroupName("Instintos");
    obj.radioButton4:setField("inst");
    obj.radioButton4:setFieldValue("Pot");
    obj.radioButton4:setName("radioButton4");

    obj.radioButton5 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton5:setParent(obj.layout8);
    obj.radioButton5.grid.role = "col";
    obj.radioButton5.grid.width = 4;
    obj.radioButton5:setText("Influencia");
    obj.radioButton5:setGroupName("Instintos");
    obj.radioButton5:setField("inst");
    obj.radioButton5:setFieldValue("Infl");
    obj.radioButton5:setName("radioButton5");

    obj.radioButton6 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton6:setParent(obj.layout8);
    obj.radioButton6.grid.role = "col";
    obj.radioButton6.grid.width = 4;
    obj.radioButton6:setText("Resolução");
    obj.radioButton6:setGroupName("Instintos");
    obj.radioButton6:setField("inst");
    obj.radioButton6:setFieldValue("Reso");
    obj.radioButton6:setName("radioButton6");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout8);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setText("CONHECIMENTOS");
    obj.label11.grid.role = "col";
    obj.label11.grid.width = 12;
    obj.label11:setName("label11");
    obj.label11:setHeight(30);

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout8);
    obj.edit15.grid.role = "col";
    obj.edit15.grid.width = 4;
    obj.edit15:setField("agra");
    obj.edit15:setName("edit15");
    obj.edit15:setHeight(30);

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout8);
    obj.edit16.grid.role = "col";
    obj.edit16.grid.width = 4;
    obj.edit16:setField("biol");
    obj.edit16:setName("edit16");
    obj.edit16:setHeight(30);

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout8);
    obj.edit17.grid.role = "col";
    obj.edit17.grid.width = 4;
    obj.edit17:setField("exat");
    obj.edit17:setName("edit17");
    obj.edit17:setHeight(30);

    obj.radioButton7 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton7:setParent(obj.layout8);
    obj.radioButton7.grid.role = "col";
    obj.radioButton7.grid.width = 4;
    obj.radioButton7:setText("Agrário");
    obj.radioButton7:setGroupName("conhecPrat");
    obj.radioButton7:setField("conhec");
    obj.radioButton7:setFieldValue("Agra");
    obj.radioButton7:setName("radioButton7");

    obj.radioButton8 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton8:setParent(obj.layout8);
    obj.radioButton8.grid.role = "col";
    obj.radioButton8.grid.width = 4;
    obj.radioButton8:setText("Biológico");
    obj.radioButton8:setGroupName("conhecPrat");
    obj.radioButton8:setField("conhec");
    obj.radioButton8:setFieldValue("Biol");
    obj.radioButton8:setName("radioButton8");

    obj.radioButton9 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton9:setParent(obj.layout8);
    obj.radioButton9.grid.role = "col";
    obj.radioButton9.grid.width = 4;
    obj.radioButton9:setText("Exatos");
    obj.radioButton9:setGroupName("conhecPrat");
    obj.radioButton9:setField("conhec");
    obj.radioButton9:setFieldValue("Exat");
    obj.radioButton9:setName("radioButton9");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout8);
    obj.edit18.grid.role = "col";
    obj.edit18.grid.width = 4;
    obj.edit18:setField("med");
    obj.edit18:setName("edit18");
    obj.edit18:setHeight(30);

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout8);
    obj.edit19.grid.role = "col";
    obj.edit19.grid.width = 4;
    obj.edit19:setField("soc");
    obj.edit19:setName("edit19");
    obj.edit19:setHeight(30);

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout8);
    obj.edit20.grid.role = "col";
    obj.edit20.grid.width = 4;
    obj.edit20:setField("art");
    obj.edit20:setName("edit20");
    obj.edit20:setHeight(30);

    obj.radioButton10 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton10:setParent(obj.layout8);
    obj.radioButton10.grid.role = "col";
    obj.radioButton10.grid.width = 4;
    obj.radioButton10:setText("Medicina");
    obj.radioButton10:setGroupName("conhecPrat");
    obj.radioButton10:setField("conhec");
    obj.radioButton10:setFieldValue("Med");
    obj.radioButton10:setName("radioButton10");

    obj.radioButton11 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton11:setParent(obj.layout8);
    obj.radioButton11.grid.role = "col";
    obj.radioButton11.grid.width = 4;
    obj.radioButton11:setText("Social");
    obj.radioButton11:setGroupName("conhecPrat");
    obj.radioButton11:setField("conhec");
    obj.radioButton11:setFieldValue("Soc");
    obj.radioButton11:setName("radioButton11");

    obj.radioButton12 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton12:setParent(obj.layout8);
    obj.radioButton12.grid.role = "col";
    obj.radioButton12.grid.width = 4;
    obj.radioButton12:setText("Artistico");
    obj.radioButton12:setGroupName("conhecPrat");
    obj.radioButton12:setField("conhec");
    obj.radioButton12:setFieldValue("Art");
    obj.radioButton12:setName("radioButton12");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout8);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("PRÁTICAS");
    obj.label12.grid.role = "col";
    obj.label12.grid.width = 12;
    obj.label12:setName("label12");
    obj.label12:setHeight(30);

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout8);
    obj.edit21.grid.role = "col";
    obj.edit21.grid.width = 4;
    obj.edit21:setField("esp");
    obj.edit21:setName("edit21");
    obj.edit21:setHeight(30);

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout8);
    obj.edit22.grid.role = "col";
    obj.edit22.grid.width = 4;
    obj.edit22:setField("ferr");
    obj.edit22:setName("edit22");
    obj.edit22:setHeight(30);

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout8);
    obj.edit23.grid.role = "col";
    obj.edit23.grid.width = 4;
    obj.edit23:setField("ofic");
    obj.edit23:setName("edit23");
    obj.edit23:setHeight(30);

    obj.radioButton13 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton13:setParent(obj.layout8);
    obj.radioButton13.grid.role = "col";
    obj.radioButton13.grid.width = 4;
    obj.radioButton13:setText("Esportivas");
    obj.radioButton13:setGroupName("conhecPrat");
    obj.radioButton13:setField("prat");
    obj.radioButton13:setFieldValue("Esp");
    obj.radioButton13:setName("radioButton13");

    obj.radioButton14 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton14:setParent(obj.layout8);
    obj.radioButton14.grid.role = "col";
    obj.radioButton14.grid.width = 4;
    obj.radioButton14:setText("Ferramentas");
    obj.radioButton14:setGroupName("conhecPrat");
    obj.radioButton14:setField("prat");
    obj.radioButton14:setFieldValue("Ferr");
    obj.radioButton14:setName("radioButton14");

    obj.radioButton15 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton15:setParent(obj.layout8);
    obj.radioButton15.grid.role = "col";
    obj.radioButton15.grid.width = 4;
    obj.radioButton15:setText("Oficios");
    obj.radioButton15:setGroupName("conhecPrat");
    obj.radioButton15:setField("prat");
    obj.radioButton15:setFieldValue("Ofic");
    obj.radioButton15:setName("radioButton15");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout8);
    obj.edit24.grid.role = "col";
    obj.edit24.grid.width = 4;
    obj.edit24:setField("arm");
    obj.edit24:setName("edit24");
    obj.edit24:setHeight(30);

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout8);
    obj.edit25.grid.role = "col";
    obj.edit25.grid.width = 4;
    obj.edit25:setField("veic");
    obj.edit25:setName("edit25");
    obj.edit25:setHeight(30);

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout8);
    obj.edit26.grid.role = "col";
    obj.edit26.grid.width = 4;
    obj.edit26:setField("inf");
    obj.edit26:setName("edit26");
    obj.edit26:setHeight(30);

    obj.radioButton16 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton16:setParent(obj.layout8);
    obj.radioButton16.grid.role = "col";
    obj.radioButton16.grid.width = 4;
    obj.radioButton16:setText("Armas");
    obj.radioButton16:setGroupName("conhecPrat");
    obj.radioButton16:setField("prat");
    obj.radioButton16:setFieldValue("Arm");
    obj.radioButton16:setName("radioButton16");

    obj.radioButton17 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton17:setParent(obj.layout8);
    obj.radioButton17.grid.role = "col";
    obj.radioButton17.grid.width = 4;
    obj.radioButton17:setText("Veículos");
    obj.radioButton17:setGroupName("conhecPrat");
    obj.radioButton17:setField("prat");
    obj.radioButton17:setFieldValue("Veic");
    obj.radioButton17:setName("radioButton17");

    obj.tunico = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.tunico:setParent(obj.layout8);
    obj.tunico:setName("tunico");
    obj.tunico.grid.role = "col";
    obj.tunico.grid.width = 4;
    obj.tunico:setText("Infiltração");
    obj.tunico:setGroupName("conhecPrat");
    obj.tunico:setField("prat");
    obj.tunico:setFieldValue("inf");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout8);
    obj.label13.grid.role = "row";
    obj.label13.grid["min-height"] = 30;
    obj.label13:setHorzTextAlign("center");
    obj.label13:setText("jogada: ");
    obj.label13:setName("label13");
    obj.label13:setHeight(30);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout8);
    obj.button1.grid.role = "row";
    obj.button1.grid["min-height"] = 60;
    obj.button1:setText("rolar");
    obj.button1:setName("button1");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9.grid.role = "col";
    obj.layout9.grid.width = 6;
    obj.layout9.grid["min-height"] = 500;
    obj.layout9:setName("layout9");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout9);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setText("SAÚDE");
    obj.label14.grid.role = "col";
    obj.label14.grid.width = 12;
    obj.label14:setName("label14");
    obj.label14:setHeight(30);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout9);
    obj.label15:setText("5 - Infectado Saudavel");
    obj.label15.grid.role = "col";
    obj.label15.grid.width = 6;
    obj.label15:setName("label15");
    obj.label15:setHeight(30);
    obj.label15:setHorzTextAlign("trailing");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout9);
    obj.label16:setText("4 - Infectado Saudavel");
    obj.label16.grid.role = "col";
    obj.label16.grid.width = 6;
    obj.label16:setName("label16");
    obj.label16:setHeight(30);
    obj.label16:setHorzTextAlign("trailing");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout9);
    obj.edit27.grid.role = "col";
    obj.edit27.grid.width = 6;
    obj.edit27:setName("edit27");
    obj.edit27:setHeight(30);

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout9);
    obj.edit28.grid.role = "col";
    obj.edit28.grid.width = 6;
    obj.edit28:setName("edit28");
    obj.edit28:setHeight(30);

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout9);
    obj.label17:setText("3 - Infectado -1 sucesso ou adaptacao");
    obj.label17.grid.role = "col";
    obj.label17.grid.width = 6;
    obj.label17:setName("label17");
    obj.label17:setHeight(30);
    obj.label17:setHorzTextAlign("trailing");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout9);
    obj.label18:setText("2 - Infectado -1 sucesso");
    obj.label18.grid.role = "col";
    obj.label18.grid.width = 6;
    obj.label18:setName("label18");
    obj.label18:setHeight(30);
    obj.label18:setHorzTextAlign("trailing");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout9);
    obj.edit29.grid.role = "col";
    obj.edit29.grid.width = 6;
    obj.edit29:setName("edit29");
    obj.edit29:setHeight(30);

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout9);
    obj.edit30.grid.role = "col";
    obj.edit30.grid.width = 6;
    obj.edit30:setName("edit30");
    obj.edit30:setHeight(30);

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout9);
    obj.label19:setText("1 - Infectado -2 sucessos");
    obj.label19.grid.role = "col";
    obj.label19.grid.width = 6;
    obj.label19:setName("label19");
    obj.label19:setHeight(30);
    obj.label19:setHorzTextAlign("trailing");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout9);
    obj.label20:setText("o - Infectado Morto");
    obj.label20.grid.role = "col";
    obj.label20.grid.width = 6;
    obj.label20:setName("label20");
    obj.label20:setHeight(30);
    obj.label20:setHorzTextAlign("trailing");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout9);
    obj.edit31.grid.role = "col";
    obj.edit31.grid.width = 6;
    obj.edit31:setName("edit31");
    obj.edit31:setHeight(30);

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout9);
    obj.edit32.grid.role = "col";
    obj.edit32.grid.width = 6;
    obj.edit32:setName("edit32");
    obj.edit32:setHeight(30);

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout9);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setText("CARACTERÍSTICAS E EQUIPAMENTOS");
    obj.label21.grid.role = "col";
    obj.label21.grid.width = 12;
    obj.label21:setName("label21");
    obj.label21:setHeight(30);

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout9);
    obj.edit33.grid.role = "col";
    obj.edit33.grid.width = 12;
    obj.edit33:setField("equip");
    obj.edit33.grid["min-height"] = 300;
    obj.edit33:setName("edit33");
    obj.edit33:setHeight(30);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            lancar_dados("teste", "caceta");
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.radioButton10 ~= nil then self.radioButton10:destroy(); self.radioButton10 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.radioButton8 ~= nil then self.radioButton8:destroy(); self.radioButton8 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.tunico ~= nil then self.tunico:destroy(); self.tunico = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.radioButton6 ~= nil then self.radioButton6:destroy(); self.radioButton6 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.radioButton12 ~= nil then self.radioButton12:destroy(); self.radioButton12 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.radioButton15 ~= nil then self.radioButton15:destroy(); self.radioButton15 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.radioButton17 ~= nil then self.radioButton17:destroy(); self.radioButton17 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.radioButton9 ~= nil then self.radioButton9:destroy(); self.radioButton9 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.radioButton7 ~= nil then self.radioButton7:destroy(); self.radioButton7 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.radioButton11 ~= nil then self.radioButton11:destroy(); self.radioButton11 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.radioButton14 ~= nil then self.radioButton14:destroy(); self.radioButton14 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.radioButton13 ~= nil then self.radioButton13:destroy(); self.radioButton13 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.radioButton16 ~= nil then self.radioButton16:destroy(); self.radioButton16 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmAssimilacaoRpg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmAssimilacaoRpg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmAssimilacaoRpg = {
    newEditor = newfrmAssimilacaoRpg, 
    new = newfrmAssimilacaoRpg, 
    name = "frmAssimilacaoRpg", 
    dataType = "fichaAssimilacaoRPG", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Ficha Assimilação RPG", 
    description=""};

frmAssimilacaoRpg = _frmAssimilacaoRpg;
Firecast.registrarForm(_frmAssimilacaoRpg);
Firecast.registrarDataType(_frmAssimilacaoRpg);

return _frmAssimilacaoRpg;
