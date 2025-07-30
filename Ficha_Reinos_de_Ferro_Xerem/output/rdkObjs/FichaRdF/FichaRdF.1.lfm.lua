require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmRDF1()
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
    obj:setName("frmRDF1");
    obj:setAlign("client");
    obj:setTheme("dark");


    



  
        Humano = {
            ["fis"] = {"5","7"};
            ["vel"] = {"6","7"};
            ["for"] = {"4",'6'};
            ["agi"] = {"3",'5'};
            ["des"] = {"4",'5'};
            ["mae"] = {"4",'5'};
            ["int"] = {"3",'5'};
            ["arc"] = {"-",'4'};
            ["per"] = {"3",'5'}
        }
        Anao = {
            ["fis"] = {"6",'7'};
            ["vel"] = {"4",'5'};
            ["for"] = {"5",'6'};
            ["agi"] = {"3",'5'};
            ["des"] = {"4",'4'};
            ["mae"] = {"3",'5'};
            ["int"] = {"4",'5'};
            ["arc"] = {"-",'4'};
            ["per"] = {"3",'4'}
        }
        Gobber = {
            ["fis"] = {"4",'6'};
            ["vel"] = {"6",'7'};
            ["for"] = {"3",'4'};
            ["agi"] = {"4",'5'};
            ["des"] = {"4",'5'};
            ["mae"] = {"3",'5'};
            ["int"] = {"3",'4'};
            ["arc"] = {"-",'-'};
            ["per"] = {"3",'4'}
        }
        Iosano = {
            ["fis"] = {"5",'7'};
            ["vel"] = {"6",'7'};
            ["for"] = {"4",'5'};
            ["agi"] = {"3",'5'};
            ["des"] = {"4",'5'};
            ["mae"] = {"4",'5'};
            ["int"] = {"4",'6'};
            ["arc"] = {"-",'4'};
            ["per"] = {"3",'5'}
        }
        Nyss = {
            ["fis"] = {"5",'7'};
            ["vel"] = {"6",'7'};
            ["for"] = {"4",'6'};
            ["agi"] = {"4",'5'};
            ["des"] = {"4",'5'};
            ["mae"] = {"4",'5'};
            ["int"] = {"3",'5'};
            ["arc"] = {"-",'4'};
            ["per"] = {"3",'5'}
        }
        Ogrun = {
            ["fis"] = {"6",'7'};
            ["vel"] = {"5",'6'};
            ["for"] = {"6",'8'};
            ["agi"] = {"3",'5'};
            ["des"] = {"4",'4'};
            ["mae"] = {"3",'5'};
            ["int"] = {"3",'5'};
            ["arc"] = {"-",'-'};
            ["per"] = {"2",'4'}
        }
        Trollkin = {
            ["fis"] = {"6",'8'};
            ["vel"] = {"5",'6'};
            ["for"] = {"5",'7'};
            ["agi"] = {"3",'5'};
            ["des"] = {"4",'4'};
            ["mae"] = {"2",'5'};
            ["int"] = {"3",'4'};
            ["arc"] = {"-",'4'};
            ["per"] = {"3",'4'}
        }
    
        listaRacas = {
            ["Humano"] = Humano,
            ["Anâo"] = Anao,
            ["Gobber"] = Gobber,
            ["Iosano"] = Iosano,
            ["Nyss"] = Nyss,
            ["Ogrun"] = Ogrun,
            ["Trollkin"] = Trollkin
        }
    






    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");


			




			


	
		


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(960);
    obj.layout1:setHeight(70);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setLeft(5);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(950);
    obj.rectangle1:setHeight(70);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(310);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(20);
    obj.label1:setText("Nome");
    obj.label1:setHorzTextAlign("trailing");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(110);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setField("desc_nome");
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(320);
    obj.layout3:setTop(5);
    obj.layout3:setWidth(310);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(100);
    obj.label2:setHeight(20);
    obj.label2:setText("Aquétipo");
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setName("label2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout3);
    obj.comboBox1:setLeft(110);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(200);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("desc_arquetipo");
    obj.comboBox1:setItems({'Perito','Imbuido','Forte','Intelectual'});
    obj.comboBox1:setName("comboBox1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(585);
    obj.layout4:setTop(5);
    obj.layout4:setWidth(310);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setLeft(0);
    obj.label3:setTop(5);
    obj.label3:setWidth(100);
    obj.label3:setHeight(20);
    obj.label3:setText("Religião");
    obj.label3:setHorzTextAlign("trailing");
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setLeft(110);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(200);
    obj.edit2:setHeight(25);
    obj.edit2:setField("desc_religiao");
    obj.edit2:setName("edit2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(35);
    obj.layout5:setWidth(310);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(100);
    obj.label4:setHeight(20);
    obj.label4:setText("Raça");
    obj.label4:setHorzTextAlign("trailing");
    obj.label4:setName("label4");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout5);
    obj.comboBox2:setLeft(110);
    obj.comboBox2:setTop(0);
    obj.comboBox2:setWidth(200);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("desc_raca");
    obj.comboBox2:setItems({'Humano', 'Anao', 'Gobber', 'Iosano', 'Nyss', 'Ogrun', 'Trollkin'});
    obj.comboBox2:setName("comboBox2");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(320);
    obj.layout6:setTop(35);
    obj.layout6:setWidth(310);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setLeft(0);
    obj.label5:setTop(5);
    obj.label5:setWidth(100);
    obj.label5:setHeight(20);
    obj.label5:setText("Carreiras");
    obj.label5:setHorzTextAlign("trailing");
    obj.label5:setName("label5");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout6);
    obj.edit3:setLeft(110);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(200);
    obj.edit3:setHeight(25);
    obj.edit3:setField("desc_carreiras");
    obj.edit3:setName("edit3");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(585);
    obj.layout7:setTop(35);
    obj.layout7:setWidth(310);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(100);
    obj.label6:setHeight(20);
    obj.label6:setText("Nível");
    obj.label6:setHorzTextAlign("trailing");
    obj.label6:setName("label6");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout7);
    obj.edit4:setLeft(110);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("nivel");
    obj.edit4:setName("edit4");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout7);
    obj.label7:setLeft(160);
    obj.label7:setTop(5);
    obj.label7:setWidth(40);
    obj.label7:setHeight(20);
    obj.label7:setText("XP");
    obj.label7:setHorzTextAlign("trailing");
    obj.label7:setName("label7");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setLeft(210);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(25);
    obj.edit5:setField("xp");
    obj.edit5:setName("edit5");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setFields({'desc_raca', 'desc_arquetipo', 'listaRacas'});
    obj.dataLink1:setName("dataLink1");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(80);
    obj.layout8:setWidth(250);
    obj.layout8:setHeight(400);
    obj.layout8:setName("layout8");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout8);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout8);
    obj.label8:setLeft(0);
    obj.label8:setTop(0);
    obj.label8:setWidth(250);
    obj.label8:setHeight(20);
    obj.label8:setText("ATRIBUTOS");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setLeft(15);
    obj.layout9:setTop(50);
    obj.layout9:setWidth(240);
    obj.layout9:setHeight(50);
    obj.layout9:setName("layout9");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout9);
    obj.button1:setLeft(0);
    obj.button1:setTop(5);
    obj.button1:setWidth(50);
    obj.button1:setHeight(20);
    obj.button1:setText("FIS");
    obj.button1:setHorzTextAlign("center");
    obj.button1:setName("button1");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout9);
    obj.edit6:setLeft(0);
    obj.edit6:setTop(25);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("atr_fis");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout9);
    obj.label9:setLeft(50);
    obj.label9:setTop(5);
    obj.label9:setWidth(50);
    obj.label9:setHeight(20);
    obj.label9:setText("Max.");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setLeft(50);
    obj.edit7:setTop(25);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("atr_max_fis");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setLeft(130);
    obj.layout10:setTop(25);
    obj.layout10:setWidth(240);
    obj.layout10:setHeight(50);
    obj.layout10:setName("layout10");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout10);
    obj.button2:setLeft(0);
    obj.button2:setTop(5);
    obj.button2:setWidth(50);
    obj.button2:setHeight(20);
    obj.button2:setText("VEL");
    obj.button2:setHorzTextAlign("center");
    obj.button2:setName("button2");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setLeft(0);
    obj.edit8:setTop(25);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("atr_vel");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout10);
    obj.label10:setLeft(50);
    obj.label10:setTop(5);
    obj.label10:setWidth(50);
    obj.label10:setHeight(20);
    obj.label10:setText("Max.");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout10);
    obj.edit9:setLeft(50);
    obj.edit9:setTop(25);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("atr_max_vel");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout8);
    obj.layout11:setLeft(130);
    obj.layout11:setTop(75);
    obj.layout11:setWidth(290);
    obj.layout11:setHeight(50);
    obj.layout11:setName("layout11");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout11);
    obj.button3:setLeft(0);
    obj.button3:setTop(5);
    obj.button3:setWidth(50);
    obj.button3:setHeight(20);
    obj.button3:setText("FOR");
    obj.button3:setHorzTextAlign("center");
    obj.button3:setName("button3");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout11);
    obj.edit10:setLeft(0);
    obj.edit10:setTop(25);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("atr_for");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout11);
    obj.label11:setLeft(50);
    obj.label11:setTop(5);
    obj.label11:setWidth(50);
    obj.label11:setHeight(20);
    obj.label11:setText("Max.");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout11);
    obj.edit11:setLeft(50);
    obj.edit11:setTop(25);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("atr_max_for");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout8);
    obj.horzLine1:setLeft(0);
    obj.horzLine1:setTop(130);
    obj.horzLine1:setWidth(300);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout8);
    obj.layout12:setLeft(15);
    obj.layout12:setTop(155);
    obj.layout12:setWidth(240);
    obj.layout12:setHeight(50);
    obj.layout12:setName("layout12");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout12);
    obj.button4:setLeft(0);
    obj.button4:setTop(5);
    obj.button4:setWidth(50);
    obj.button4:setHeight(20);
    obj.button4:setText("AGI");
    obj.button4:setHorzTextAlign("center");
    obj.button4:setName("button4");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setLeft(0);
    obj.edit12:setTop(25);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("atr_agi");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout12);
    obj.label12:setLeft(50);
    obj.label12:setTop(5);
    obj.label12:setWidth(50);
    obj.label12:setHeight(20);
    obj.label12:setText("Max.");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout12);
    obj.edit13:setLeft(50);
    obj.edit13:setTop(25);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setField("atr_max_agi");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout8);
    obj.layout13:setLeft(130);
    obj.layout13:setTop(130);
    obj.layout13:setWidth(240);
    obj.layout13:setHeight(50);
    obj.layout13:setName("layout13");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout13);
    obj.button5:setLeft(0);
    obj.button5:setTop(5);
    obj.button5:setWidth(50);
    obj.button5:setHeight(20);
    obj.button5:setText("DES");
    obj.button5:setHorzTextAlign("center");
    obj.button5:setName("button5");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout13);
    obj.edit14:setLeft(0);
    obj.edit14:setTop(25);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("atr_des");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout13);
    obj.label13:setLeft(50);
    obj.label13:setTop(5);
    obj.label13:setWidth(50);
    obj.label13:setHeight(20);
    obj.label13:setText("Max.");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout13);
    obj.edit15:setLeft(50);
    obj.edit15:setTop(25);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("atr_max_des");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout8);
    obj.layout14:setLeft(130);
    obj.layout14:setTop(180);
    obj.layout14:setWidth(290);
    obj.layout14:setHeight(50);
    obj.layout14:setName("layout14");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout14);
    obj.button6:setLeft(0);
    obj.button6:setTop(5);
    obj.button6:setWidth(50);
    obj.button6:setHeight(20);
    obj.button6:setText("MAE");
    obj.button6:setHorzTextAlign("center");
    obj.button6:setName("button6");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout14);
    obj.edit16:setLeft(0);
    obj.edit16:setTop(25);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("atr_mae");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout14);
    obj.label14:setLeft(50);
    obj.label14:setTop(5);
    obj.label14:setWidth(50);
    obj.label14:setHeight(20);
    obj.label14:setText("Max.");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout14);
    obj.edit17:setLeft(50);
    obj.edit17:setTop(25);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("atr_max_mae");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout8);
    obj.horzLine2:setLeft(0);
    obj.horzLine2:setTop(235);
    obj.horzLine2:setWidth(300);
    obj.horzLine2:setStrokeColor("white");
    obj.horzLine2:setName("horzLine2");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout8);
    obj.layout15:setLeft(15);
    obj.layout15:setTop(260);
    obj.layout15:setWidth(240);
    obj.layout15:setHeight(50);
    obj.layout15:setName("layout15");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout15);
    obj.button7:setLeft(0);
    obj.button7:setTop(5);
    obj.button7:setWidth(50);
    obj.button7:setHeight(20);
    obj.button7:setText("INT");
    obj.button7:setHorzTextAlign("center");
    obj.button7:setName("button7");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout15);
    obj.edit18:setLeft(0);
    obj.edit18:setTop(25);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(25);
    obj.edit18:setField("atr_int");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout15);
    obj.label15:setLeft(50);
    obj.label15:setTop(5);
    obj.label15:setWidth(50);
    obj.label15:setHeight(20);
    obj.label15:setText("Max.");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout15);
    obj.edit19:setLeft(50);
    obj.edit19:setTop(25);
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(25);
    obj.edit19:setField("atr_max_int");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout8);
    obj.layout16:setLeft(130);
    obj.layout16:setTop(235);
    obj.layout16:setWidth(240);
    obj.layout16:setHeight(50);
    obj.layout16:setName("layout16");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout16);
    obj.button8:setLeft(0);
    obj.button8:setTop(5);
    obj.button8:setWidth(50);
    obj.button8:setHeight(20);
    obj.button8:setText("ARC");
    obj.button8:setHorzTextAlign("center");
    obj.button8:setName("button8");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout16);
    obj.edit20:setLeft(0);
    obj.edit20:setTop(25);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(25);
    obj.edit20:setField("atr_arc");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout16);
    obj.label16:setLeft(50);
    obj.label16:setTop(5);
    obj.label16:setWidth(50);
    obj.label16:setHeight(20);
    obj.label16:setText("Max.");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout16);
    obj.edit21:setLeft(50);
    obj.edit21:setTop(25);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(25);
    obj.edit21:setField("atr_max_arc");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout8);
    obj.layout17:setLeft(130);
    obj.layout17:setTop(285);
    obj.layout17:setWidth(290);
    obj.layout17:setHeight(50);
    obj.layout17:setName("layout17");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout17);
    obj.button9:setLeft(0);
    obj.button9:setTop(5);
    obj.button9:setWidth(50);
    obj.button9:setHeight(20);
    obj.button9:setText("PER");
    obj.button9:setHorzTextAlign("center");
    obj.button9:setName("button9");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout17);
    obj.edit22:setLeft(0);
    obj.edit22:setTop(25);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(25);
    obj.edit22:setField("atr_per");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout17);
    obj.label17:setLeft(50);
    obj.label17:setTop(5);
    obj.label17:setWidth(50);
    obj.label17:setHeight(20);
    obj.label17:setText("Max.");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout17);
    obj.edit23:setLeft(50);
    obj.edit23:setTop(25);
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(25);
    obj.edit23:setField("atr_max_per");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout8);
    obj.horzLine3:setLeft(0);
    obj.horzLine3:setTop(340);
    obj.horzLine3:setWidth(300);
    obj.horzLine3:setStrokeColor("white");
    obj.horzLine3:setName("horzLine3");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout8);
    obj.layout18:setLeft(100);
    obj.layout18:setTop(340);
    obj.layout18:setWidth(240);
    obj.layout18:setHeight(50);
    obj.layout18:setName("layout18");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout18);
    obj.label18:setLeft(0);
    obj.label18:setTop(5);
    obj.label18:setWidth(50);
    obj.label18:setHeight(20);
    obj.label18:setText("VON");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout18);
    obj.edit24:setLeft(0);
    obj.edit24:setTop(25);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setField("bloco_von");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox1);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(490);
    obj.layout19:setWidth(250);
    obj.layout19:setHeight(120);
    obj.layout19:setName("layout19");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout19);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout19);
    obj.label19:setLeft(5);
    obj.label19:setTop(0);
    obj.label19:setWidth(240);
    obj.label19:setHeight(20);
    obj.label19:setText("FERIMENTOS PERMANENTES");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout19);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(240);
    obj.textEditor1:setHeight(90);
    obj.textEditor1:setField("ferimentos");
    obj.textEditor1:setName("textEditor1");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setLeft(260);
    obj.layout20:setTop(80);
    obj.layout20:setWidth(310);
    obj.layout20:setHeight(80);
    obj.layout20:setName("layout20");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout20);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout20);
    obj.button10:setLeft(0);
    obj.button10:setTop(0);
    obj.button10:setWidth(310);
    obj.button10:setHeight(20);
    obj.button10:setText("DEFESA");
    obj.button10:setHorzTextAlign("center");
    obj.button10:setName("button10");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(25);
    obj.layout21:setWidth(50);
    obj.layout21:setHeight(50);
    obj.layout21:setName("layout21");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout21);
    obj.label20:setLeft(0);
    obj.label20:setTop(5);
    obj.label20:setWidth(50);
    obj.label20:setHeight(20);
    obj.label20:setText("VEL");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout21);
    obj.edit25:setLeft(0);
    obj.edit25:setTop(25);
    obj.edit25:setWidth(50);
    obj.edit25:setHeight(25);
    obj.edit25:setField("bloco_vel");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout20);
    obj.layout22:setLeft(55);
    obj.layout22:setTop(25);
    obj.layout22:setWidth(50);
    obj.layout22:setHeight(50);
    obj.layout22:setName("layout22");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout22);
    obj.label21:setLeft(0);
    obj.label21:setTop(5);
    obj.label21:setWidth(50);
    obj.label21:setHeight(20);
    obj.label21:setText("AGI");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout22);
    obj.edit26:setLeft(0);
    obj.edit26:setTop(25);
    obj.edit26:setWidth(50);
    obj.edit26:setHeight(25);
    obj.edit26:setField("bloco_agi");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout20);
    obj.layout23:setLeft(105);
    obj.layout23:setTop(25);
    obj.layout23:setWidth(50);
    obj.layout23:setHeight(50);
    obj.layout23:setName("layout23");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout23);
    obj.label22:setLeft(0);
    obj.label22:setTop(5);
    obj.label22:setWidth(50);
    obj.label22:setHeight(20);
    obj.label22:setText("PER");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout23);
    obj.edit27:setLeft(0);
    obj.edit27:setTop(25);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(25);
    obj.edit27:setField("bloco_per");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout20);
    obj.layout24:setLeft(155);
    obj.layout24:setTop(25);
    obj.layout24:setWidth(50);
    obj.layout24:setHeight(50);
    obj.layout24:setName("layout24");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout24);
    obj.label23:setLeft(0);
    obj.label23:setTop(5);
    obj.label23:setWidth(50);
    obj.label23:setHeight(20);
    obj.label23:setText("EQUIP");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout24);
    obj.edit28:setLeft(0);
    obj.edit28:setTop(25);
    obj.edit28:setWidth(50);
    obj.edit28:setHeight(25);
    obj.edit28:setField("bloco_equip");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout20);
    obj.layout25:setLeft(205);
    obj.layout25:setTop(25);
    obj.layout25:setWidth(50);
    obj.layout25:setHeight(50);
    obj.layout25:setName("layout25");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout25);
    obj.label24:setLeft(0);
    obj.label24:setTop(5);
    obj.label24:setWidth(50);
    obj.label24:setHeight(20);
    obj.label24:setText("OUTRO");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout25);
    obj.edit29:setLeft(0);
    obj.edit29:setTop(25);
    obj.edit29:setWidth(50);
    obj.edit29:setHeight(25);
    obj.edit29:setField("bloco_out_def");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout20);
    obj.layout26:setLeft(255);
    obj.layout26:setTop(25);
    obj.layout26:setWidth(50);
    obj.layout26:setHeight(50);
    obj.layout26:setName("layout26");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout26);
    obj.label25:setLeft(0);
    obj.label25:setTop(5);
    obj.label25:setWidth(50);
    obj.label25:setHeight(20);
    obj.label25:setText("TOTAL");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout26);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(25);
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout26);
    obj.label26:setLeft(0);
    obj.label26:setTop(25);
    obj.label26:setWidth(50);
    obj.label26:setHeight(25);
    obj.label26:setField("defesa_total");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout20);
    obj.dataLink2:setFields({'bloco_vel', 'bloco_agi', 'bloco_per', 'bloco_equip', 'bloco_out_def'});
    obj.dataLink2:setName("dataLink2");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox1);
    obj.layout27:setLeft(260);
    obj.layout27:setTop(170);
    obj.layout27:setWidth(310);
    obj.layout27:setHeight(80);
    obj.layout27:setName("layout27");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout27);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(5);
    obj.rectangle6:setYradius(5);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setName("rectangle6");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout27);
    obj.button11:setLeft(0);
    obj.button11:setTop(0);
    obj.button11:setWidth(310);
    obj.button11:setHeight(20);
    obj.button11:setText("ARMADURA");
    obj.button11:setHorzTextAlign("center");
    obj.button11:setName("button11");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout27);
    obj.layout28:setLeft(30);
    obj.layout28:setTop(25);
    obj.layout28:setWidth(50);
    obj.layout28:setHeight(50);
    obj.layout28:setName("layout28");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout28);
    obj.label27:setLeft(0);
    obj.label27:setTop(5);
    obj.label27:setWidth(50);
    obj.label27:setHeight(20);
    obj.label27:setText("FIS");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout28);
    obj.edit30:setLeft(0);
    obj.edit30:setTop(25);
    obj.edit30:setWidth(50);
    obj.edit30:setHeight(25);
    obj.edit30:setField("bloco_fis");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout27);
    obj.layout29:setLeft(80);
    obj.layout29:setTop(25);
    obj.layout29:setWidth(50);
    obj.layout29:setHeight(50);
    obj.layout29:setName("layout29");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout29);
    obj.label28:setLeft(0);
    obj.label28:setTop(5);
    obj.label28:setWidth(50);
    obj.label28:setHeight(20);
    obj.label28:setText("ARM");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout29);
    obj.edit31:setLeft(0);
    obj.edit31:setTop(25);
    obj.edit31:setWidth(50);
    obj.edit31:setHeight(25);
    obj.edit31:setField("bloco_arm");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setName("edit31");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout27);
    obj.layout30:setLeft(130);
    obj.layout30:setTop(25);
    obj.layout30:setWidth(50);
    obj.layout30:setHeight(50);
    obj.layout30:setName("layout30");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout30);
    obj.label29:setLeft(0);
    obj.label29:setTop(5);
    obj.label29:setWidth(50);
    obj.label29:setHeight(20);
    obj.label29:setText("ESC");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout30);
    obj.edit32:setLeft(0);
    obj.edit32:setTop(25);
    obj.edit32:setWidth(50);
    obj.edit32:setHeight(25);
    obj.edit32:setField("bloco_esc");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout27);
    obj.layout31:setLeft(180);
    obj.layout31:setTop(25);
    obj.layout31:setWidth(50);
    obj.layout31:setHeight(50);
    obj.layout31:setName("layout31");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout31);
    obj.label30:setLeft(0);
    obj.label30:setTop(5);
    obj.label30:setWidth(50);
    obj.label30:setHeight(20);
    obj.label30:setText("OUTRO");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout31);
    obj.edit33:setLeft(0);
    obj.edit33:setTop(25);
    obj.edit33:setWidth(50);
    obj.edit33:setHeight(25);
    obj.edit33:setField("bloco_out_arm");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout27);
    obj.layout32:setLeft(230);
    obj.layout32:setTop(25);
    obj.layout32:setWidth(50);
    obj.layout32:setHeight(50);
    obj.layout32:setName("layout32");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout32);
    obj.label31:setLeft(0);
    obj.label31:setTop(5);
    obj.label31:setWidth(50);
    obj.label31:setHeight(20);
    obj.label31:setText("TOTAL");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout32);
    obj.rectangle7:setLeft(0);
    obj.rectangle7:setTop(25);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout32);
    obj.label32:setLeft(0);
    obj.label32:setTop(25);
    obj.label32:setWidth(50);
    obj.label32:setHeight(25);
    obj.label32:setField("armadura_total");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout27);
    obj.dataLink3:setFields({'bloco_fis', 'bloco_arm', 'bloco_esc', 'bloco_out_arm'});
    obj.dataLink3:setName("dataLink3");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.scrollBox1);
    obj.layout33:setLeft(260);
    obj.layout33:setTop(260);
    obj.layout33:setWidth(310);
    obj.layout33:setHeight(80);
    obj.layout33:setName("layout33");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout33);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setXradius(5);
    obj.rectangle8:setYradius(5);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setName("rectangle8");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout33);
    obj.button12:setLeft(0);
    obj.button12:setTop(0);
    obj.button12:setWidth(310);
    obj.button12:setHeight(20);
    obj.button12:setText("INICIATIVA");
    obj.button12:setHorzTextAlign("center");
    obj.button12:setName("button12");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout33);
    obj.layout34:setLeft(5);
    obj.layout34:setTop(25);
    obj.layout34:setWidth(50);
    obj.layout34:setHeight(50);
    obj.layout34:setName("layout34");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout34);
    obj.label33:setLeft(0);
    obj.label33:setTop(5);
    obj.label33:setWidth(50);
    obj.label33:setHeight(20);
    obj.label33:setText("VEL");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout34);
    obj.edit34:setLeft(0);
    obj.edit34:setTop(25);
    obj.edit34:setWidth(50);
    obj.edit34:setHeight(25);
    obj.edit34:setField("bloco_vel");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout33);
    obj.layout35:setLeft(55);
    obj.layout35:setTop(25);
    obj.layout35:setWidth(50);
    obj.layout35:setHeight(50);
    obj.layout35:setName("layout35");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout35);
    obj.label34:setLeft(0);
    obj.label34:setTop(5);
    obj.label34:setWidth(50);
    obj.label34:setHeight(20);
    obj.label34:setText("MAE");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout35);
    obj.edit35:setLeft(0);
    obj.edit35:setTop(25);
    obj.edit35:setWidth(50);
    obj.edit35:setHeight(25);
    obj.edit35:setField("bloco_mae");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout33);
    obj.layout36:setLeft(105);
    obj.layout36:setTop(25);
    obj.layout36:setWidth(50);
    obj.layout36:setHeight(50);
    obj.layout36:setName("layout36");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout36);
    obj.label35:setLeft(0);
    obj.label35:setTop(5);
    obj.label35:setWidth(50);
    obj.label35:setHeight(20);
    obj.label35:setText("PER");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout36);
    obj.edit36:setLeft(0);
    obj.edit36:setTop(25);
    obj.edit36:setWidth(50);
    obj.edit36:setHeight(25);
    obj.edit36:setField("bloco_per");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setName("edit36");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout33);
    obj.layout37:setLeft(155);
    obj.layout37:setTop(25);
    obj.layout37:setWidth(50);
    obj.layout37:setHeight(50);
    obj.layout37:setName("layout37");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout37);
    obj.label36:setLeft(0);
    obj.label36:setTop(5);
    obj.label36:setWidth(50);
    obj.label36:setHeight(20);
    obj.label36:setText("EQUIP");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout37);
    obj.edit37:setLeft(0);
    obj.edit37:setTop(25);
    obj.edit37:setWidth(50);
    obj.edit37:setHeight(25);
    obj.edit37:setField("bloco_equip_ini");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout33);
    obj.layout38:setLeft(205);
    obj.layout38:setTop(25);
    obj.layout38:setWidth(50);
    obj.layout38:setHeight(50);
    obj.layout38:setName("layout38");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout38);
    obj.label37:setLeft(0);
    obj.label37:setTop(5);
    obj.label37:setWidth(50);
    obj.label37:setHeight(20);
    obj.label37:setText("OUTRO");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout38);
    obj.edit38:setLeft(0);
    obj.edit38:setTop(25);
    obj.edit38:setWidth(50);
    obj.edit38:setHeight(25);
    obj.edit38:setField("bloco_out_ini");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout33);
    obj.layout39:setLeft(255);
    obj.layout39:setTop(25);
    obj.layout39:setWidth(50);
    obj.layout39:setHeight(50);
    obj.layout39:setName("layout39");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout39);
    obj.label38:setLeft(0);
    obj.label38:setTop(5);
    obj.label38:setWidth(50);
    obj.label38:setHeight(20);
    obj.label38:setText("TOTAL");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout39);
    obj.rectangle9:setLeft(0);
    obj.rectangle9:setTop(25);
    obj.rectangle9:setWidth(50);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout39);
    obj.label39:setLeft(0);
    obj.label39:setTop(25);
    obj.label39:setWidth(50);
    obj.label39:setHeight(25);
    obj.label39:setField("iniciativa_total");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout33);
    obj.dataLink4:setFields({'bloco_vel', 'bloco_mae', 'bloco_per', 'bloco_equip_ini', 'bloco_out_ini'});
    obj.dataLink4:setName("dataLink4");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox1);
    obj.layout40:setLeft(260);
    obj.layout40:setTop(350);
    obj.layout40:setWidth(310);
    obj.layout40:setHeight(80);
    obj.layout40:setName("layout40");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout40);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setXradius(5);
    obj.rectangle10:setYradius(5);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setName("rectangle10");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout40);
    obj.button13:setLeft(0);
    obj.button13:setTop(0);
    obj.button13:setWidth(310);
    obj.button13:setHeight(20);
    obj.button13:setText("ALCANCE DE COMANDO");
    obj.button13:setHorzTextAlign("center");
    obj.button13:setName("button13");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setLeft(55);
    obj.layout41:setTop(25);
    obj.layout41:setWidth(50);
    obj.layout41:setHeight(50);
    obj.layout41:setName("layout41");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout41);
    obj.label40:setLeft(0);
    obj.label40:setTop(5);
    obj.label40:setWidth(50);
    obj.label40:setHeight(20);
    obj.label40:setText("INT");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout41);
    obj.edit39:setLeft(0);
    obj.edit39:setTop(25);
    obj.edit39:setWidth(50);
    obj.edit39:setHeight(25);
    obj.edit39:setField("bloco_int");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout40);
    obj.layout42:setLeft(105);
    obj.layout42:setTop(25);
    obj.layout42:setWidth(50);
    obj.layout42:setHeight(50);
    obj.layout42:setName("layout42");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout42);
    obj.label41:setLeft(0);
    obj.label41:setTop(5);
    obj.label41:setWidth(50);
    obj.label41:setHeight(20);
    obj.label41:setText("CMD");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout42);
    obj.edit40:setLeft(0);
    obj.edit40:setTop(25);
    obj.edit40:setWidth(50);
    obj.edit40:setHeight(25);
    obj.edit40:setField("bloco_cmd");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout40);
    obj.layout43:setLeft(155);
    obj.layout43:setTop(25);
    obj.layout43:setWidth(50);
    obj.layout43:setHeight(50);
    obj.layout43:setName("layout43");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout43);
    obj.label42:setLeft(0);
    obj.label42:setTop(5);
    obj.label42:setWidth(50);
    obj.label42:setHeight(20);
    obj.label42:setText("OUTRO");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout43);
    obj.edit41:setLeft(0);
    obj.edit41:setTop(25);
    obj.edit41:setWidth(50);
    obj.edit41:setHeight(25);
    obj.edit41:setField("bloco_out_cmd");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setName("edit41");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout40);
    obj.layout44:setLeft(205);
    obj.layout44:setTop(25);
    obj.layout44:setWidth(50);
    obj.layout44:setHeight(50);
    obj.layout44:setName("layout44");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout44);
    obj.label43:setLeft(0);
    obj.label43:setTop(5);
    obj.label43:setWidth(50);
    obj.label43:setHeight(20);
    obj.label43:setText("TOTAL");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout44);
    obj.rectangle11:setLeft(0);
    obj.rectangle11:setTop(25);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout44);
    obj.label44:setLeft(0);
    obj.label44:setTop(25);
    obj.label44:setWidth(50);
    obj.label44:setHeight(25);
    obj.label44:setField("cmd_total");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout40);
    obj.dataLink5:setFields({'bloco_int', 'bloco_cmd', 'bloco_out_cmd'});
    obj.dataLink5:setName("dataLink5");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.scrollBox1);
    obj.layout45:setLeft(260);
    obj.layout45:setTop(440);
    obj.layout45:setWidth(310);
    obj.layout45:setHeight(165);
    obj.layout45:setName("layout45");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout45);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setXradius(5);
    obj.rectangle12:setYradius(5);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout45);
    obj.label45:setLeft(0);
    obj.label45:setTop(0);
    obj.label45:setWidth(310);
    obj.label45:setHeight(20);
    obj.label45:setText("PONTOS DE FAÇANHA");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout45);
    obj.edit42:setLeft(10);
    obj.edit42:setTop(25);
    obj.edit42:setWidth(50);
    obj.edit42:setHeight(25);
    obj.edit42:setField("facanha");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout45);
    obj.label46:setLeft(70);
    obj.label46:setTop(25);
    obj.label46:setWidth(230);
    obj.label46:setHeight(20);
    obj.label46:setText("Recebendo pontos de Façanha:");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout45);
    obj.label47:setLeft(70);
    obj.label47:setTop(45);
    obj.label47:setWidth(230);
    obj.label47:setHeight(20);
    obj.label47:setText("Destruir Inimigo, Sucesso Critico, Prêmio do Mestre.");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setFontSize(9);
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout45);
    obj.label48:setLeft(70);
    obj.label48:setTop(80);
    obj.label48:setWidth(230);
    obj.label48:setHeight(20);
    obj.label48:setText("Gastando pontos de Façanha:");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout45);
    obj.label49:setLeft(50);
    obj.label49:setTop(100);
    obj.label49:setWidth(250);
    obj.label49:setHeight(20);
    obj.label49:setText("Ampliar teste de Pericia, Atirar e Correr, Corrida.");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setFontSize(9);
    obj.label49:setName("label49");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout45);
    obj.label50:setLeft(50);
    obj.label50:setTop(120);
    obj.label50:setWidth(250);
    obj.label50:setHeight(20);
    obj.label50:setText("Ação Rapida, Recuperar Folego, Aparar, Esquiva, Refazer Teste.");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setFontSize(9);
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout45);
    obj.label51:setLeft(50);
    obj.label51:setTop(140);
    obj.label51:setWidth(250);
    obj.label51:setHeight(20);
    obj.label51:setText("Resistir efeito continuo/Imobilizar/Nocaute, Investida.");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setFontSize(9);
    obj.label51:setName("label51");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox1);
    obj.rectangle13:setLeft(579);
    obj.rectangle13:setTop(79);
    obj.rectangle13:setWidth(302);
    obj.rectangle13:setHeight(302);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(580);
    obj.image1:setTop(80);
    obj.image1:setWidth(300);
    obj.image1:setHeight(300);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.scrollBox1);
    obj.layout46:setLeft(580);
    obj.layout46:setTop(390);
    obj.layout46:setWidth(302);
    obj.layout46:setHeight(210);
    obj.layout46:setName("layout46");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout46);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setXradius(5);
    obj.rectangle14:setYradius(5);
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setName("rectangle14");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout46);
    obj.label52:setLeft(0);
    obj.label52:setTop(0);
    obj.label52:setWidth(302);
    obj.label52:setHeight(20);
    obj.label52:setText("ESPIRAL VITAL");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout46);
    obj.layout47:setLeft(6);
    obj.layout47:setTop(25);
    obj.layout47:setWidth(290);
    obj.layout47:setHeight(50);
    obj.layout47:setName("layout47");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout47);
    obj.label53:setLeft(0);
    obj.label53:setTop(15);
    obj.label53:setWidth(70);
    obj.label53:setHeight(20);
    obj.label53:setText("Fisico");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout47);
    obj.checkBox1:setLeft(75);
    obj.checkBox1:setTop(15);
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout47);
    obj.checkBox2:setLeft(90);
    obj.checkBox2:setTop(15);
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout47);
    obj.checkBox3:setLeft(105);
    obj.checkBox3:setTop(5);
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout47);
    obj.checkBox4:setLeft(105);
    obj.checkBox4:setTop(25);
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout47);
    obj.checkBox5:setLeft(120);
    obj.checkBox5:setTop(5);
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout47);
    obj.checkBox6:setLeft(120);
    obj.checkBox6:setTop(25);
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout47);
    obj.checkBox7:setLeft(135);
    obj.checkBox7:setTop(5);
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout47);
    obj.checkBox8:setLeft(135);
    obj.checkBox8:setTop(25);
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout47);
    obj.checkBox9:setLeft(150);
    obj.checkBox9:setTop(5);
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout47);
    obj.checkBox10:setLeft(150);
    obj.checkBox10:setTop(25);
    obj.checkBox10:setName("checkBox10");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout47);
    obj.label54:setLeft(165);
    obj.label54:setTop(5);
    obj.label54:setWidth(15);
    obj.label54:setHeight(15);
    obj.label54:setText("1");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout47);
    obj.label55:setLeft(165);
    obj.label55:setTop(25);
    obj.label55:setWidth(15);
    obj.label55:setHeight(15);
    obj.label55:setText("2");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout47);
    obj.label56:setLeft(190);
    obj.label56:setTop(15);
    obj.label56:setWidth(100);
    obj.label56:setHeight(20);
    obj.label56:setText("-2FOR");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout46);
    obj.layout48:setLeft(6);
    obj.layout48:setTop(75);
    obj.layout48:setWidth(290);
    obj.layout48:setHeight(50);
    obj.layout48:setName("layout48");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout48);
    obj.label57:setLeft(0);
    obj.label57:setTop(15);
    obj.label57:setWidth(70);
    obj.label57:setHeight(20);
    obj.label57:setText("Agilidade");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout48);
    obj.checkBox11:setLeft(75);
    obj.checkBox11:setTop(15);
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout48);
    obj.checkBox12:setLeft(90);
    obj.checkBox12:setTop(15);
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout48);
    obj.checkBox13:setLeft(105);
    obj.checkBox13:setTop(5);
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout48);
    obj.checkBox14:setLeft(105);
    obj.checkBox14:setTop(25);
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout48);
    obj.checkBox15:setLeft(120);
    obj.checkBox15:setTop(5);
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout48);
    obj.checkBox16:setLeft(120);
    obj.checkBox16:setTop(25);
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout48);
    obj.checkBox17:setLeft(135);
    obj.checkBox17:setTop(5);
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout48);
    obj.checkBox18:setLeft(135);
    obj.checkBox18:setTop(25);
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout48);
    obj.checkBox19:setLeft(150);
    obj.checkBox19:setTop(5);
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout48);
    obj.checkBox20:setLeft(150);
    obj.checkBox20:setTop(25);
    obj.checkBox20:setName("checkBox20");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout48);
    obj.label58:setLeft(165);
    obj.label58:setTop(5);
    obj.label58:setWidth(15);
    obj.label58:setHeight(15);
    obj.label58:setText("3");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout48);
    obj.label59:setLeft(165);
    obj.label59:setTop(25);
    obj.label59:setWidth(15);
    obj.label59:setHeight(15);
    obj.label59:setText("4");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout48);
    obj.label60:setLeft(190);
    obj.label60:setTop(15);
    obj.label60:setWidth(100);
    obj.label60:setHeight(20);
    obj.label60:setText("-2 Ataques");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout46);
    obj.layout49:setLeft(6);
    obj.layout49:setTop(125);
    obj.layout49:setWidth(290);
    obj.layout49:setHeight(50);
    obj.layout49:setName("layout49");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout49);
    obj.label61:setLeft(0);
    obj.label61:setTop(15);
    obj.label61:setWidth(70);
    obj.label61:setHeight(20);
    obj.label61:setText("Intelecto");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout49);
    obj.checkBox21:setLeft(75);
    obj.checkBox21:setTop(15);
    obj.checkBox21:setName("checkBox21");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout49);
    obj.checkBox22:setLeft(90);
    obj.checkBox22:setTop(15);
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout49);
    obj.checkBox23:setLeft(105);
    obj.checkBox23:setTop(5);
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout49);
    obj.checkBox24:setLeft(105);
    obj.checkBox24:setTop(25);
    obj.checkBox24:setName("checkBox24");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout49);
    obj.checkBox25:setLeft(120);
    obj.checkBox25:setTop(5);
    obj.checkBox25:setName("checkBox25");

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout49);
    obj.checkBox26:setLeft(120);
    obj.checkBox26:setTop(25);
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout49);
    obj.checkBox27:setLeft(135);
    obj.checkBox27:setTop(5);
    obj.checkBox27:setName("checkBox27");

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout49);
    obj.checkBox28:setLeft(135);
    obj.checkBox28:setTop(25);
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout49);
    obj.checkBox29:setLeft(150);
    obj.checkBox29:setTop(5);
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout49);
    obj.checkBox30:setLeft(150);
    obj.checkBox30:setTop(25);
    obj.checkBox30:setName("checkBox30");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout49);
    obj.label62:setLeft(165);
    obj.label62:setTop(5);
    obj.label62:setWidth(15);
    obj.label62:setHeight(15);
    obj.label62:setText("5");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout49);
    obj.label63:setLeft(165);
    obj.label63:setTop(25);
    obj.label63:setWidth(15);
    obj.label63:setHeight(15);
    obj.label63:setText("6");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout49);
    obj.label64:setLeft(190);
    obj.label64:setTop(15);
    obj.label64:setWidth(100);
    obj.label64:setHeight(20);
    obj.label64:setText("-2 DEF, X magia");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout46);
    obj.layout50:setLeft(6);
    obj.layout50:setTop(160);
    obj.layout50:setWidth(290);
    obj.layout50:setHeight(50);
    obj.layout50:setName("layout50");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout50);
    obj.label65:setLeft(0);
    obj.label65:setTop(15);
    obj.label65:setWidth(100);
    obj.label65:setHeight(20);
    obj.label65:setText("Campo de Força");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout50);
    obj.checkBox31:setLeft(105);
    obj.checkBox31:setTop(15);
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout50);
    obj.checkBox32:setLeft(120);
    obj.checkBox32:setTop(15);
    obj.checkBox32:setName("checkBox32");

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout50);
    obj.checkBox33:setLeft(135);
    obj.checkBox33:setTop(15);
    obj.checkBox33:setName("checkBox33");

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout50);
    obj.checkBox34:setLeft(150);
    obj.checkBox34:setTop(15);
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout50);
    obj.checkBox35:setLeft(165);
    obj.checkBox35:setTop(15);
    obj.checkBox35:setName("checkBox35");

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout50);
    obj.checkBox36:setLeft(180);
    obj.checkBox36:setTop(15);
    obj.checkBox36:setName("checkBox36");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setAlign("client");
    obj.image2:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20RdF%20releases/imagens/block.png");
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            --atualizando atributos iniciais--
            					sheet.atr_fis = listaRacas[sheet.desc_raca]["fis"][1];
            					sheet.atr_vel = listaRacas[sheet.desc_raca]["vel"][1];
            					sheet.atr_for = listaRacas[sheet.desc_raca]["for"][1];
            					sheet.atr_agi = listaRacas[sheet.desc_raca]["agi"][1];
            					sheet.atr_des = listaRacas[sheet.desc_raca]["des"][1];
            					sheet.atr_mae = listaRacas[sheet.desc_raca]["mae"][1];
            					sheet.atr_int = listaRacas[sheet.desc_raca]["int"][1];
            					sheet.atr_arc = listaRacas[sheet.desc_raca]["arc"][1];
            					sheet.atr_per = listaRacas[sheet.desc_raca]["per"][1];
            
            					--atualizando atributos maximos heroi --
            					sheet.atr_max_fis = listaRacas[sheet.desc_raca]["fis"][2];
            					sheet.atr_max_vel = listaRacas[sheet.desc_raca]["vel"][2];
            					sheet.atr_max_for = listaRacas[sheet.desc_raca]["for"][2];
            					sheet.atr_max_agi = listaRacas[sheet.desc_raca]["agi"][2];
            					sheet.atr_max_des = listaRacas[sheet.desc_raca]["des"][2];
            					sheet.atr_max_mae = listaRacas[sheet.desc_raca]["mae"][2];
            					sheet.atr_max_int = listaRacas[sheet.desc_raca]["int"][2];
            					sheet.atr_max_arc = listaRacas[sheet.desc_raca]["arc"][2];
            					sheet.atr_max_per = listaRacas[sheet.desc_raca]["per"][2];
        end);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (event)
            local atributoRolagem = sheet.atr_fis;
            					if atributoRolagem ~= nil then
            						local rolagem = Firecast.interpretarRolagem("2d6"):concatenar(atributoRolagem)
            						Firecast.getMesaDe(sheet).chat:rolarDados(rolagem);
            					end;
        end);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (event)
            local atributoRolagem = sheet.atr_vel;
            					if atributoRolagem ~= nil then
            						local rolagem = Firecast.interpretarRolagem("2d6"):concatenar(atributoRolagem)
            						Firecast.getMesaDe(sheet).chat:rolarDados(rolagem);
            					end;
        end);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (event)
            local atributoRolagem = sheet.atr_for;
            					if atributoRolagem ~= nil then
            						local rolagem = Firecast.interpretarRolagem("2d6"):concatenar(atributoRolagem)
            						Firecast.getMesaDe(sheet).chat:rolarDados(rolagem);
            					end;
        end);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (event)
            local atributoRolagem = sheet.atr_agi;
            					if atributoRolagem ~= nil then
            						local rolagem = Firecast.interpretarRolagem("2d6"):concatenar(atributoRolagem)
            						Firecast.getMesaDe(sheet).chat:rolarDados(rolagem);
            					end;
        end);

    obj._e_event5 = obj.button5:addEventListener("onClick",
        function (event)
            local atributoRolagem = sheet.atr_des;
            					if atributoRolagem ~= nil then
            						local rolagem = Firecast.interpretarRolagem("2d6"):concatenar(atributoRolagem)
            						Firecast.getMesaDe(sheet).chat:rolarDados(rolagem);
            					end;
        end);

    obj._e_event6 = obj.button6:addEventListener("onClick",
        function (event)
            local atributoRolagem = sheet.atr_mae;
            					if atributoRolagem ~= nil then
            						local rolagem = Firecast.interpretarRolagem("2d6"):concatenar(atributoRolagem)
            						Firecast.getMesaDe(sheet).chat:rolarDados(rolagem);
            					end;
        end);

    obj._e_event7 = obj.button7:addEventListener("onClick",
        function (event)
            local atributoRolagem = sheet.atr_int;
            					if atributoRolagem ~= nil then
            						local rolagem = Firecast.interpretarRolagem("2d6"):concatenar(atributoRolagem)
            						Firecast.getMesaDe(sheet).chat:rolarDados(rolagem);
            					end;
        end);

    obj._e_event8 = obj.button8:addEventListener("onClick",
        function (event)
            local atributoRolagem = sheet.atr_arc;
            					if atributoRolagem ~= nil then
            						local rolagem = Firecast.interpretarRolagem("2d6"):concatenar(atributoRolagem)
            						Firecast.getMesaDe(sheet).chat:rolarDados(rolagem);
            					end;
        end);

    obj._e_event9 = obj.button9:addEventListener("onClick",
        function (event)
            local atributoRolagem = sheet.atr_per;
            					if atributoRolagem ~= nil then
            						local rolagem = Firecast.interpretarRolagem("2d6"):concatenar(atributoRolagem)
            						Firecast.getMesaDe(sheet).chat:rolarDados(rolagem);
            					end;
        end);

    obj._e_event10 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.defesa_total = 	(tonumber(sheet.bloco_vel) or 0) + 
            	                                            (tonumber(sheet.bloco_agi) or 0) + 
            	                                            (tonumber(sheet.bloco_per) or 0) + 
            	                                            (tonumber(sheet.bloco_equip) or 0) + 
            	                                            (tonumber(sheet.bloco_out_def) or 0);
                            	end;
        end);

    obj._e_event11 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.armadura_total = 	(tonumber(sheet.bloco_fis) or 0) + 
            	                                            (tonumber(sheet.bloco_arm) or 0) + 
            	                                            (tonumber(sheet.bloco_esc) or 0) + 
            	                                            (tonumber(sheet.bloco_out_arm) or 0);
                            	end;
        end);

    obj._e_event12 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.iniciativa_total = 	(tonumber(sheet.bloco_vel) or 0) + 
            	                                            	(tonumber(sheet.bloco_mae) or 0) + 
            	                                            	(tonumber(sheet.bloco_per) or 0) + 
            	                                            	(tonumber(sheet.bloco_equip_ini) or 0) + 
            	                                            	(tonumber(sheet.bloco_out_ini) or 0);
                            	end;
        end);

    obj._e_event13 = obj.dataLink5:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.cmd_total = 	(tonumber(sheet.bloco_int) or 0) + 
            	                                            	(tonumber(sheet.bloco_cmd) or 0) + 
            	                                            	(tonumber(sheet.bloco_out_cmd) or 0);
                            	end;
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmRDF1()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmRDF1();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmRDF1 = {
    newEditor = newfrmRDF1, 
    new = newfrmRDF1, 
    name = "frmRDF1", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmRDF1 = _frmRDF1;
Firecast.registrarForm(_frmRDF1);

return _frmRDF1;
