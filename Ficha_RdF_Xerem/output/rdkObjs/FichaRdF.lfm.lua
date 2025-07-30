require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmReinosRPG()
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
    obj:setDataType("rdfRPG");
    obj:setTitle("Reinos De Ferro (auto)");
    obj:setName("frmReinosRPG");
    obj.cacheMode = "time";
    obj.grid["padding-top"] = 8;
    obj.grid["cnt-line-spacing"] = 4;


    




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

        pericias = {

            ['Arco'] = 'DES',
            ['Arma de Arremesso'] = 'MAE',
            ['Arma de Mão'] = 'MAE',
            ['Arma Grande'] = 'MAE',
            ['Artilharia Leve'] = 'DES',
            ['Besta'] = 'DES',
            ['Escudo'] = 'MAE',
            ['Fuzil'] = 'MAE',
            ['Lança'] = 'MAE',
            ['Pistola'] = 'DES',
            ['Alquimia'] = 'INT',
            ['Arrombar'] = 'AGI',
            ['Arte da Fuga'] = 'AGI',
        }
    






    obj.Funcoes = GUI.fromHandle(_obj_newObject("form"));
    obj.Funcoes:setParent(obj);
    obj.Funcoes:setName("Funcoes");
    obj.Funcoes:setAlign("client");
    obj.Funcoes:setTheme("dark");
    obj.Funcoes.grid["padding-top"] = 8;
    obj.Funcoes.grid["cnt-line-spacing"] = 4;


        



            local function rolarTesteAtr(atr)
                local rolagem = Firecast.interpretarRolagem("2d6"):concatenar(atr);
                local mesa = Firecast.getMesaDe(sheet);
                mesa.chat:rolarDados(rolagem);
            end;
            



    


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.Geral = GUI.fromHandle(_obj_newObject("form"));
    obj.Geral:setParent(obj.tab1);
    obj.Geral:setName("Geral");
    obj.Geral:setAlign("client");
    obj.Geral:setTheme("dark");
    obj.Geral.grid["padding-top"] = 8;
    obj.Geral.grid["cnt-line-spacing"] = 4;

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.Geral);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1.grid.role = "col";
    obj.layout1.grid.width = 8;
    obj.layout1.grid["horz-align"] = "center";
    obj.layout1.grid["cnt-gutter"] = 10;
    obj.layout1.grid["min-height"] = 1000;
    obj.layout1.grid["padding-top"] = 20;
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1.grid.role = "col";
    obj.rectangle1.grid.width = 12;
    obj.rectangle1.grid["auto-height"] = true;
    obj.rectangle1.grid["margin-bottom"] = 10;
    obj.rectangle1.grid["padding-bottom"] = 40;
    obj.rectangle1.grid["padding-top"] = 40;
    obj.rectangle1.grid["padding-left"] = 20;
    obj.rectangle1.grid["padding-right"] = 20;
    obj.rectangle1.grid["cnt-horz-align"] = "around";
    obj.rectangle1:setName("rectangle1");
    lfm_setPropAsString(obj.rectangle1, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setStrokeColor("#343434");
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setColor("#1f1e1e");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2.grid.role = "col";
    obj.layout2.grid.width = 2;
    obj.layout2:setName("layout2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setField("info_NOME");
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 12;
    obj.edit1:setTransparent(true);
    obj.edit1:setName("edit1");
    obj.edit1:setHeight(25);

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout2);
    obj.horzLine1:setStrokeColor("gray");
    obj.horzLine1.grid.role = "col";
    obj.horzLine1.grid.width = 12;
    obj.horzLine1:setName("horzLine1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setText("NOME");
    obj.label1.grid.role = "col";
    obj.label1.grid.width = 12;
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setName("label1");
    obj.label1:setFontColor("#b5b5b5");
    obj.label1:setHeight(25);

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3.grid.role = "col";
    obj.layout3.grid.width = 2;
    obj.layout3:setName("layout3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setField("info_JOGADOR");
    obj.edit2.grid.role = "col";
    obj.edit2.grid.width = 12;
    obj.edit2:setTransparent(true);
    obj.edit2:setName("edit2");
    obj.edit2:setHeight(25);

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout3);
    obj.horzLine2:setStrokeColor("gray");
    obj.horzLine2.grid.role = "col";
    obj.horzLine2.grid.width = 12;
    obj.horzLine2:setName("horzLine2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setText("JOGADOR");
    obj.label2.grid.role = "col";
    obj.label2.grid.width = 12;
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setName("label2");
    obj.label2:setFontColor("#b5b5b5");
    obj.label2:setHeight(25);

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4.grid.role = "col";
    obj.layout4.grid.width = 4;
    obj.layout4:setName("layout4");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout4);
    obj.comboBox1:setItems({'Dotado', 'Habilidoso', 'Intelectial','Poderoso'});
    obj.comboBox1:setField("info_ARQUÉTIPO");
    obj.comboBox1.grid.role = "col";
    obj.comboBox1.grid.width = 12;
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setHeight(25);

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout4);
    obj.horzLine3:setStrokeColor("gray");
    obj.horzLine3.grid.role = "col";
    obj.horzLine3.grid.width = 12;
    obj.horzLine3:setName("horzLine3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setText("ARQUÉTIPO");
    obj.label3.grid.role = "col";
    obj.label3.grid.width = 12;
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setName("label3");
    obj.label3:setFontColor("#b5b5b5");
    obj.label3:setHeight(25);

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5.grid.role = "col";
    obj.layout5.grid.width = 4;
    obj.layout5:setName("layout5");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setField("info_RELIGIÃO");
    obj.edit3.grid.role = "col";
    obj.edit3.grid.width = 12;
    obj.edit3:setTransparent(true);
    obj.edit3:setName("edit3");
    obj.edit3:setHeight(25);

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout5);
    obj.horzLine4:setStrokeColor("gray");
    obj.horzLine4.grid.role = "col";
    obj.horzLine4.grid.width = 12;
    obj.horzLine4:setName("horzLine4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setText("RELIGIÃO");
    obj.label4.grid.role = "col";
    obj.label4.grid.width = 12;
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setName("label4");
    obj.label4:setFontColor("#b5b5b5");
    obj.label4:setHeight(25);

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6.grid.role = "col";
    obj.layout6.grid.width = 2;
    obj.layout6:setName("layout6");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout6);
    obj.comboBox2:setItems({'Humano', 'Anão', 'Gobber','Iosano', 'Nyss', 'Trolloide'});
    obj.comboBox2:setField("info_RAÇA");
    obj.comboBox2.grid.role = "col";
    obj.comboBox2.grid.width = 12;
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setName("comboBox2");
    obj.comboBox2:setHeight(25);

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout6);
    obj.horzLine5:setStrokeColor("gray");
    obj.horzLine5.grid.role = "col";
    obj.horzLine5.grid.width = 12;
    obj.horzLine5:setName("horzLine5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setText("RAÇA");
    obj.label5.grid.role = "col";
    obj.label5.grid.width = 12;
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setName("label5");
    obj.label5:setFontColor("#b5b5b5");
    obj.label5:setHeight(25);

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7.grid.role = "col";
    obj.layout7.grid.width = 1;
    obj.layout7:setName("layout7");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout7);
    obj.edit4:setField("info_IDADE");
    obj.edit4.grid.role = "col";
    obj.edit4.grid.width = 12;
    obj.edit4:setTransparent(true);
    obj.edit4:setName("edit4");
    obj.edit4:setHeight(25);

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout7);
    obj.horzLine6:setStrokeColor("gray");
    obj.horzLine6.grid.role = "col";
    obj.horzLine6.grid.width = 12;
    obj.horzLine6:setName("horzLine6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setText("IDADE");
    obj.label6.grid.role = "col";
    obj.label6.grid.width = 12;
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setName("label6");
    obj.label6:setFontColor("#b5b5b5");
    obj.label6:setHeight(25);

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8.grid.role = "col";
    obj.layout8.grid.width = 1;
    obj.layout8:setName("layout8");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout8);
    obj.edit5:setField("info_ALTURA");
    obj.edit5.grid.role = "col";
    obj.edit5.grid.width = 12;
    obj.edit5:setTransparent(true);
    obj.edit5:setName("edit5");
    obj.edit5:setHeight(25);

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout8);
    obj.horzLine7:setStrokeColor("gray");
    obj.horzLine7.grid.role = "col";
    obj.horzLine7.grid.width = 12;
    obj.horzLine7:setName("horzLine7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setText("ALTURA");
    obj.label7.grid.role = "col";
    obj.label7.grid.width = 12;
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setName("label7");
    obj.label7:setFontColor("#b5b5b5");
    obj.label7:setHeight(25);

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9.grid.role = "col";
    obj.layout9.grid.width = 4;
    obj.layout9:setName("layout9");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout9);
    obj.edit6:setField("info_CARREIRAS");
    obj.edit6.grid.role = "col";
    obj.edit6.grid.width = 12;
    obj.edit6:setTransparent(true);
    obj.edit6:setName("edit6");
    obj.edit6:setHeight(25);

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout9);
    obj.horzLine8:setStrokeColor("gray");
    obj.horzLine8.grid.role = "col";
    obj.horzLine8.grid.width = 12;
    obj.horzLine8:setName("horzLine8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout9);
    obj.label8:setText("CARREIRAS");
    obj.label8.grid.role = "col";
    obj.label8.grid.width = 12;
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setName("label8");
    obj.label8:setFontColor("#b5b5b5");
    obj.label8:setHeight(25);

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10.grid.role = "col";
    obj.layout10.grid.width = 2;
    obj.layout10:setName("layout10");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout10);
    obj.edit7:setField("info_NÍVEL");
    obj.edit7.grid.role = "col";
    obj.edit7.grid.width = 12;
    obj.edit7:setTransparent(true);
    obj.edit7:setName("edit7");
    obj.edit7:setHeight(25);

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout10);
    obj.horzLine9:setStrokeColor("gray");
    obj.horzLine9.grid.role = "col";
    obj.horzLine9.grid.width = 12;
    obj.horzLine9:setName("horzLine9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout10);
    obj.label9:setText("NÍVEL");
    obj.label9.grid.role = "col";
    obj.label9.grid.width = 12;
    obj.label9:setHorzTextAlign("leading");
    obj.label9:setName("label9");
    obj.label9:setFontColor("#b5b5b5");
    obj.label9:setHeight(25);

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11.grid.role = "col";
    obj.layout11.grid.width = 2;
    obj.layout11:setName("layout11");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout11);
    obj.edit8:setField("info_XP");
    obj.edit8.grid.role = "col";
    obj.edit8.grid.width = 12;
    obj.edit8:setTransparent(true);
    obj.edit8:setName("edit8");
    obj.edit8:setHeight(25);

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.layout11);
    obj.horzLine10:setStrokeColor("gray");
    obj.horzLine10.grid.role = "col";
    obj.horzLine10.grid.width = 12;
    obj.horzLine10:setName("horzLine10");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout11);
    obj.label10:setText("XP");
    obj.label10.grid.role = "col";
    obj.label10.grid.width = 12;
    obj.label10:setHorzTextAlign("leading");
    obj.label10:setName("label10");
    obj.label10:setFontColor("#b5b5b5");
    obj.label10:setHeight(25);

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2.grid.role = "col";
    obj.rectangle2.grid.width = 3;
    obj.rectangle2.grid["auto-height"] = true;
    obj.rectangle2.grid["padding-bottom"] = 30;
    obj.rectangle2:setName("rectangle2");
    lfm_setPropAsString(obj.rectangle2, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setXradius(15);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setStrokeColor("#343434");
    obj.rectangle2:setStrokeSize(2);
    obj.rectangle2:setColor("#1f1e1e");
    obj.rectangle2.grid["padding-top"] = 5;
    obj.rectangle2.grid["padding-left"] = 8;
    obj.rectangle2.grid["padding-right"] = 8;

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle2);
    obj.rectangle3:setColor("grey");
    obj.rectangle3:setXradius(0);
    obj.rectangle3:setYradius(0);
    obj.rectangle3.grid.role = "col";
    obj.rectangle3.grid.width = 12;
    obj.rectangle3.grid["cnt-vert-align"] = "center";
    obj.rectangle3.grid["max-height"] = 23;
    obj.rectangle3.grid["margin-bottom"] = 5;
    obj.rectangle3.grid["margin-top"] = -5;
    obj.rectangle3.grid["margin-left"] = -5;
    obj.rectangle3.grid["margin-right"] = -5;
    obj.rectangle3:setName("rectangle3");
    lfm_setPropAsString(obj.rectangle3, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setStrokeColor("#343434");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3.grid["padding-top"] = 5;
    obj.rectangle3.grid["padding-left"] = 8;
    obj.rectangle3.grid["padding-right"] = 8;
    obj.rectangle3.grid["padding-bottom"] = 5;

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle3);
    obj.label11:setText("ATRIBUTOS");
    obj.label11:setHorzTextAlign("leading");
    obj.label11:setFontSize(15);
    lfm_setPropAsString(obj.label11, "fontStyle", "bold");
    obj.label11.grid.role = "col";
    obj.label11:setFontColor("black");
    obj.label11.grid["dyn-width-txt"] = true;
    obj.label11:setName("label11");
    obj.label11:setHeight(25);

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle2);
    obj.layout12.grid.role = "col";
    obj.layout12.grid.width = 12;
    obj.layout12.grid["auto-height"] = true;
    obj.layout12.grid["max-height"] = 160;
    obj.layout12:setName("layout12");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout12);
    obj.layout13.grid.role = "col";
    obj.layout13.grid.width = 6;
    obj.layout13.grid["auto-height"] = true;
    obj.layout13:setName("layout13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14.grid.role = "col";
    obj.layout14.grid.width = 12;
    obj.layout14:setName("layout14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout13);
    obj.layout15.grid.role = "col";
    obj.layout15.grid.width = 12;
    obj.layout15.grid["auto-height"] = true;
    obj.layout15.grid["cnt-horz-align"] = "middle";
    obj.layout15.grid["cnt-vert-align"] = "bottom";
    obj.layout15:setName("layout15");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16.grid.role = "col";
    obj.layout16.grid.width = 6;
    obj.layout16.grid["auto-height"] = true;
    obj.layout16:setName("layout16");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout16);
    lfm_setPropAsString(obj.rectangle4, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle4.grid.role = "col";
    obj.rectangle4.grid.width = 12;
    obj.rectangle4.grid["auto-height"] = true;
    obj.rectangle4.grid["min-height"] = 50;
    obj.rectangle4.grid["cnt-vert-align"] = "bottom";
    obj.rectangle4:setStrokeColor("#374857");
    obj.rectangle4:setName("rectangle4");
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setXradius(15);
    obj.rectangle4:setYradius(15);
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setColor("#1f1e1e");
    obj.rectangle4.grid["padding-top"] = 5;
    obj.rectangle4.grid["padding-left"] = 8;
    obj.rectangle4.grid["padding-right"] = 8;
    obj.rectangle4.grid["padding-bottom"] = 5;

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle4);
    obj.edit9:setField("atr_FIS or 0");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("trailing");
    obj.edit9:setTransparent(true);
    obj.edit9.grid.role = "col";
    obj.edit9.grid.width = 12;
    obj.edit9:setFontSize(20);
    obj.edit9:setName("edit9");
    obj.edit9:setHeight(25);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout16);
    obj.button1:setText("FIS");
    obj.button1:setHorzTextAlign("center");
    obj.button1.grid.role = "col";
    obj.button1.grid.width = 12;
    obj.button1:setName("button1");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout15);
    obj.layout17.grid.role = "col";
    obj.layout17.grid.width = 6;
    obj.layout17.grid["auto-height"] = true;
    obj.layout17:setName("layout17");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout17);
    lfm_setPropAsString(obj.rectangle5, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle5.grid.role = "col";
    obj.rectangle5.grid.width = 12;
    obj.rectangle5.grid["auto-height"] = true;
    obj.rectangle5.grid["min-height"] = 40;
    obj.rectangle5.grid["cnt-vert-align"] = "bottom";
    obj.rectangle5:setStrokeColor("#545454");
    obj.rectangle5:setName("rectangle5");
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setXradius(15);
    obj.rectangle5:setYradius(15);
    obj.rectangle5:setStrokeSize(2);
    obj.rectangle5:setColor("#1f1e1e");
    obj.rectangle5.grid["padding-top"] = 5;
    obj.rectangle5.grid["padding-left"] = 8;
    obj.rectangle5.grid["padding-right"] = 8;
    obj.rectangle5.grid["padding-bottom"] = 5;

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle5);
    obj.edit10:setField("atr_max_FIS");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setVertTextAlign("trailing");
    obj.edit10:setTransparent(true);
    obj.edit10.grid.role = "col";
    obj.edit10.grid.width = 12;
    obj.edit10:setFontSize(15);
    obj.edit10:setName("edit10");
    obj.edit10:setHeight(25);

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout17);
    obj.label12:setText("MAX");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setVertTextAlign("trailing");
    obj.label12.grid.role = "col";
    obj.label12.grid.width = 12;
    obj.label12:setFontSize(10);
    obj.label12:setName("label12");
    obj.label12:setFontColor("#b5b5b5");
    obj.label12:setHeight(25);

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout13);
    obj.layout18.grid.role = "col";
    obj.layout18.grid.width = 12;
    obj.layout18:setName("layout18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout12);
    obj.layout19.grid.role = "col";
    obj.layout19.grid.width = 6;
    obj.layout19.grid["auto-height"] = true;
    obj.layout19:setName("layout19");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20.grid.role = "col";
    obj.layout20.grid.width = 12;
    obj.layout20.grid["auto-height"] = true;
    obj.layout20.grid["cnt-horz-align"] = "middle";
    obj.layout20.grid["cnt-vert-align"] = "bottom";
    obj.layout20:setName("layout20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21.grid.role = "col";
    obj.layout21.grid.width = 6;
    obj.layout21.grid["auto-height"] = true;
    obj.layout21:setName("layout21");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout21);
    lfm_setPropAsString(obj.rectangle6, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle6.grid.role = "col";
    obj.rectangle6.grid.width = 12;
    obj.rectangle6.grid["auto-height"] = true;
    obj.rectangle6.grid["min-height"] = 50;
    obj.rectangle6.grid["cnt-vert-align"] = "bottom";
    obj.rectangle6:setStrokeColor("#545454");
    obj.rectangle6:setName("rectangle6");
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setXradius(15);
    obj.rectangle6:setYradius(15);
    obj.rectangle6:setStrokeSize(2);
    obj.rectangle6:setColor("#1f1e1e");
    obj.rectangle6.grid["padding-top"] = 5;
    obj.rectangle6.grid["padding-left"] = 8;
    obj.rectangle6.grid["padding-right"] = 8;
    obj.rectangle6.grid["padding-bottom"] = 5;

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle6);
    obj.edit11:setField("atr_VEL or 0");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setVertTextAlign("trailing");
    obj.edit11:setTransparent(true);
    obj.edit11.grid.role = "col";
    obj.edit11.grid.width = 12;
    obj.edit11:setFontSize(20);
    obj.edit11:setName("edit11");
    obj.edit11:setHeight(25);

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout21);
    obj.button2:setText("VEL");
    obj.button2:setHorzTextAlign("center");
    obj.button2.grid.role = "col";
    obj.button2.grid.width = 12;
    obj.button2:setName("button2");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout20);
    obj.layout22.grid.role = "col";
    obj.layout22.grid.width = 6;
    obj.layout22.grid["auto-height"] = true;
    obj.layout22:setName("layout22");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout22);
    lfm_setPropAsString(obj.rectangle7, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle7.grid.role = "col";
    obj.rectangle7.grid.width = 12;
    obj.rectangle7.grid["auto-height"] = true;
    obj.rectangle7.grid["min-height"] = 40;
    obj.rectangle7.grid["cnt-vert-align"] = "bottom";
    obj.rectangle7:setStrokeColor("#545454");
    obj.rectangle7:setName("rectangle7");
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setXradius(15);
    obj.rectangle7:setYradius(15);
    obj.rectangle7:setStrokeSize(2);
    obj.rectangle7:setColor("#1f1e1e");
    obj.rectangle7.grid["padding-top"] = 5;
    obj.rectangle7.grid["padding-left"] = 8;
    obj.rectangle7.grid["padding-right"] = 8;
    obj.rectangle7.grid["padding-bottom"] = 5;

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle7);
    obj.edit12:setField("atr_max_VEL");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setVertTextAlign("trailing");
    obj.edit12:setTransparent(true);
    obj.edit12.grid.role = "col";
    obj.edit12.grid.width = 12;
    obj.edit12:setFontSize(15);
    obj.edit12:setName("edit12");
    obj.edit12:setHeight(25);

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout22);
    obj.label13:setText("MAX");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setVertTextAlign("trailing");
    obj.label13.grid.role = "col";
    obj.label13.grid.width = 12;
    obj.label13:setFontSize(10);
    obj.label13:setName("label13");
    obj.label13:setFontColor("#b5b5b5");
    obj.label13:setHeight(25);

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout19);
    obj.layout23.grid.role = "col";
    obj.layout23.grid.width = 12;
    obj.layout23.grid["auto-height"] = true;
    obj.layout23.grid["cnt-horz-align"] = "middle";
    obj.layout23.grid["cnt-vert-align"] = "bottom";
    obj.layout23:setName("layout23");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout23);
    obj.layout24.grid.role = "col";
    obj.layout24.grid.width = 6;
    obj.layout24.grid["auto-height"] = true;
    obj.layout24:setName("layout24");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout24);
    lfm_setPropAsString(obj.rectangle8, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle8.grid.role = "col";
    obj.rectangle8.grid.width = 12;
    obj.rectangle8.grid["auto-height"] = true;
    obj.rectangle8.grid["min-height"] = 50;
    obj.rectangle8.grid["cnt-vert-align"] = "bottom";
    obj.rectangle8:setStrokeColor("#545454");
    obj.rectangle8:setName("rectangle8");
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setXradius(15);
    obj.rectangle8:setYradius(15);
    obj.rectangle8:setStrokeSize(2);
    obj.rectangle8:setColor("#1f1e1e");
    obj.rectangle8.grid["padding-top"] = 5;
    obj.rectangle8.grid["padding-left"] = 8;
    obj.rectangle8.grid["padding-right"] = 8;
    obj.rectangle8.grid["padding-bottom"] = 5;

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle8);
    obj.edit13:setField("atr_FOR or 0");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setVertTextAlign("trailing");
    obj.edit13:setTransparent(true);
    obj.edit13.grid.role = "col";
    obj.edit13.grid.width = 12;
    obj.edit13:setFontSize(20);
    obj.edit13:setName("edit13");
    obj.edit13:setHeight(25);

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout24);
    obj.button3:setText("FOR");
    obj.button3:setHorzTextAlign("center");
    obj.button3.grid.role = "col";
    obj.button3.grid.width = 12;
    obj.button3:setName("button3");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout23);
    obj.layout25.grid.role = "col";
    obj.layout25.grid.width = 6;
    obj.layout25.grid["auto-height"] = true;
    obj.layout25:setName("layout25");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout25);
    lfm_setPropAsString(obj.rectangle9, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle9.grid.role = "col";
    obj.rectangle9.grid.width = 12;
    obj.rectangle9.grid["auto-height"] = true;
    obj.rectangle9.grid["min-height"] = 40;
    obj.rectangle9.grid["cnt-vert-align"] = "bottom";
    obj.rectangle9:setStrokeColor("#545454");
    obj.rectangle9:setName("rectangle9");
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setXradius(15);
    obj.rectangle9:setYradius(15);
    obj.rectangle9:setStrokeSize(2);
    obj.rectangle9:setColor("#1f1e1e");
    obj.rectangle9.grid["padding-top"] = 5;
    obj.rectangle9.grid["padding-left"] = 8;
    obj.rectangle9.grid["padding-right"] = 8;
    obj.rectangle9.grid["padding-bottom"] = 5;

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle9);
    obj.edit14:setField("atr_max_FOR");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setVertTextAlign("trailing");
    obj.edit14:setTransparent(true);
    obj.edit14.grid.role = "col";
    obj.edit14.grid.width = 12;
    obj.edit14:setFontSize(15);
    obj.edit14:setName("edit14");
    obj.edit14:setHeight(25);

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout25);
    obj.label14:setText("MAX");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setVertTextAlign("trailing");
    obj.label14.grid.role = "col";
    obj.label14.grid.width = 12;
    obj.label14:setFontSize(10);
    obj.label14:setName("label14");
    obj.label14:setFontColor("#b5b5b5");
    obj.label14:setHeight(25);

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.rectangle2);
    obj.horzLine11.grid.role = "row";
    obj.horzLine11.grid["margin-bottom"] = 10;
    obj.horzLine11.grid["margin-top"] = 10;
    obj.horzLine11:setName("horzLine11");
    obj.horzLine11:setStrokeColor("grey");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle2);
    obj.layout26.grid.role = "col";
    obj.layout26.grid.width = 12;
    obj.layout26.grid["auto-height"] = true;
    obj.layout26.grid["max-height"] = 160;
    obj.layout26:setName("layout26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27.grid.role = "col";
    obj.layout27.grid.width = 6;
    obj.layout27.grid["auto-height"] = true;
    obj.layout27:setName("layout27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout27);
    obj.layout28.grid.role = "col";
    obj.layout28.grid.width = 12;
    obj.layout28:setName("layout28");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout27);
    obj.layout29.grid.role = "col";
    obj.layout29.grid.width = 12;
    obj.layout29.grid["auto-height"] = true;
    obj.layout29.grid["cnt-horz-align"] = "middle";
    obj.layout29.grid["cnt-vert-align"] = "bottom";
    obj.layout29:setName("layout29");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout29);
    obj.layout30.grid.role = "col";
    obj.layout30.grid.width = 6;
    obj.layout30.grid["auto-height"] = true;
    obj.layout30:setName("layout30");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout30);
    lfm_setPropAsString(obj.rectangle10, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle10.grid.role = "col";
    obj.rectangle10.grid.width = 12;
    obj.rectangle10.grid["auto-height"] = true;
    obj.rectangle10.grid["min-height"] = 50;
    obj.rectangle10.grid["cnt-vert-align"] = "bottom";
    obj.rectangle10:setStrokeColor("#57373f");
    obj.rectangle10:setName("rectangle10");
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setXradius(15);
    obj.rectangle10:setYradius(15);
    obj.rectangle10:setStrokeSize(2);
    obj.rectangle10:setColor("#1f1e1e");
    obj.rectangle10.grid["padding-top"] = 5;
    obj.rectangle10.grid["padding-left"] = 8;
    obj.rectangle10.grid["padding-right"] = 8;
    obj.rectangle10.grid["padding-bottom"] = 5;

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle10);
    obj.edit15:setField("atr_AGI or 0");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setVertTextAlign("trailing");
    obj.edit15:setTransparent(true);
    obj.edit15.grid.role = "col";
    obj.edit15.grid.width = 12;
    obj.edit15:setFontSize(20);
    obj.edit15:setName("edit15");
    obj.edit15:setHeight(25);

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout30);
    obj.button4:setText("AGI");
    obj.button4:setHorzTextAlign("center");
    obj.button4.grid.role = "col";
    obj.button4.grid.width = 12;
    obj.button4:setName("button4");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout29);
    obj.layout31.grid.role = "col";
    obj.layout31.grid.width = 6;
    obj.layout31.grid["auto-height"] = true;
    obj.layout31:setName("layout31");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout31);
    lfm_setPropAsString(obj.rectangle11, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle11.grid.role = "col";
    obj.rectangle11.grid.width = 12;
    obj.rectangle11.grid["auto-height"] = true;
    obj.rectangle11.grid["min-height"] = 40;
    obj.rectangle11.grid["cnt-vert-align"] = "bottom";
    obj.rectangle11:setStrokeColor("#545454");
    obj.rectangle11:setName("rectangle11");
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setXradius(15);
    obj.rectangle11:setYradius(15);
    obj.rectangle11:setStrokeSize(2);
    obj.rectangle11:setColor("#1f1e1e");
    obj.rectangle11.grid["padding-top"] = 5;
    obj.rectangle11.grid["padding-left"] = 8;
    obj.rectangle11.grid["padding-right"] = 8;
    obj.rectangle11.grid["padding-bottom"] = 5;

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle11);
    obj.edit16:setField("atr_max_AGI");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setVertTextAlign("trailing");
    obj.edit16:setTransparent(true);
    obj.edit16.grid.role = "col";
    obj.edit16.grid.width = 12;
    obj.edit16:setFontSize(15);
    obj.edit16:setName("edit16");
    obj.edit16:setHeight(25);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout31);
    obj.label15:setText("MAX");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setVertTextAlign("trailing");
    obj.label15.grid.role = "col";
    obj.label15.grid.width = 12;
    obj.label15:setFontSize(10);
    obj.label15:setName("label15");
    obj.label15:setFontColor("#b5b5b5");
    obj.label15:setHeight(25);

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout27);
    obj.layout32.grid.role = "col";
    obj.layout32.grid.width = 12;
    obj.layout32:setName("layout32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout26);
    obj.layout33.grid.role = "col";
    obj.layout33.grid.width = 6;
    obj.layout33.grid["auto-height"] = true;
    obj.layout33:setName("layout33");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout33);
    obj.layout34.grid.role = "col";
    obj.layout34.grid.width = 12;
    obj.layout34.grid["auto-height"] = true;
    obj.layout34.grid["cnt-horz-align"] = "middle";
    obj.layout34.grid["cnt-vert-align"] = "bottom";
    obj.layout34:setName("layout34");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout34);
    obj.layout35.grid.role = "col";
    obj.layout35.grid.width = 6;
    obj.layout35.grid["auto-height"] = true;
    obj.layout35:setName("layout35");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout35);
    lfm_setPropAsString(obj.rectangle12, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle12.grid.role = "col";
    obj.rectangle12.grid.width = 12;
    obj.rectangle12.grid["auto-height"] = true;
    obj.rectangle12.grid["min-height"] = 50;
    obj.rectangle12.grid["cnt-vert-align"] = "bottom";
    obj.rectangle12:setStrokeColor("#545454");
    obj.rectangle12:setName("rectangle12");
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setXradius(15);
    obj.rectangle12:setYradius(15);
    obj.rectangle12:setStrokeSize(2);
    obj.rectangle12:setColor("#1f1e1e");
    obj.rectangle12.grid["padding-top"] = 5;
    obj.rectangle12.grid["padding-left"] = 8;
    obj.rectangle12.grid["padding-right"] = 8;
    obj.rectangle12.grid["padding-bottom"] = 5;

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle12);
    obj.edit17:setField("atr_DES or 0");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setVertTextAlign("trailing");
    obj.edit17:setTransparent(true);
    obj.edit17.grid.role = "col";
    obj.edit17.grid.width = 12;
    obj.edit17:setFontSize(20);
    obj.edit17:setName("edit17");
    obj.edit17:setHeight(25);

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout35);
    obj.button5:setText("DES");
    obj.button5:setHorzTextAlign("center");
    obj.button5.grid.role = "col";
    obj.button5.grid.width = 12;
    obj.button5:setName("button5");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout34);
    obj.layout36.grid.role = "col";
    obj.layout36.grid.width = 6;
    obj.layout36.grid["auto-height"] = true;
    obj.layout36:setName("layout36");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout36);
    lfm_setPropAsString(obj.rectangle13, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle13.grid.role = "col";
    obj.rectangle13.grid.width = 12;
    obj.rectangle13.grid["auto-height"] = true;
    obj.rectangle13.grid["min-height"] = 40;
    obj.rectangle13.grid["cnt-vert-align"] = "bottom";
    obj.rectangle13:setStrokeColor("#545454");
    obj.rectangle13:setName("rectangle13");
    obj.rectangle13:setCornerType("round");
    obj.rectangle13:setXradius(15);
    obj.rectangle13:setYradius(15);
    obj.rectangle13:setStrokeSize(2);
    obj.rectangle13:setColor("#1f1e1e");
    obj.rectangle13.grid["padding-top"] = 5;
    obj.rectangle13.grid["padding-left"] = 8;
    obj.rectangle13.grid["padding-right"] = 8;
    obj.rectangle13.grid["padding-bottom"] = 5;

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle13);
    obj.edit18:setField("atr_max_DES");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setVertTextAlign("trailing");
    obj.edit18:setTransparent(true);
    obj.edit18.grid.role = "col";
    obj.edit18.grid.width = 12;
    obj.edit18:setFontSize(15);
    obj.edit18:setName("edit18");
    obj.edit18:setHeight(25);

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout36);
    obj.label16:setText("MAX");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setVertTextAlign("trailing");
    obj.label16.grid.role = "col";
    obj.label16.grid.width = 12;
    obj.label16:setFontSize(10);
    obj.label16:setName("label16");
    obj.label16:setFontColor("#b5b5b5");
    obj.label16:setHeight(25);

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout33);
    obj.layout37.grid.role = "col";
    obj.layout37.grid.width = 12;
    obj.layout37.grid["auto-height"] = true;
    obj.layout37.grid["cnt-horz-align"] = "middle";
    obj.layout37.grid["cnt-vert-align"] = "bottom";
    obj.layout37:setName("layout37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout37);
    obj.layout38.grid.role = "col";
    obj.layout38.grid.width = 6;
    obj.layout38.grid["auto-height"] = true;
    obj.layout38:setName("layout38");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout38);
    lfm_setPropAsString(obj.rectangle14, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle14.grid.role = "col";
    obj.rectangle14.grid.width = 12;
    obj.rectangle14.grid["auto-height"] = true;
    obj.rectangle14.grid["min-height"] = 50;
    obj.rectangle14.grid["cnt-vert-align"] = "bottom";
    obj.rectangle14:setStrokeColor("#545454");
    obj.rectangle14:setName("rectangle14");
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setXradius(15);
    obj.rectangle14:setYradius(15);
    obj.rectangle14:setStrokeSize(2);
    obj.rectangle14:setColor("#1f1e1e");
    obj.rectangle14.grid["padding-top"] = 5;
    obj.rectangle14.grid["padding-left"] = 8;
    obj.rectangle14.grid["padding-right"] = 8;
    obj.rectangle14.grid["padding-bottom"] = 5;

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle14);
    obj.edit19:setField("atr_MAE or 0");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setVertTextAlign("trailing");
    obj.edit19:setTransparent(true);
    obj.edit19.grid.role = "col";
    obj.edit19.grid.width = 12;
    obj.edit19:setFontSize(20);
    obj.edit19:setName("edit19");
    obj.edit19:setHeight(25);

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout38);
    obj.button6:setText("MAE");
    obj.button6:setHorzTextAlign("center");
    obj.button6.grid.role = "col";
    obj.button6.grid.width = 12;
    obj.button6:setName("button6");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout37);
    obj.layout39.grid.role = "col";
    obj.layout39.grid.width = 6;
    obj.layout39.grid["auto-height"] = true;
    obj.layout39:setName("layout39");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout39);
    lfm_setPropAsString(obj.rectangle15, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle15.grid.role = "col";
    obj.rectangle15.grid.width = 12;
    obj.rectangle15.grid["auto-height"] = true;
    obj.rectangle15.grid["min-height"] = 40;
    obj.rectangle15.grid["cnt-vert-align"] = "bottom";
    obj.rectangle15:setStrokeColor("#545454");
    obj.rectangle15:setName("rectangle15");
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setXradius(15);
    obj.rectangle15:setYradius(15);
    obj.rectangle15:setStrokeSize(2);
    obj.rectangle15:setColor("#1f1e1e");
    obj.rectangle15.grid["padding-top"] = 5;
    obj.rectangle15.grid["padding-left"] = 8;
    obj.rectangle15.grid["padding-right"] = 8;
    obj.rectangle15.grid["padding-bottom"] = 5;

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle15);
    obj.edit20:setField("atr_max_MAE");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setVertTextAlign("trailing");
    obj.edit20:setTransparent(true);
    obj.edit20.grid.role = "col";
    obj.edit20.grid.width = 12;
    obj.edit20:setFontSize(15);
    obj.edit20:setName("edit20");
    obj.edit20:setHeight(25);

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout39);
    obj.label17:setText("MAX");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setVertTextAlign("trailing");
    obj.label17.grid.role = "col";
    obj.label17.grid.width = 12;
    obj.label17:setFontSize(10);
    obj.label17:setName("label17");
    obj.label17:setFontColor("#b5b5b5");
    obj.label17:setHeight(25);

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.rectangle2);
    obj.horzLine12.grid.role = "row";
    obj.horzLine12.grid["margin-bottom"] = 10;
    obj.horzLine12.grid["margin-top"] = 10;
    obj.horzLine12:setName("horzLine12");
    obj.horzLine12:setStrokeColor("grey");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle2);
    obj.layout40.grid.role = "col";
    obj.layout40.grid.width = 12;
    obj.layout40.grid["auto-height"] = true;
    obj.layout40.grid["max-height"] = 160;
    obj.layout40:setName("layout40");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41.grid.role = "col";
    obj.layout41.grid.width = 6;
    obj.layout41.grid["auto-height"] = true;
    obj.layout41:setName("layout41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout41);
    obj.layout42.grid.role = "col";
    obj.layout42.grid.width = 12;
    obj.layout42:setName("layout42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout41);
    obj.layout43.grid.role = "col";
    obj.layout43.grid.width = 12;
    obj.layout43.grid["auto-height"] = true;
    obj.layout43.grid["cnt-horz-align"] = "middle";
    obj.layout43.grid["cnt-vert-align"] = "bottom";
    obj.layout43:setName("layout43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44.grid.role = "col";
    obj.layout44.grid.width = 6;
    obj.layout44.grid["auto-height"] = true;
    obj.layout44:setName("layout44");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout44);
    lfm_setPropAsString(obj.rectangle16, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle16.grid.role = "col";
    obj.rectangle16.grid.width = 12;
    obj.rectangle16.grid["auto-height"] = true;
    obj.rectangle16.grid["min-height"] = 50;
    obj.rectangle16.grid["cnt-vert-align"] = "bottom";
    obj.rectangle16:setStrokeColor("#475737");
    obj.rectangle16:setName("rectangle16");
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setXradius(15);
    obj.rectangle16:setYradius(15);
    obj.rectangle16:setStrokeSize(2);
    obj.rectangle16:setColor("#1f1e1e");
    obj.rectangle16.grid["padding-top"] = 5;
    obj.rectangle16.grid["padding-left"] = 8;
    obj.rectangle16.grid["padding-right"] = 8;
    obj.rectangle16.grid["padding-bottom"] = 5;

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle16);
    obj.edit21:setField("atr_INT or 0");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setVertTextAlign("trailing");
    obj.edit21:setTransparent(true);
    obj.edit21.grid.role = "col";
    obj.edit21.grid.width = 12;
    obj.edit21:setFontSize(20);
    obj.edit21:setName("edit21");
    obj.edit21:setHeight(25);

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout44);
    obj.button7:setText("INT");
    obj.button7:setHorzTextAlign("center");
    obj.button7.grid.role = "col";
    obj.button7.grid.width = 12;
    obj.button7:setName("button7");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout43);
    obj.layout45.grid.role = "col";
    obj.layout45.grid.width = 6;
    obj.layout45.grid["auto-height"] = true;
    obj.layout45:setName("layout45");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout45);
    lfm_setPropAsString(obj.rectangle17, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle17.grid.role = "col";
    obj.rectangle17.grid.width = 12;
    obj.rectangle17.grid["auto-height"] = true;
    obj.rectangle17.grid["min-height"] = 40;
    obj.rectangle17.grid["cnt-vert-align"] = "bottom";
    obj.rectangle17:setStrokeColor("#545454");
    obj.rectangle17:setName("rectangle17");
    obj.rectangle17:setCornerType("round");
    obj.rectangle17:setXradius(15);
    obj.rectangle17:setYradius(15);
    obj.rectangle17:setStrokeSize(2);
    obj.rectangle17:setColor("#1f1e1e");
    obj.rectangle17.grid["padding-top"] = 5;
    obj.rectangle17.grid["padding-left"] = 8;
    obj.rectangle17.grid["padding-right"] = 8;
    obj.rectangle17.grid["padding-bottom"] = 5;

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle17);
    obj.edit22:setField("atr_max_INT");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setVertTextAlign("trailing");
    obj.edit22:setTransparent(true);
    obj.edit22.grid.role = "col";
    obj.edit22.grid.width = 12;
    obj.edit22:setFontSize(15);
    obj.edit22:setName("edit22");
    obj.edit22:setHeight(25);

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout45);
    obj.label18:setText("MAX");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setVertTextAlign("trailing");
    obj.label18.grid.role = "col";
    obj.label18.grid.width = 12;
    obj.label18:setFontSize(10);
    obj.label18:setName("label18");
    obj.label18:setFontColor("#b5b5b5");
    obj.label18:setHeight(25);

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout41);
    obj.layout46.grid.role = "col";
    obj.layout46.grid.width = 12;
    obj.layout46:setName("layout46");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout40);
    obj.layout47.grid.role = "col";
    obj.layout47.grid.width = 6;
    obj.layout47.grid["auto-height"] = true;
    obj.layout47:setName("layout47");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout47);
    obj.layout48.grid.role = "col";
    obj.layout48.grid.width = 12;
    obj.layout48.grid["auto-height"] = true;
    obj.layout48.grid["cnt-horz-align"] = "middle";
    obj.layout48.grid["cnt-vert-align"] = "bottom";
    obj.layout48:setName("layout48");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout48);
    obj.layout49.grid.role = "col";
    obj.layout49.grid.width = 6;
    obj.layout49.grid["auto-height"] = true;
    obj.layout49:setName("layout49");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout49);
    lfm_setPropAsString(obj.rectangle18, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle18.grid.role = "col";
    obj.rectangle18.grid.width = 12;
    obj.rectangle18.grid["auto-height"] = true;
    obj.rectangle18.grid["min-height"] = 50;
    obj.rectangle18.grid["cnt-vert-align"] = "bottom";
    obj.rectangle18:setStrokeColor("#545454");
    obj.rectangle18:setName("rectangle18");
    obj.rectangle18:setCornerType("round");
    obj.rectangle18:setXradius(15);
    obj.rectangle18:setYradius(15);
    obj.rectangle18:setStrokeSize(2);
    obj.rectangle18:setColor("#1f1e1e");
    obj.rectangle18.grid["padding-top"] = 5;
    obj.rectangle18.grid["padding-left"] = 8;
    obj.rectangle18.grid["padding-right"] = 8;
    obj.rectangle18.grid["padding-bottom"] = 5;

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle18);
    obj.edit23:setField("atr_ARC or 0");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setVertTextAlign("trailing");
    obj.edit23:setTransparent(true);
    obj.edit23.grid.role = "col";
    obj.edit23.grid.width = 12;
    obj.edit23:setFontSize(20);
    obj.edit23:setName("edit23");
    obj.edit23:setHeight(25);

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout49);
    obj.button8:setText("ARC");
    obj.button8:setHorzTextAlign("center");
    obj.button8.grid.role = "col";
    obj.button8.grid.width = 12;
    obj.button8:setName("button8");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout48);
    obj.layout50.grid.role = "col";
    obj.layout50.grid.width = 6;
    obj.layout50.grid["auto-height"] = true;
    obj.layout50:setName("layout50");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout50);
    lfm_setPropAsString(obj.rectangle19, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle19.grid.role = "col";
    obj.rectangle19.grid.width = 12;
    obj.rectangle19.grid["auto-height"] = true;
    obj.rectangle19.grid["min-height"] = 40;
    obj.rectangle19.grid["cnt-vert-align"] = "bottom";
    obj.rectangle19:setStrokeColor("#545454");
    obj.rectangle19:setName("rectangle19");
    obj.rectangle19:setCornerType("round");
    obj.rectangle19:setXradius(15);
    obj.rectangle19:setYradius(15);
    obj.rectangle19:setStrokeSize(2);
    obj.rectangle19:setColor("#1f1e1e");
    obj.rectangle19.grid["padding-top"] = 5;
    obj.rectangle19.grid["padding-left"] = 8;
    obj.rectangle19.grid["padding-right"] = 8;
    obj.rectangle19.grid["padding-bottom"] = 5;

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle19);
    obj.edit24:setField("atr_max_ARC");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setVertTextAlign("trailing");
    obj.edit24:setTransparent(true);
    obj.edit24.grid.role = "col";
    obj.edit24.grid.width = 12;
    obj.edit24:setFontSize(15);
    obj.edit24:setName("edit24");
    obj.edit24:setHeight(25);

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout50);
    obj.label19:setText("MAX");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setVertTextAlign("trailing");
    obj.label19.grid.role = "col";
    obj.label19.grid.width = 12;
    obj.label19:setFontSize(10);
    obj.label19:setName("label19");
    obj.label19:setFontColor("#b5b5b5");
    obj.label19:setHeight(25);

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout47);
    obj.layout51.grid.role = "col";
    obj.layout51.grid.width = 12;
    obj.layout51.grid["auto-height"] = true;
    obj.layout51.grid["cnt-horz-align"] = "middle";
    obj.layout51.grid["cnt-vert-align"] = "bottom";
    obj.layout51:setName("layout51");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout51);
    obj.layout52.grid.role = "col";
    obj.layout52.grid.width = 6;
    obj.layout52.grid["auto-height"] = true;
    obj.layout52:setName("layout52");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout52);
    lfm_setPropAsString(obj.rectangle20, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle20.grid.role = "col";
    obj.rectangle20.grid.width = 12;
    obj.rectangle20.grid["auto-height"] = true;
    obj.rectangle20.grid["min-height"] = 50;
    obj.rectangle20.grid["cnt-vert-align"] = "bottom";
    obj.rectangle20:setStrokeColor("#545454");
    obj.rectangle20:setName("rectangle20");
    obj.rectangle20:setCornerType("round");
    obj.rectangle20:setXradius(15);
    obj.rectangle20:setYradius(15);
    obj.rectangle20:setStrokeSize(2);
    obj.rectangle20:setColor("#1f1e1e");
    obj.rectangle20.grid["padding-top"] = 5;
    obj.rectangle20.grid["padding-left"] = 8;
    obj.rectangle20.grid["padding-right"] = 8;
    obj.rectangle20.grid["padding-bottom"] = 5;

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.rectangle20);
    obj.edit25:setField("atr_PER or 0");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setVertTextAlign("trailing");
    obj.edit25:setTransparent(true);
    obj.edit25.grid.role = "col";
    obj.edit25.grid.width = 12;
    obj.edit25:setFontSize(20);
    obj.edit25:setName("edit25");
    obj.edit25:setHeight(25);

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout52);
    obj.button9:setText("PER");
    obj.button9:setHorzTextAlign("center");
    obj.button9.grid.role = "col";
    obj.button9.grid.width = 12;
    obj.button9:setName("button9");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout51);
    obj.layout53.grid.role = "col";
    obj.layout53.grid.width = 6;
    obj.layout53.grid["auto-height"] = true;
    obj.layout53:setName("layout53");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout53);
    lfm_setPropAsString(obj.rectangle21, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle21.grid.role = "col";
    obj.rectangle21.grid.width = 12;
    obj.rectangle21.grid["auto-height"] = true;
    obj.rectangle21.grid["min-height"] = 40;
    obj.rectangle21.grid["cnt-vert-align"] = "bottom";
    obj.rectangle21:setStrokeColor("#545454");
    obj.rectangle21:setName("rectangle21");
    obj.rectangle21:setCornerType("round");
    obj.rectangle21:setXradius(15);
    obj.rectangle21:setYradius(15);
    obj.rectangle21:setStrokeSize(2);
    obj.rectangle21:setColor("#1f1e1e");
    obj.rectangle21.grid["padding-top"] = 5;
    obj.rectangle21.grid["padding-left"] = 8;
    obj.rectangle21.grid["padding-right"] = 8;
    obj.rectangle21.grid["padding-bottom"] = 5;

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.rectangle21);
    obj.edit26:setField("atr_max_PER");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setVertTextAlign("trailing");
    obj.edit26:setTransparent(true);
    obj.edit26.grid.role = "col";
    obj.edit26.grid.width = 12;
    obj.edit26:setFontSize(15);
    obj.edit26:setName("edit26");
    obj.edit26:setHeight(25);

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout53);
    obj.label20:setText("MAX");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setVertTextAlign("trailing");
    obj.label20.grid.role = "col";
    obj.label20.grid.width = 12;
    obj.label20:setFontSize(10);
    obj.label20:setName("label20");
    obj.label20:setFontColor("#b5b5b5");
    obj.label20:setHeight(25);

    obj.horzLine13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine13:setParent(obj.rectangle2);
    obj.horzLine13.grid.role = "row";
    obj.horzLine13.grid["margin-bottom"] = 10;
    obj.horzLine13.grid["margin-top"] = 10;
    obj.horzLine13:setName("horzLine13");
    obj.horzLine13:setStrokeColor("grey");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle2);
    obj.layout54.grid.role = "col";
    obj.layout54.grid.width = 4;
    obj.layout54:setName("layout54");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle2);
    obj.layout55.grid.role = "col";
    obj.layout55.grid.width = 4;
    obj.layout55.grid["auto-height"] = true;
    obj.layout55.grid["cnt-horz-align"] = "middle";
    obj.layout55.grid["cnt-vert-align"] = "bottom";
    obj.layout55:setName("layout55");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout55);
    lfm_setPropAsString(obj.rectangle22, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle22.grid.role = "col";
    obj.rectangle22.grid.width = 12;
    obj.rectangle22.grid["auto-height"] = true;
    obj.rectangle22.grid["min-width"] = 30;
    obj.rectangle22:setName("rectangle22");
    obj.rectangle22:setCornerType("round");
    obj.rectangle22:setXradius(15);
    obj.rectangle22:setYradius(15);
    obj.rectangle22:setStrokeColor("#343434");
    obj.rectangle22:setStrokeSize(2);
    obj.rectangle22:setColor("#1f1e1e");
    obj.rectangle22.grid["padding-top"] = 5;
    obj.rectangle22.grid["padding-left"] = 8;
    obj.rectangle22.grid["padding-right"] = 8;
    obj.rectangle22.grid["padding-bottom"] = 5;

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle22);
    obj.edit27:setField("cam_VONTADE or 0");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setTransparent(true);
    obj.edit27.grid.role = "col";
    obj.edit27.grid.width = 12;
    obj.edit27:setFontSize(20);
    obj.edit27:setName("edit27");
    obj.edit27:setHeight(25);

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout55);
    obj.button10:setText("VONTADE");
    obj.button10:setHorzTextAlign("center");
    obj.button10.grid.role = "col";
    obj.button10.grid.width = 12;
    obj.button10:setFontSize(15);
    obj.button10:setName("button10");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle2);
    obj.layout56.grid.role = "col";
    obj.layout56.grid.width = 4;
    obj.layout56:setName("layout56");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout1);
    obj.layout57.grid.role = "col";
    obj.layout57.grid.width = 5;
    obj.layout57.grid["auto-height"] = true;
    obj.layout57.grid["cnt-gutter"] = 5;
    obj.layout57.grid["cnt-vert-align"] = "center";
    obj.layout57:setName("layout57");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout57);
    obj.rectangle23.grid.role = "col";
    obj.rectangle23.grid.width = 12;
    obj.rectangle23.grid["auto-height"] = true;
    obj.rectangle23.grid["margin-bottom"] = 5;
    obj.rectangle23:setName("rectangle23");
    lfm_setPropAsString(obj.rectangle23, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle23:setCornerType("round");
    obj.rectangle23:setXradius(15);
    obj.rectangle23:setYradius(15);
    obj.rectangle23:setStrokeColor("#343434");
    obj.rectangle23:setStrokeSize(2);
    obj.rectangle23:setColor("#1f1e1e");
    obj.rectangle23.grid["padding-top"] = 5;
    obj.rectangle23.grid["padding-left"] = 8;
    obj.rectangle23.grid["padding-right"] = 8;
    obj.rectangle23.grid["padding-bottom"] = 5;

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.rectangle23);
    obj.rectangle24:setColor("grey");
    obj.rectangle24:setXradius(0);
    obj.rectangle24:setYradius(0);
    obj.rectangle24.grid.role = "row";
    obj.rectangle24.grid.width = 12;
    obj.rectangle24.grid["cnt-vert-align"] = "center";
    obj.rectangle24.grid["max-height"] = 23;
    obj.rectangle24.grid["margin-bottom"] = 5;
    obj.rectangle24.grid["margin-top"] = -5;
    obj.rectangle24.grid["margin-left"] = -5;
    obj.rectangle24.grid["margin-right"] = -5;
    obj.rectangle24:setName("rectangle24");
    lfm_setPropAsString(obj.rectangle24, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle24:setCornerType("round");
    obj.rectangle24:setStrokeColor("#343434");
    obj.rectangle24:setStrokeSize(2);
    obj.rectangle24.grid["padding-top"] = 5;
    obj.rectangle24.grid["padding-left"] = 8;
    obj.rectangle24.grid["padding-right"] = 8;
    obj.rectangle24.grid["padding-bottom"] = 5;

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle24);
    obj.label21:setText("CORPO-A-CORPO");
    obj.label21:setHorzTextAlign("leading");
    obj.label21:setFontSize(15);
    lfm_setPropAsString(obj.label21, "fontStyle", "bold");
    obj.label21.grid.role = "col";
    obj.label21:setFontColor("black");
    obj.label21.grid["dyn-width-txt"] = true;
    obj.label21:setName("label21");
    obj.label21:setHeight(25);

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle23);
    obj.layout58.grid.role = "col";
    obj.layout58.grid.width = 12;
    obj.layout58.grid["auto-height"] = true;
    obj.layout58.grid["padding-bottom"] = 5;
    obj.layout58:setName("layout58");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout58);
    obj.button11:setText("⚔️");
    obj.button11.grid.role = "col";
    obj.button11.grid.width = 1;
    obj.button11.grid["min-height"] = 20;
    obj.button11:setFontSize(20);
    obj.button11:setName("button11");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout58);
    obj.layout59.grid.role = "col";
    obj.layout59.grid.width = 3;
    obj.layout59:setName("layout59");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout59);
    obj.edit28:setField("info_Arma1");
    obj.edit28.grid.role = "col";
    obj.edit28.grid.width = 12;
    obj.edit28:setTransparent(true);
    obj.edit28:setName("edit28");
    obj.edit28:setHeight(25);

    obj.horzLine14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine14:setParent(obj.layout59);
    obj.horzLine14:setStrokeColor("gray");
    obj.horzLine14.grid.role = "col";
    obj.horzLine14.grid.width = 12;
    obj.horzLine14:setName("horzLine14");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout59);
    obj.label22:setText("Arma1");
    obj.label22.grid.role = "col";
    obj.label22.grid.width = 12;
    obj.label22:setHorzTextAlign("leading");
    obj.label22:setName("label22");
    obj.label22:setFontColor("#b5b5b5");
    obj.label22:setHeight(25);

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout58);
    obj.layout60.grid.role = "col";
    obj.layout60.grid.width = 3;
    obj.layout60:setName("layout60");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout60);
    obj.edit29:setField("info_Notas1");
    obj.edit29.grid.role = "col";
    obj.edit29.grid.width = 12;
    obj.edit29:setTransparent(true);
    obj.edit29:setName("edit29");
    obj.edit29:setHeight(25);

    obj.horzLine15 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine15:setParent(obj.layout60);
    obj.horzLine15:setStrokeColor("gray");
    obj.horzLine15.grid.role = "col";
    obj.horzLine15.grid.width = 12;
    obj.horzLine15:setName("horzLine15");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout60);
    obj.label23:setText("Notas1");
    obj.label23.grid.role = "col";
    obj.label23.grid.width = 12;
    obj.label23:setHorzTextAlign("leading");
    obj.label23:setName("label23");
    obj.label23:setFontColor("#b5b5b5");
    obj.label23:setHeight(25);

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout58);
    obj.layout61.grid.role = "col";
    obj.layout61.grid.width = 2;
    obj.layout61.grid["auto-height"] = true;
    obj.layout61.grid["cnt-horz-align"] = "middle";
    obj.layout61.grid["min-width"] = 35;
    obj.layout61:setName("layout61");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout61);
    lfm_setPropAsString(obj.rectangle25, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle25.grid.role = "col";
    obj.rectangle25.grid.width = 12;
    obj.rectangle25.grid["auto-height"] = true;
    obj.rectangle25:setXradius(10);
    obj.rectangle25:setYradius(10);
    obj.rectangle25:setCornerType("bevel");
    obj.rectangle25.grid["min-height"] = 30;
    obj.rectangle25.grid["margin-bottom"] = 0;
    obj.rectangle25:setName("rectangle25");
    obj.rectangle25:setStrokeColor("#343434");
    obj.rectangle25:setStrokeSize(2);
    obj.rectangle25:setColor("#1f1e1e");
    obj.rectangle25.grid["padding-top"] = 5;
    obj.rectangle25.grid["padding-left"] = 8;
    obj.rectangle25.grid["padding-right"] = 8;
    obj.rectangle25.grid["padding-bottom"] = 5;

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle25);
    obj.edit30:setField("cam_ACO");
    obj.edit30:setTransparent(true);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setVertTextAlign("center");
    obj.edit30.grid.role = "col";
    obj.edit30.grid.width = 12;
    obj.edit30:setFontSize(15);
    obj.edit30:setName("edit30");
    obj.edit30:setHeight(25);

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout61);
    obj.label24:setText("ACO");
    obj.label24:setVertTextAlign("trailing");
    obj.label24:setHorzTextAlign("center");
    obj.label24.grid.role = "col";
    obj.label24.grid.width = 12;
    obj.label24:setFontSize(10);
    obj.label24:setTextTrimming("none");
    obj.label24:setWordWrap(true);
    obj.label24:setName("label24");
    obj.label24:setFontColor("#b5b5b5");
    obj.label24:setHeight(25);

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout58);
    obj.layout62.grid.role = "col";
    obj.layout62.grid.width = 2;
    obj.layout62.grid["auto-height"] = true;
    obj.layout62.grid["cnt-horz-align"] = "middle";
    obj.layout62.grid["min-width"] = 35;
    obj.layout62:setName("layout62");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout62);
    lfm_setPropAsString(obj.rectangle26, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle26.grid.role = "col";
    obj.rectangle26.grid.width = 12;
    obj.rectangle26.grid["auto-height"] = true;
    obj.rectangle26:setXradius(10);
    obj.rectangle26:setYradius(10);
    obj.rectangle26:setCornerType("bevel");
    obj.rectangle26.grid["min-height"] = 30;
    obj.rectangle26.grid["margin-bottom"] = 0;
    obj.rectangle26:setName("rectangle26");
    obj.rectangle26:setStrokeColor("#343434");
    obj.rectangle26:setStrokeSize(2);
    obj.rectangle26:setColor("#1f1e1e");
    obj.rectangle26.grid["padding-top"] = 5;
    obj.rectangle26.grid["padding-left"] = 8;
    obj.rectangle26.grid["padding-right"] = 8;
    obj.rectangle26.grid["padding-bottom"] = 5;

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle26);
    obj.edit31:setField("cam_POD+FOR");
    obj.edit31:setTransparent(true);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setVertTextAlign("center");
    obj.edit31.grid.role = "col";
    obj.edit31.grid.width = 12;
    obj.edit31:setFontSize(15);
    obj.edit31:setName("edit31");
    obj.edit31:setHeight(25);

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout62);
    obj.label25:setText("POD+FOR");
    obj.label25:setVertTextAlign("trailing");
    obj.label25:setHorzTextAlign("center");
    obj.label25.grid.role = "col";
    obj.label25.grid.width = 12;
    obj.label25:setFontSize(10);
    obj.label25:setTextTrimming("none");
    obj.label25:setWordWrap(true);
    obj.label25:setName("label25");
    obj.label25:setFontColor("#b5b5b5");
    obj.label25:setHeight(25);

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle23);
    obj.layout63.grid.role = "col";
    obj.layout63.grid.width = 12;
    obj.layout63.grid["auto-height"] = true;
    obj.layout63.grid["padding-bottom"] = 5;
    obj.layout63:setName("layout63");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout63);
    obj.button12:setText("⚔️");
    obj.button12.grid.role = "col";
    obj.button12.grid.width = 1;
    obj.button12.grid["min-height"] = 20;
    obj.button12:setFontSize(20);
    obj.button12:setName("button12");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout63);
    obj.layout64.grid.role = "col";
    obj.layout64.grid.width = 3;
    obj.layout64:setName("layout64");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout64);
    obj.edit32:setField("info_Arma1");
    obj.edit32.grid.role = "col";
    obj.edit32.grid.width = 12;
    obj.edit32:setTransparent(true);
    obj.edit32:setName("edit32");
    obj.edit32:setHeight(25);

    obj.horzLine16 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine16:setParent(obj.layout64);
    obj.horzLine16:setStrokeColor("gray");
    obj.horzLine16.grid.role = "col";
    obj.horzLine16.grid.width = 12;
    obj.horzLine16:setName("horzLine16");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout64);
    obj.label26:setText("Arma1");
    obj.label26.grid.role = "col";
    obj.label26.grid.width = 12;
    obj.label26:setHorzTextAlign("leading");
    obj.label26:setName("label26");
    obj.label26:setFontColor("#b5b5b5");
    obj.label26:setHeight(25);

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout63);
    obj.layout65.grid.role = "col";
    obj.layout65.grid.width = 3;
    obj.layout65:setName("layout65");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout65);
    obj.edit33:setField("info_Notas1");
    obj.edit33.grid.role = "col";
    obj.edit33.grid.width = 12;
    obj.edit33:setTransparent(true);
    obj.edit33:setName("edit33");
    obj.edit33:setHeight(25);

    obj.horzLine17 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine17:setParent(obj.layout65);
    obj.horzLine17:setStrokeColor("gray");
    obj.horzLine17.grid.role = "col";
    obj.horzLine17.grid.width = 12;
    obj.horzLine17:setName("horzLine17");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout65);
    obj.label27:setText("Notas1");
    obj.label27.grid.role = "col";
    obj.label27.grid.width = 12;
    obj.label27:setHorzTextAlign("leading");
    obj.label27:setName("label27");
    obj.label27:setFontColor("#b5b5b5");
    obj.label27:setHeight(25);

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout63);
    obj.layout66.grid.role = "col";
    obj.layout66.grid.width = 2;
    obj.layout66.grid["auto-height"] = true;
    obj.layout66.grid["cnt-horz-align"] = "middle";
    obj.layout66.grid["min-width"] = 35;
    obj.layout66:setName("layout66");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout66);
    lfm_setPropAsString(obj.rectangle27, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle27.grid.role = "col";
    obj.rectangle27.grid.width = 12;
    obj.rectangle27.grid["auto-height"] = true;
    obj.rectangle27:setXradius(10);
    obj.rectangle27:setYradius(10);
    obj.rectangle27:setCornerType("bevel");
    obj.rectangle27.grid["min-height"] = 30;
    obj.rectangle27.grid["margin-bottom"] = 0;
    obj.rectangle27:setName("rectangle27");
    obj.rectangle27:setStrokeColor("#343434");
    obj.rectangle27:setStrokeSize(2);
    obj.rectangle27:setColor("#1f1e1e");
    obj.rectangle27.grid["padding-top"] = 5;
    obj.rectangle27.grid["padding-left"] = 8;
    obj.rectangle27.grid["padding-right"] = 8;
    obj.rectangle27.grid["padding-bottom"] = 5;

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle27);
    obj.edit34:setField("cam_ACO");
    obj.edit34:setTransparent(true);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setVertTextAlign("center");
    obj.edit34.grid.role = "col";
    obj.edit34.grid.width = 12;
    obj.edit34:setFontSize(15);
    obj.edit34:setName("edit34");
    obj.edit34:setHeight(25);

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout66);
    obj.label28:setText("ACO");
    obj.label28:setVertTextAlign("trailing");
    obj.label28:setHorzTextAlign("center");
    obj.label28.grid.role = "col";
    obj.label28.grid.width = 12;
    obj.label28:setFontSize(10);
    obj.label28:setTextTrimming("none");
    obj.label28:setWordWrap(true);
    obj.label28:setName("label28");
    obj.label28:setFontColor("#b5b5b5");
    obj.label28:setHeight(25);

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout63);
    obj.layout67.grid.role = "col";
    obj.layout67.grid.width = 2;
    obj.layout67.grid["auto-height"] = true;
    obj.layout67.grid["cnt-horz-align"] = "middle";
    obj.layout67.grid["min-width"] = 35;
    obj.layout67:setName("layout67");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout67);
    lfm_setPropAsString(obj.rectangle28, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle28.grid.role = "col";
    obj.rectangle28.grid.width = 12;
    obj.rectangle28.grid["auto-height"] = true;
    obj.rectangle28:setXradius(10);
    obj.rectangle28:setYradius(10);
    obj.rectangle28:setCornerType("bevel");
    obj.rectangle28.grid["min-height"] = 30;
    obj.rectangle28.grid["margin-bottom"] = 0;
    obj.rectangle28:setName("rectangle28");
    obj.rectangle28:setStrokeColor("#343434");
    obj.rectangle28:setStrokeSize(2);
    obj.rectangle28:setColor("#1f1e1e");
    obj.rectangle28.grid["padding-top"] = 5;
    obj.rectangle28.grid["padding-left"] = 8;
    obj.rectangle28.grid["padding-right"] = 8;
    obj.rectangle28.grid["padding-bottom"] = 5;

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle28);
    obj.edit35:setField("cam_POD+FOR");
    obj.edit35:setTransparent(true);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setVertTextAlign("center");
    obj.edit35.grid.role = "col";
    obj.edit35.grid.width = 12;
    obj.edit35:setFontSize(15);
    obj.edit35:setName("edit35");
    obj.edit35:setHeight(25);

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout67);
    obj.label29:setText("POD+FOR");
    obj.label29:setVertTextAlign("trailing");
    obj.label29:setHorzTextAlign("center");
    obj.label29.grid.role = "col";
    obj.label29.grid.width = 12;
    obj.label29:setFontSize(10);
    obj.label29:setTextTrimming("none");
    obj.label29:setWordWrap(true);
    obj.label29:setName("label29");
    obj.label29:setFontColor("#b5b5b5");
    obj.label29:setHeight(25);

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout57);
    obj.rectangle29.grid.role = "col";
    obj.rectangle29.grid.width = 12;
    obj.rectangle29.grid["auto-height"] = true;
    obj.rectangle29.grid["margin-bottom"] = 10;
    obj.rectangle29:setName("rectangle29");
    lfm_setPropAsString(obj.rectangle29, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setXradius(15);
    obj.rectangle29:setYradius(15);
    obj.rectangle29:setStrokeColor("#343434");
    obj.rectangle29:setStrokeSize(2);
    obj.rectangle29:setColor("#1f1e1e");
    obj.rectangle29.grid["padding-top"] = 5;
    obj.rectangle29.grid["padding-left"] = 8;
    obj.rectangle29.grid["padding-right"] = 8;
    obj.rectangle29.grid["padding-bottom"] = 5;

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.rectangle29);
    obj.rectangle30:setColor("grey");
    obj.rectangle30:setXradius(0);
    obj.rectangle30:setYradius(0);
    obj.rectangle30.grid.role = "row";
    obj.rectangle30.grid.width = 12;
    obj.rectangle30.grid["cnt-vert-align"] = "center";
    obj.rectangle30.grid["max-height"] = 23;
    obj.rectangle30.grid["margin-bottom"] = 5;
    obj.rectangle30.grid["margin-top"] = -5;
    obj.rectangle30.grid["margin-left"] = -5;
    obj.rectangle30.grid["margin-right"] = -5;
    obj.rectangle30:setName("rectangle30");
    lfm_setPropAsString(obj.rectangle30, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle30:setCornerType("round");
    obj.rectangle30:setStrokeColor("#343434");
    obj.rectangle30:setStrokeSize(2);
    obj.rectangle30.grid["padding-top"] = 5;
    obj.rectangle30.grid["padding-left"] = 8;
    obj.rectangle30.grid["padding-right"] = 8;
    obj.rectangle30.grid["padding-bottom"] = 5;

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle30);
    obj.label30:setText("ATAQUE À DISTÂNCIA");
    obj.label30:setHorzTextAlign("leading");
    obj.label30:setFontSize(15);
    lfm_setPropAsString(obj.label30, "fontStyle", "bold");
    obj.label30.grid.role = "col";
    obj.label30:setFontColor("black");
    obj.label30.grid["dyn-width-txt"] = true;
    obj.label30:setName("label30");
    obj.label30:setHeight(25);

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle29);
    obj.layout68.grid.role = "col";
    obj.layout68.grid.width = 12;
    obj.layout68.grid["auto-height"] = true;
    obj.layout68.grid["padding-bottom"] = 5;
    obj.layout68:setName("layout68");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout68);
    obj.button13:setText("🏹");
    obj.button13.grid.role = "col";
    obj.button13.grid.width = 1;
    obj.button13.grid["min-height"] = 20;
    obj.button13:setFontSize(20);
    obj.button13:setName("button13");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout68);
    obj.layout69.grid.role = "col";
    obj.layout69.grid.width = 3;
    obj.layout69:setName("layout69");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout69);
    obj.edit36:setField("info_Arma1");
    obj.edit36.grid.role = "col";
    obj.edit36.grid.width = 12;
    obj.edit36:setTransparent(true);
    obj.edit36:setName("edit36");
    obj.edit36:setHeight(25);

    obj.horzLine18 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine18:setParent(obj.layout69);
    obj.horzLine18:setStrokeColor("gray");
    obj.horzLine18.grid.role = "col";
    obj.horzLine18.grid.width = 12;
    obj.horzLine18:setName("horzLine18");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout69);
    obj.label31:setText("Arma1");
    obj.label31.grid.role = "col";
    obj.label31.grid.width = 12;
    obj.label31:setHorzTextAlign("leading");
    obj.label31:setName("label31");
    obj.label31:setFontColor("#b5b5b5");
    obj.label31:setHeight(25);

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout68);
    obj.layout70.grid.role = "col";
    obj.layout70.grid.width = 2;
    obj.layout70:setName("layout70");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout70);
    obj.edit37:setField("info_Notas1");
    obj.edit37.grid.role = "col";
    obj.edit37.grid.width = 12;
    obj.edit37:setTransparent(true);
    obj.edit37:setName("edit37");
    obj.edit37:setHeight(25);

    obj.horzLine19 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine19:setParent(obj.layout70);
    obj.horzLine19:setStrokeColor("gray");
    obj.horzLine19.grid.role = "col";
    obj.horzLine19.grid.width = 12;
    obj.horzLine19:setName("horzLine19");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout70);
    obj.label32:setText("Notas1");
    obj.label32.grid.role = "col";
    obj.label32.grid.width = 12;
    obj.label32:setHorzTextAlign("leading");
    obj.label32:setName("label32");
    obj.label32:setFontColor("#b5b5b5");
    obj.label32:setHeight(25);

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout68);
    obj.layout71.grid.role = "col";
    obj.layout71.grid.width = 2;
    obj.layout71.grid["auto-height"] = true;
    obj.layout71.grid["cnt-horz-align"] = "middle";
    obj.layout71.grid["min-width"] = 35;
    obj.layout71:setName("layout71");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout71);
    lfm_setPropAsString(obj.rectangle31, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle31.grid.role = "col";
    obj.rectangle31.grid.width = 12;
    obj.rectangle31.grid["auto-height"] = true;
    obj.rectangle31:setXradius(10);
    obj.rectangle31:setYradius(10);
    obj.rectangle31:setCornerType("bevel");
    obj.rectangle31.grid["min-height"] = 30;
    obj.rectangle31.grid["margin-bottom"] = 0;
    obj.rectangle31:setName("rectangle31");
    obj.rectangle31:setStrokeColor("#343434");
    obj.rectangle31:setStrokeSize(2);
    obj.rectangle31:setColor("#1f1e1e");
    obj.rectangle31.grid["padding-top"] = 5;
    obj.rectangle31.grid["padding-left"] = 8;
    obj.rectangle31.grid["padding-right"] = 8;
    obj.rectangle31.grid["padding-bottom"] = 5;

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle31);
    obj.edit38:setField("cam_ALC");
    obj.edit38:setTransparent(true);
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setVertTextAlign("center");
    obj.edit38.grid.role = "col";
    obj.edit38.grid.width = 12;
    obj.edit38:setFontSize(15);
    obj.edit38:setName("edit38");
    obj.edit38:setHeight(25);

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout71);
    obj.label33:setText("ALC");
    obj.label33:setVertTextAlign("trailing");
    obj.label33:setHorzTextAlign("center");
    obj.label33.grid.role = "col";
    obj.label33.grid.width = 12;
    obj.label33:setFontSize(10);
    obj.label33:setTextTrimming("none");
    obj.label33:setWordWrap(true);
    obj.label33:setName("label33");
    obj.label33:setFontColor("#b5b5b5");
    obj.label33:setHeight(25);

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout68);
    obj.layout72.grid.role = "col";
    obj.layout72.grid.width = 2;
    obj.layout72.grid["auto-height"] = true;
    obj.layout72.grid["cnt-horz-align"] = "middle";
    obj.layout72.grid["min-width"] = 35;
    obj.layout72:setName("layout72");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout72);
    lfm_setPropAsString(obj.rectangle32, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle32.grid.role = "col";
    obj.rectangle32.grid.width = 12;
    obj.rectangle32.grid["auto-height"] = true;
    obj.rectangle32:setXradius(10);
    obj.rectangle32:setYradius(10);
    obj.rectangle32:setCornerType("bevel");
    obj.rectangle32.grid["min-height"] = 30;
    obj.rectangle32.grid["margin-bottom"] = 0;
    obj.rectangle32:setName("rectangle32");
    obj.rectangle32:setStrokeColor("#343434");
    obj.rectangle32:setStrokeSize(2);
    obj.rectangle32:setColor("#1f1e1e");
    obj.rectangle32.grid["padding-top"] = 5;
    obj.rectangle32.grid["padding-left"] = 8;
    obj.rectangle32.grid["padding-right"] = 8;
    obj.rectangle32.grid["padding-bottom"] = 5;

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.rectangle32);
    obj.edit39:setField("cam_ADI");
    obj.edit39:setTransparent(true);
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setVertTextAlign("center");
    obj.edit39.grid.role = "col";
    obj.edit39.grid.width = 12;
    obj.edit39:setFontSize(15);
    obj.edit39:setName("edit39");
    obj.edit39:setHeight(25);

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout72);
    obj.label34:setText("ADI");
    obj.label34:setVertTextAlign("trailing");
    obj.label34:setHorzTextAlign("center");
    obj.label34.grid.role = "col";
    obj.label34.grid.width = 12;
    obj.label34:setFontSize(10);
    obj.label34:setTextTrimming("none");
    obj.label34:setWordWrap(true);
    obj.label34:setName("label34");
    obj.label34:setFontColor("#b5b5b5");
    obj.label34:setHeight(25);

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout68);
    obj.layout73.grid.role = "col";
    obj.layout73.grid.width = 2;
    obj.layout73.grid["auto-height"] = true;
    obj.layout73.grid["cnt-horz-align"] = "middle";
    obj.layout73.grid["min-width"] = 35;
    obj.layout73:setName("layout73");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout73);
    lfm_setPropAsString(obj.rectangle33, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle33.grid.role = "col";
    obj.rectangle33.grid.width = 12;
    obj.rectangle33.grid["auto-height"] = true;
    obj.rectangle33:setXradius(10);
    obj.rectangle33:setYradius(10);
    obj.rectangle33:setCornerType("bevel");
    obj.rectangle33.grid["min-height"] = 30;
    obj.rectangle33.grid["margin-bottom"] = 0;
    obj.rectangle33:setName("rectangle33");
    obj.rectangle33:setStrokeColor("#343434");
    obj.rectangle33:setStrokeSize(2);
    obj.rectangle33:setColor("#1f1e1e");
    obj.rectangle33.grid["padding-top"] = 5;
    obj.rectangle33.grid["padding-left"] = 8;
    obj.rectangle33.grid["padding-right"] = 8;
    obj.rectangle33.grid["padding-bottom"] = 5;

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.rectangle33);
    obj.edit40:setField("cam_POD");
    obj.edit40:setTransparent(true);
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setVertTextAlign("center");
    obj.edit40.grid.role = "col";
    obj.edit40.grid.width = 12;
    obj.edit40:setFontSize(15);
    obj.edit40:setName("edit40");
    obj.edit40:setHeight(25);

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout73);
    obj.label35:setText("POD");
    obj.label35:setVertTextAlign("trailing");
    obj.label35:setHorzTextAlign("center");
    obj.label35.grid.role = "col";
    obj.label35.grid.width = 12;
    obj.label35:setFontSize(10);
    obj.label35:setTextTrimming("none");
    obj.label35:setWordWrap(true);
    obj.label35:setName("label35");
    obj.label35:setFontColor("#b5b5b5");
    obj.label35:setHeight(25);

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle29);
    obj.layout74.grid.role = "col";
    obj.layout74.grid.width = 12;
    obj.layout74.grid["auto-height"] = true;
    obj.layout74.grid["padding-bottom"] = 5;
    obj.layout74:setName("layout74");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout74);
    obj.button14:setText("🏹");
    obj.button14.grid.role = "col";
    obj.button14.grid.width = 1;
    obj.button14.grid["min-height"] = 20;
    obj.button14:setFontSize(20);
    obj.button14:setName("button14");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout74);
    obj.layout75.grid.role = "col";
    obj.layout75.grid.width = 3;
    obj.layout75:setName("layout75");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout75);
    obj.edit41:setField("info_Arma1");
    obj.edit41.grid.role = "col";
    obj.edit41.grid.width = 12;
    obj.edit41:setTransparent(true);
    obj.edit41:setName("edit41");
    obj.edit41:setHeight(25);

    obj.horzLine20 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine20:setParent(obj.layout75);
    obj.horzLine20:setStrokeColor("gray");
    obj.horzLine20.grid.role = "col";
    obj.horzLine20.grid.width = 12;
    obj.horzLine20:setName("horzLine20");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout75);
    obj.label36:setText("Arma1");
    obj.label36.grid.role = "col";
    obj.label36.grid.width = 12;
    obj.label36:setHorzTextAlign("leading");
    obj.label36:setName("label36");
    obj.label36:setFontColor("#b5b5b5");
    obj.label36:setHeight(25);

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout74);
    obj.layout76.grid.role = "col";
    obj.layout76.grid.width = 2;
    obj.layout76:setName("layout76");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout76);
    obj.edit42:setField("info_Notas1");
    obj.edit42.grid.role = "col";
    obj.edit42.grid.width = 12;
    obj.edit42:setTransparent(true);
    obj.edit42:setName("edit42");
    obj.edit42:setHeight(25);

    obj.horzLine21 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine21:setParent(obj.layout76);
    obj.horzLine21:setStrokeColor("gray");
    obj.horzLine21.grid.role = "col";
    obj.horzLine21.grid.width = 12;
    obj.horzLine21:setName("horzLine21");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout76);
    obj.label37:setText("Notas1");
    obj.label37.grid.role = "col";
    obj.label37.grid.width = 12;
    obj.label37:setHorzTextAlign("leading");
    obj.label37:setName("label37");
    obj.label37:setFontColor("#b5b5b5");
    obj.label37:setHeight(25);

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout74);
    obj.layout77.grid.role = "col";
    obj.layout77.grid.width = 2;
    obj.layout77.grid["auto-height"] = true;
    obj.layout77.grid["cnt-horz-align"] = "middle";
    obj.layout77.grid["min-width"] = 35;
    obj.layout77:setName("layout77");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout77);
    lfm_setPropAsString(obj.rectangle34, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle34.grid.role = "col";
    obj.rectangle34.grid.width = 12;
    obj.rectangle34.grid["auto-height"] = true;
    obj.rectangle34:setXradius(10);
    obj.rectangle34:setYradius(10);
    obj.rectangle34:setCornerType("bevel");
    obj.rectangle34.grid["min-height"] = 30;
    obj.rectangle34.grid["margin-bottom"] = 0;
    obj.rectangle34:setName("rectangle34");
    obj.rectangle34:setStrokeColor("#343434");
    obj.rectangle34:setStrokeSize(2);
    obj.rectangle34:setColor("#1f1e1e");
    obj.rectangle34.grid["padding-top"] = 5;
    obj.rectangle34.grid["padding-left"] = 8;
    obj.rectangle34.grid["padding-right"] = 8;
    obj.rectangle34.grid["padding-bottom"] = 5;

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.rectangle34);
    obj.edit43:setField("cam_ALC");
    obj.edit43:setTransparent(true);
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setVertTextAlign("center");
    obj.edit43.grid.role = "col";
    obj.edit43.grid.width = 12;
    obj.edit43:setFontSize(15);
    obj.edit43:setName("edit43");
    obj.edit43:setHeight(25);

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout77);
    obj.label38:setText("ALC");
    obj.label38:setVertTextAlign("trailing");
    obj.label38:setHorzTextAlign("center");
    obj.label38.grid.role = "col";
    obj.label38.grid.width = 12;
    obj.label38:setFontSize(10);
    obj.label38:setTextTrimming("none");
    obj.label38:setWordWrap(true);
    obj.label38:setName("label38");
    obj.label38:setFontColor("#b5b5b5");
    obj.label38:setHeight(25);

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout74);
    obj.layout78.grid.role = "col";
    obj.layout78.grid.width = 2;
    obj.layout78.grid["auto-height"] = true;
    obj.layout78.grid["cnt-horz-align"] = "middle";
    obj.layout78.grid["min-width"] = 35;
    obj.layout78:setName("layout78");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout78);
    lfm_setPropAsString(obj.rectangle35, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle35.grid.role = "col";
    obj.rectangle35.grid.width = 12;
    obj.rectangle35.grid["auto-height"] = true;
    obj.rectangle35:setXradius(10);
    obj.rectangle35:setYradius(10);
    obj.rectangle35:setCornerType("bevel");
    obj.rectangle35.grid["min-height"] = 30;
    obj.rectangle35.grid["margin-bottom"] = 0;
    obj.rectangle35:setName("rectangle35");
    obj.rectangle35:setStrokeColor("#343434");
    obj.rectangle35:setStrokeSize(2);
    obj.rectangle35:setColor("#1f1e1e");
    obj.rectangle35.grid["padding-top"] = 5;
    obj.rectangle35.grid["padding-left"] = 8;
    obj.rectangle35.grid["padding-right"] = 8;
    obj.rectangle35.grid["padding-bottom"] = 5;

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.rectangle35);
    obj.edit44:setField("cam_ADI");
    obj.edit44:setTransparent(true);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setVertTextAlign("center");
    obj.edit44.grid.role = "col";
    obj.edit44.grid.width = 12;
    obj.edit44:setFontSize(15);
    obj.edit44:setName("edit44");
    obj.edit44:setHeight(25);

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout78);
    obj.label39:setText("ADI");
    obj.label39:setVertTextAlign("trailing");
    obj.label39:setHorzTextAlign("center");
    obj.label39.grid.role = "col";
    obj.label39.grid.width = 12;
    obj.label39:setFontSize(10);
    obj.label39:setTextTrimming("none");
    obj.label39:setWordWrap(true);
    obj.label39:setName("label39");
    obj.label39:setFontColor("#b5b5b5");
    obj.label39:setHeight(25);

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout74);
    obj.layout79.grid.role = "col";
    obj.layout79.grid.width = 2;
    obj.layout79.grid["auto-height"] = true;
    obj.layout79.grid["cnt-horz-align"] = "middle";
    obj.layout79.grid["min-width"] = 35;
    obj.layout79:setName("layout79");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout79);
    lfm_setPropAsString(obj.rectangle36, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle36.grid.role = "col";
    obj.rectangle36.grid.width = 12;
    obj.rectangle36.grid["auto-height"] = true;
    obj.rectangle36:setXradius(10);
    obj.rectangle36:setYradius(10);
    obj.rectangle36:setCornerType("bevel");
    obj.rectangle36.grid["min-height"] = 30;
    obj.rectangle36.grid["margin-bottom"] = 0;
    obj.rectangle36:setName("rectangle36");
    obj.rectangle36:setStrokeColor("#343434");
    obj.rectangle36:setStrokeSize(2);
    obj.rectangle36:setColor("#1f1e1e");
    obj.rectangle36.grid["padding-top"] = 5;
    obj.rectangle36.grid["padding-left"] = 8;
    obj.rectangle36.grid["padding-right"] = 8;
    obj.rectangle36.grid["padding-bottom"] = 5;

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.rectangle36);
    obj.edit45:setField("cam_POD");
    obj.edit45:setTransparent(true);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setVertTextAlign("center");
    obj.edit45.grid.role = "col";
    obj.edit45.grid.width = 12;
    obj.edit45:setFontSize(15);
    obj.edit45:setName("edit45");
    obj.edit45:setHeight(25);

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout79);
    obj.label40:setText("POD");
    obj.label40:setVertTextAlign("trailing");
    obj.label40:setHorzTextAlign("center");
    obj.label40.grid.role = "col";
    obj.label40.grid.width = 12;
    obj.label40:setFontSize(10);
    obj.label40:setTextTrimming("none");
    obj.label40:setWordWrap(true);
    obj.label40:setName("label40");
    obj.label40:setFontColor("#b5b5b5");
    obj.label40:setHeight(25);

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout57);
    obj.rectangle37.grid.role = "col";
    obj.rectangle37.grid.width = 12;
    obj.rectangle37.grid["auto-height"] = true;
    obj.rectangle37.grid["cnt-horz-align"] = "right";
    obj.rectangle37.grid["margin-bottom"] = 5;
    obj.rectangle37:setName("rectangle37");
    lfm_setPropAsString(obj.rectangle37, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle37:setCornerType("round");
    obj.rectangle37:setXradius(15);
    obj.rectangle37:setYradius(15);
    obj.rectangle37:setStrokeColor("#343434");
    obj.rectangle37:setStrokeSize(2);
    obj.rectangle37:setColor("#1f1e1e");
    obj.rectangle37.grid["padding-top"] = 5;
    obj.rectangle37.grid["padding-left"] = 8;
    obj.rectangle37.grid["padding-right"] = 8;
    obj.rectangle37.grid["padding-bottom"] = 5;

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.rectangle37);
    obj.rectangle38:setColor("grey");
    obj.rectangle38:setXradius(0);
    obj.rectangle38:setYradius(0);
    obj.rectangle38.grid.role = "row";
    obj.rectangle38.grid.width = 12;
    obj.rectangle38.grid["cnt-vert-align"] = "center";
    obj.rectangle38.grid["max-height"] = 23;
    obj.rectangle38.grid["margin-bottom"] = 5;
    obj.rectangle38.grid["margin-top"] = -5;
    obj.rectangle38.grid["margin-left"] = -5;
    obj.rectangle38.grid["margin-right"] = -5;
    obj.rectangle38:setName("rectangle38");
    lfm_setPropAsString(obj.rectangle38, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle38:setCornerType("round");
    obj.rectangle38:setStrokeColor("#343434");
    obj.rectangle38:setStrokeSize(2);
    obj.rectangle38.grid["padding-top"] = 5;
    obj.rectangle38.grid["padding-left"] = 8;
    obj.rectangle38.grid["padding-right"] = 8;
    obj.rectangle38.grid["padding-bottom"] = 5;

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle38);
    obj.label41:setText("DEFESA");
    obj.label41:setHorzTextAlign("leading");
    obj.label41:setFontSize(15);
    lfm_setPropAsString(obj.label41, "fontStyle", "bold");
    obj.label41.grid.role = "col";
    obj.label41:setFontColor("black");
    obj.label41.grid["dyn-width-txt"] = true;
    obj.label41:setName("label41");
    obj.label41:setHeight(25);

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle37);
    obj.layout80.grid.role = "col";
    obj.layout80.grid.width = 2;
    obj.layout80.grid["auto-height"] = true;
    obj.layout80.grid["cnt-horz-align"] = "middle";
    obj.layout80.grid["min-width"] = 35;
    obj.layout80:setName("layout80");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout80);
    lfm_setPropAsString(obj.rectangle39, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle39.grid.role = "col";
    obj.rectangle39.grid.width = 12;
    obj.rectangle39.grid["auto-height"] = true;
    obj.rectangle39:setXradius(10);
    obj.rectangle39:setYradius(10);
    obj.rectangle39:setCornerType("bevel");
    obj.rectangle39.grid["min-height"] = 30;
    obj.rectangle39.grid["margin-bottom"] = 0;
    obj.rectangle39:setName("rectangle39");
    obj.rectangle39:setStrokeColor("#343434");
    obj.rectangle39:setStrokeSize(2);
    obj.rectangle39:setColor("#1f1e1e");
    obj.rectangle39.grid["padding-top"] = 5;
    obj.rectangle39.grid["padding-left"] = 8;
    obj.rectangle39.grid["padding-right"] = 8;
    obj.rectangle39.grid["padding-bottom"] = 5;

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.rectangle39);
    obj.edit46:setField("cam_ VEL + AGI + PER");
    obj.edit46:setTransparent(true);
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setVertTextAlign("center");
    obj.edit46.grid.role = "col";
    obj.edit46.grid.width = 12;
    obj.edit46:setFontSize(15);
    obj.edit46:setName("edit46");
    obj.edit46:setHeight(25);

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout80);
    obj.label42:setText(" VEL + AGI + PER");
    obj.label42:setVertTextAlign("trailing");
    obj.label42:setHorzTextAlign("center");
    obj.label42.grid.role = "col";
    obj.label42.grid.width = 12;
    obj.label42:setFontSize(10);
    obj.label42:setTextTrimming("none");
    obj.label42:setWordWrap(true);
    obj.label42:setName("label42");
    obj.label42:setFontColor("#b5b5b5");
    obj.label42:setHeight(25);

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle37);
    obj.layout81.grid.role = "col";
    obj.layout81.grid.width = 2;
    obj.layout81.grid["auto-height"] = true;
    obj.layout81.grid["cnt-horz-align"] = "middle";
    obj.layout81.grid["min-width"] = 35;
    obj.layout81:setName("layout81");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout81);
    lfm_setPropAsString(obj.rectangle40, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle40.grid.role = "col";
    obj.rectangle40.grid.width = 12;
    obj.rectangle40.grid["auto-height"] = true;
    obj.rectangle40:setXradius(10);
    obj.rectangle40:setYradius(10);
    obj.rectangle40:setCornerType("bevel");
    obj.rectangle40.grid["min-height"] = 30;
    obj.rectangle40.grid["margin-bottom"] = 0;
    obj.rectangle40:setName("rectangle40");
    obj.rectangle40:setStrokeColor("#343434");
    obj.rectangle40:setStrokeSize(2);
    obj.rectangle40:setColor("#1f1e1e");
    obj.rectangle40.grid["padding-top"] = 5;
    obj.rectangle40.grid["padding-left"] = 8;
    obj.rectangle40.grid["padding-right"] = 8;
    obj.rectangle40.grid["padding-bottom"] = 5;

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.rectangle40);
    obj.edit47:setField("cam_MOD. EQUIP +");
    obj.edit47:setTransparent(true);
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setVertTextAlign("center");
    obj.edit47.grid.role = "col";
    obj.edit47.grid.width = 12;
    obj.edit47:setFontSize(15);
    obj.edit47:setName("edit47");
    obj.edit47:setHeight(25);

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout81);
    obj.label43:setText("MOD. EQUIP +");
    obj.label43:setVertTextAlign("trailing");
    obj.label43:setHorzTextAlign("center");
    obj.label43.grid.role = "col";
    obj.label43.grid.width = 12;
    obj.label43:setFontSize(10);
    obj.label43:setTextTrimming("none");
    obj.label43:setWordWrap(true);
    obj.label43:setName("label43");
    obj.label43:setFontColor("#b5b5b5");
    obj.label43:setHeight(25);

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle37);
    obj.layout82.grid.role = "col";
    obj.layout82.grid.width = 2;
    obj.layout82.grid["auto-height"] = true;
    obj.layout82.grid["cnt-horz-align"] = "middle";
    obj.layout82.grid["min-width"] = 35;
    obj.layout82:setName("layout82");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout82);
    lfm_setPropAsString(obj.rectangle41, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle41.grid.role = "col";
    obj.rectangle41.grid.width = 12;
    obj.rectangle41.grid["auto-height"] = true;
    obj.rectangle41:setXradius(10);
    obj.rectangle41:setYradius(10);
    obj.rectangle41:setCornerType("bevel");
    obj.rectangle41.grid["min-height"] = 30;
    obj.rectangle41.grid["margin-bottom"] = 0;
    obj.rectangle41:setName("rectangle41");
    obj.rectangle41:setStrokeColor("#343434");
    obj.rectangle41:setStrokeSize(2);
    obj.rectangle41:setColor("#1f1e1e");
    obj.rectangle41.grid["padding-top"] = 5;
    obj.rectangle41.grid["padding-left"] = 8;
    obj.rectangle41.grid["padding-right"] = 8;
    obj.rectangle41.grid["padding-bottom"] = 5;

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.rectangle41);
    obj.edit48:setField("cam_OUTRO");
    obj.edit48:setTransparent(true);
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setVertTextAlign("center");
    obj.edit48.grid.role = "col";
    obj.edit48.grid.width = 12;
    obj.edit48:setFontSize(15);
    obj.edit48:setName("edit48");
    obj.edit48:setHeight(25);

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout82);
    obj.label44:setText("OUTRO");
    obj.label44:setVertTextAlign("trailing");
    obj.label44:setHorzTextAlign("center");
    obj.label44.grid.role = "col";
    obj.label44.grid.width = 12;
    obj.label44:setFontSize(10);
    obj.label44:setTextTrimming("none");
    obj.label44:setWordWrap(true);
    obj.label44:setName("label44");
    obj.label44:setFontColor("#b5b5b5");
    obj.label44:setHeight(25);

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle37);
    obj.label45:setText("=");
    obj.label45.grid.role = "col";
    obj.label45.grid.width = 1;
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");
    obj.label45:setFontColor("#b5b5b5");
    obj.label45:setHeight(25);

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle37);
    obj.layout83.grid.role = "col";
    obj.layout83.grid.width = 3;
    obj.layout83.grid["auto-height"] = true;
    obj.layout83.grid["cnt-horz-align"] = "middle";
    obj.layout83.grid["cnt-vert-align"] = "bottom";
    obj.layout83:setName("layout83");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout83);
    lfm_setPropAsString(obj.rectangle42, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle42.grid.role = "col";
    obj.rectangle42.grid.width = 12;
    obj.rectangle42.grid["auto-height"] = true;
    obj.rectangle42.grid["min-width"] = 30;
    obj.rectangle42:setName("rectangle42");
    obj.rectangle42:setCornerType("round");
    obj.rectangle42:setXradius(15);
    obj.rectangle42:setYradius(15);
    obj.rectangle42:setStrokeColor("#343434");
    obj.rectangle42:setStrokeSize(2);
    obj.rectangle42:setColor("#1f1e1e");
    obj.rectangle42.grid["padding-top"] = 5;
    obj.rectangle42.grid["padding-left"] = 8;
    obj.rectangle42.grid["padding-right"] = 8;
    obj.rectangle42.grid["padding-bottom"] = 5;

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.rectangle42);
    obj.edit49:setField("cam_DEFESA or 0");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setTransparent(true);
    obj.edit49.grid.role = "col";
    obj.edit49.grid.width = 12;
    obj.edit49:setFontSize(20);
    obj.edit49:setName("edit49");
    obj.edit49:setHeight(25);

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout83);
    obj.button15:setText("DEFESA");
    obj.button15:setHorzTextAlign("center");
    obj.button15.grid.role = "col";
    obj.button15.grid.width = 12;
    obj.button15:setFontSize(10);
    obj.button15:setName("button15");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout57);
    obj.rectangle43.grid.role = "col";
    obj.rectangle43.grid.width = 12;
    obj.rectangle43.grid["auto-height"] = true;
    obj.rectangle43.grid["cnt-horz-align"] = "right";
    obj.rectangle43.grid["margin-bottom"] = 5;
    obj.rectangle43.grid["cnt-gutter"] = 5;
    obj.rectangle43:setName("rectangle43");
    lfm_setPropAsString(obj.rectangle43, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle43:setCornerType("round");
    obj.rectangle43:setXradius(15);
    obj.rectangle43:setYradius(15);
    obj.rectangle43:setStrokeColor("#343434");
    obj.rectangle43:setStrokeSize(2);
    obj.rectangle43:setColor("#1f1e1e");
    obj.rectangle43.grid["padding-top"] = 5;
    obj.rectangle43.grid["padding-left"] = 8;
    obj.rectangle43.grid["padding-right"] = 8;
    obj.rectangle43.grid["padding-bottom"] = 5;

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.rectangle43);
    obj.rectangle44:setColor("grey");
    obj.rectangle44:setXradius(0);
    obj.rectangle44:setYradius(0);
    obj.rectangle44.grid.role = "row";
    obj.rectangle44.grid.width = 12;
    obj.rectangle44.grid["cnt-vert-align"] = "center";
    obj.rectangle44.grid["max-height"] = 23;
    obj.rectangle44.grid["margin-bottom"] = 5;
    obj.rectangle44.grid["margin-top"] = -5;
    obj.rectangle44.grid["margin-left"] = -5;
    obj.rectangle44.grid["margin-right"] = -5;
    obj.rectangle44:setName("rectangle44");
    lfm_setPropAsString(obj.rectangle44, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle44:setCornerType("round");
    obj.rectangle44:setStrokeColor("#343434");
    obj.rectangle44:setStrokeSize(2);
    obj.rectangle44.grid["padding-top"] = 5;
    obj.rectangle44.grid["padding-left"] = 8;
    obj.rectangle44.grid["padding-right"] = 8;
    obj.rectangle44.grid["padding-bottom"] = 5;

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle44);
    obj.label46:setText("ARMADURA");
    obj.label46:setHorzTextAlign("leading");
    obj.label46:setFontSize(15);
    lfm_setPropAsString(obj.label46, "fontStyle", "bold");
    obj.label46.grid.role = "col";
    obj.label46:setFontColor("black");
    obj.label46.grid["dyn-width-txt"] = true;
    obj.label46:setName("label46");
    obj.label46:setHeight(25);

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle43);
    obj.layout84.grid.role = "col";
    obj.layout84.grid.width = 2;
    obj.layout84.grid["auto-height"] = true;
    obj.layout84.grid["cnt-horz-align"] = "middle";
    obj.layout84.grid["min-width"] = 35;
    obj.layout84:setName("layout84");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout84);
    lfm_setPropAsString(obj.rectangle45, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle45.grid.role = "col";
    obj.rectangle45.grid.width = 12;
    obj.rectangle45.grid["auto-height"] = true;
    obj.rectangle45:setXradius(10);
    obj.rectangle45:setYradius(10);
    obj.rectangle45:setCornerType("bevel");
    obj.rectangle45.grid["min-height"] = 30;
    obj.rectangle45.grid["margin-bottom"] = 0;
    obj.rectangle45:setName("rectangle45");
    obj.rectangle45:setStrokeColor("#343434");
    obj.rectangle45:setStrokeSize(2);
    obj.rectangle45:setColor("#1f1e1e");
    obj.rectangle45.grid["padding-top"] = 5;
    obj.rectangle45.grid["padding-left"] = 8;
    obj.rectangle45.grid["padding-right"] = 8;
    obj.rectangle45.grid["padding-bottom"] = 5;

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.rectangle45);
    obj.edit50:setField("cam_FIS +");
    obj.edit50:setTransparent(true);
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setVertTextAlign("center");
    obj.edit50.grid.role = "col";
    obj.edit50.grid.width = 12;
    obj.edit50:setFontSize(15);
    obj.edit50:setName("edit50");
    obj.edit50:setHeight(25);

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout84);
    obj.label47:setText("FIS +");
    obj.label47:setVertTextAlign("trailing");
    obj.label47:setHorzTextAlign("center");
    obj.label47.grid.role = "col";
    obj.label47.grid.width = 12;
    obj.label47:setFontSize(10);
    obj.label47:setTextTrimming("none");
    obj.label47:setWordWrap(true);
    obj.label47:setName("label47");
    obj.label47:setFontColor("#b5b5b5");
    obj.label47:setHeight(25);

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle43);
    obj.layout85.grid.role = "col";
    obj.layout85.grid.width = 2;
    obj.layout85.grid["auto-height"] = true;
    obj.layout85.grid["cnt-horz-align"] = "middle";
    obj.layout85.grid["min-width"] = 35;
    obj.layout85:setName("layout85");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout85);
    lfm_setPropAsString(obj.rectangle46, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle46.grid.role = "col";
    obj.rectangle46.grid.width = 12;
    obj.rectangle46.grid["auto-height"] = true;
    obj.rectangle46:setXradius(10);
    obj.rectangle46:setYradius(10);
    obj.rectangle46:setCornerType("bevel");
    obj.rectangle46.grid["min-height"] = 30;
    obj.rectangle46.grid["margin-bottom"] = 0;
    obj.rectangle46:setName("rectangle46");
    obj.rectangle46:setStrokeColor("#343434");
    obj.rectangle46:setStrokeSize(2);
    obj.rectangle46:setColor("#1f1e1e");
    obj.rectangle46.grid["padding-top"] = 5;
    obj.rectangle46.grid["padding-left"] = 8;
    obj.rectangle46.grid["padding-right"] = 8;
    obj.rectangle46.grid["padding-bottom"] = 5;

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.rectangle46);
    obj.edit51:setField("cam_MOD. ARM +");
    obj.edit51:setTransparent(true);
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setVertTextAlign("center");
    obj.edit51.grid.role = "col";
    obj.edit51.grid.width = 12;
    obj.edit51:setFontSize(15);
    obj.edit51:setName("edit51");
    obj.edit51:setHeight(25);

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout85);
    obj.label48:setText("MOD. ARM +");
    obj.label48:setVertTextAlign("trailing");
    obj.label48:setHorzTextAlign("center");
    obj.label48.grid.role = "col";
    obj.label48.grid.width = 12;
    obj.label48:setFontSize(10);
    obj.label48:setTextTrimming("none");
    obj.label48:setWordWrap(true);
    obj.label48:setName("label48");
    obj.label48:setFontColor("#b5b5b5");
    obj.label48:setHeight(25);

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle43);
    obj.layout86.grid.role = "col";
    obj.layout86.grid.width = 2;
    obj.layout86.grid["auto-height"] = true;
    obj.layout86.grid["cnt-horz-align"] = "middle";
    obj.layout86.grid["min-width"] = 35;
    obj.layout86:setName("layout86");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout86);
    lfm_setPropAsString(obj.rectangle47, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle47.grid.role = "col";
    obj.rectangle47.grid.width = 12;
    obj.rectangle47.grid["auto-height"] = true;
    obj.rectangle47:setXradius(10);
    obj.rectangle47:setYradius(10);
    obj.rectangle47:setCornerType("bevel");
    obj.rectangle47.grid["min-height"] = 30;
    obj.rectangle47.grid["margin-bottom"] = 0;
    obj.rectangle47:setName("rectangle47");
    obj.rectangle47:setStrokeColor("#343434");
    obj.rectangle47:setStrokeSize(2);
    obj.rectangle47:setColor("#1f1e1e");
    obj.rectangle47.grid["padding-top"] = 5;
    obj.rectangle47.grid["padding-left"] = 8;
    obj.rectangle47.grid["padding-right"] = 8;
    obj.rectangle47.grid["padding-bottom"] = 5;

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.rectangle47);
    obj.edit52:setField("cam_MOD. ESCUDO +");
    obj.edit52:setTransparent(true);
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setVertTextAlign("center");
    obj.edit52.grid.role = "col";
    obj.edit52.grid.width = 12;
    obj.edit52:setFontSize(15);
    obj.edit52:setName("edit52");
    obj.edit52:setHeight(25);

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout86);
    obj.label49:setText("MOD. ESCUDO +");
    obj.label49:setVertTextAlign("trailing");
    obj.label49:setHorzTextAlign("center");
    obj.label49.grid.role = "col";
    obj.label49.grid.width = 12;
    obj.label49:setFontSize(10);
    obj.label49:setTextTrimming("none");
    obj.label49:setWordWrap(true);
    obj.label49:setName("label49");
    obj.label49:setFontColor("#b5b5b5");
    obj.label49:setHeight(25);

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle43);
    obj.layout87.grid.role = "col";
    obj.layout87.grid.width = 2;
    obj.layout87.grid["auto-height"] = true;
    obj.layout87.grid["cnt-horz-align"] = "middle";
    obj.layout87.grid["min-width"] = 35;
    obj.layout87:setName("layout87");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout87);
    lfm_setPropAsString(obj.rectangle48, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle48.grid.role = "col";
    obj.rectangle48.grid.width = 12;
    obj.rectangle48.grid["auto-height"] = true;
    obj.rectangle48:setXradius(10);
    obj.rectangle48:setYradius(10);
    obj.rectangle48:setCornerType("bevel");
    obj.rectangle48.grid["min-height"] = 30;
    obj.rectangle48.grid["margin-bottom"] = 0;
    obj.rectangle48:setName("rectangle48");
    obj.rectangle48:setStrokeColor("#343434");
    obj.rectangle48:setStrokeSize(2);
    obj.rectangle48:setColor("#1f1e1e");
    obj.rectangle48.grid["padding-top"] = 5;
    obj.rectangle48.grid["padding-left"] = 8;
    obj.rectangle48.grid["padding-right"] = 8;
    obj.rectangle48.grid["padding-bottom"] = 5;

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.rectangle48);
    obj.edit53:setField("cam_OUTRO ");
    obj.edit53:setTransparent(true);
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setVertTextAlign("center");
    obj.edit53.grid.role = "col";
    obj.edit53.grid.width = 12;
    obj.edit53:setFontSize(15);
    obj.edit53:setName("edit53");
    obj.edit53:setHeight(25);

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout87);
    obj.label50:setText("OUTRO ");
    obj.label50:setVertTextAlign("trailing");
    obj.label50:setHorzTextAlign("center");
    obj.label50.grid.role = "col";
    obj.label50.grid.width = 12;
    obj.label50:setFontSize(10);
    obj.label50:setTextTrimming("none");
    obj.label50:setWordWrap(true);
    obj.label50:setName("label50");
    obj.label50:setFontColor("#b5b5b5");
    obj.label50:setHeight(25);

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle43);
    obj.label51:setText("=");
    obj.label51.grid.role = "col";
    obj.label51.grid.width = 1;
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");
    obj.label51:setFontColor("#b5b5b5");
    obj.label51:setHeight(25);

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle43);
    obj.layout88.grid.role = "col";
    obj.layout88.grid.width = 3;
    obj.layout88.grid["auto-height"] = true;
    obj.layout88.grid["cnt-horz-align"] = "middle";
    obj.layout88.grid["cnt-vert-align"] = "bottom";
    obj.layout88:setName("layout88");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout88);
    lfm_setPropAsString(obj.rectangle49, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle49.grid.role = "col";
    obj.rectangle49.grid.width = 12;
    obj.rectangle49.grid["auto-height"] = true;
    obj.rectangle49.grid["min-width"] = 30;
    obj.rectangle49:setName("rectangle49");
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setXradius(15);
    obj.rectangle49:setYradius(15);
    obj.rectangle49:setStrokeColor("#343434");
    obj.rectangle49:setStrokeSize(2);
    obj.rectangle49:setColor("#1f1e1e");
    obj.rectangle49.grid["padding-top"] = 5;
    obj.rectangle49.grid["padding-left"] = 8;
    obj.rectangle49.grid["padding-right"] = 8;
    obj.rectangle49.grid["padding-bottom"] = 5;

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.rectangle49);
    obj.edit54:setField("cam_ARMADURA or 0");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setTransparent(true);
    obj.edit54.grid.role = "col";
    obj.edit54.grid.width = 12;
    obj.edit54:setFontSize(20);
    obj.edit54:setName("edit54");
    obj.edit54:setHeight(25);

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout88);
    obj.button16:setText("ARMADURA");
    obj.button16:setHorzTextAlign("center");
    obj.button16.grid.role = "col";
    obj.button16.grid.width = 12;
    obj.button16:setFontSize(10);
    obj.button16:setName("button16");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout57);
    obj.rectangle50.grid.role = "col";
    obj.rectangle50.grid.width = 12;
    obj.rectangle50.grid["auto-height"] = true;
    obj.rectangle50.grid["cnt-horz-align"] = "right";
    obj.rectangle50.grid["margin-bottom"] = 5;
    obj.rectangle50:setName("rectangle50");
    lfm_setPropAsString(obj.rectangle50, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle50:setCornerType("round");
    obj.rectangle50:setXradius(15);
    obj.rectangle50:setYradius(15);
    obj.rectangle50:setStrokeColor("#343434");
    obj.rectangle50:setStrokeSize(2);
    obj.rectangle50:setColor("#1f1e1e");
    obj.rectangle50.grid["padding-top"] = 5;
    obj.rectangle50.grid["padding-left"] = 8;
    obj.rectangle50.grid["padding-right"] = 8;
    obj.rectangle50.grid["padding-bottom"] = 5;

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.rectangle50);
    obj.rectangle51:setColor("grey");
    obj.rectangle51:setXradius(0);
    obj.rectangle51:setYradius(0);
    obj.rectangle51.grid.role = "row";
    obj.rectangle51.grid.width = 12;
    obj.rectangle51.grid["cnt-vert-align"] = "center";
    obj.rectangle51.grid["max-height"] = 23;
    obj.rectangle51.grid["margin-bottom"] = 5;
    obj.rectangle51.grid["margin-top"] = -5;
    obj.rectangle51.grid["margin-left"] = -5;
    obj.rectangle51.grid["margin-right"] = -5;
    obj.rectangle51:setName("rectangle51");
    lfm_setPropAsString(obj.rectangle51, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle51:setCornerType("round");
    obj.rectangle51:setStrokeColor("#343434");
    obj.rectangle51:setStrokeSize(2);
    obj.rectangle51.grid["padding-top"] = 5;
    obj.rectangle51.grid["padding-left"] = 8;
    obj.rectangle51.grid["padding-right"] = 8;
    obj.rectangle51.grid["padding-bottom"] = 5;

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle51);
    obj.label52:setText("INICIATIVA");
    obj.label52:setHorzTextAlign("leading");
    obj.label52:setFontSize(15);
    lfm_setPropAsString(obj.label52, "fontStyle", "bold");
    obj.label52.grid.role = "col";
    obj.label52:setFontColor("black");
    obj.label52.grid["dyn-width-txt"] = true;
    obj.label52:setName("label52");
    obj.label52:setHeight(25);

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle50);
    obj.layout89.grid.role = "col";
    obj.layout89.grid.width = 3;
    obj.layout89.grid["auto-height"] = true;
    obj.layout89.grid["cnt-horz-align"] = "middle";
    obj.layout89.grid["min-width"] = 35;
    obj.layout89:setName("layout89");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout89);
    lfm_setPropAsString(obj.rectangle52, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle52.grid.role = "col";
    obj.rectangle52.grid.width = 12;
    obj.rectangle52.grid["auto-height"] = true;
    obj.rectangle52:setXradius(10);
    obj.rectangle52:setYradius(10);
    obj.rectangle52:setCornerType("bevel");
    obj.rectangle52.grid["min-height"] = 30;
    obj.rectangle52.grid["margin-bottom"] = 0;
    obj.rectangle52:setName("rectangle52");
    obj.rectangle52:setStrokeColor("#343434");
    obj.rectangle52:setStrokeSize(2);
    obj.rectangle52:setColor("#1f1e1e");
    obj.rectangle52.grid["padding-top"] = 5;
    obj.rectangle52.grid["padding-left"] = 8;
    obj.rectangle52.grid["padding-right"] = 8;
    obj.rectangle52.grid["padding-bottom"] = 5;

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.rectangle52);
    obj.edit55:setField("cam_ VEL + MAE + PER");
    obj.edit55:setTransparent(true);
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setVertTextAlign("center");
    obj.edit55.grid.role = "col";
    obj.edit55.grid.width = 12;
    obj.edit55:setFontSize(15);
    obj.edit55:setName("edit55");
    obj.edit55:setHeight(25);

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout89);
    obj.label53:setText(" VEL + MAE + PER");
    obj.label53:setVertTextAlign("trailing");
    obj.label53:setHorzTextAlign("center");
    obj.label53.grid.role = "col";
    obj.label53.grid.width = 12;
    obj.label53:setFontSize(10);
    obj.label53:setTextTrimming("none");
    obj.label53:setWordWrap(true);
    obj.label53:setName("label53");
    obj.label53:setFontColor("#b5b5b5");
    obj.label53:setHeight(25);

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle50);
    obj.layout90.grid.role = "col";
    obj.layout90.grid.width = 2;
    obj.layout90.grid["auto-height"] = true;
    obj.layout90.grid["cnt-horz-align"] = "middle";
    obj.layout90.grid["min-width"] = 35;
    obj.layout90:setName("layout90");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout90);
    lfm_setPropAsString(obj.rectangle53, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle53.grid.role = "col";
    obj.rectangle53.grid.width = 12;
    obj.rectangle53.grid["auto-height"] = true;
    obj.rectangle53:setXradius(10);
    obj.rectangle53:setYradius(10);
    obj.rectangle53:setCornerType("bevel");
    obj.rectangle53.grid["min-height"] = 30;
    obj.rectangle53.grid["margin-bottom"] = 0;
    obj.rectangle53:setName("rectangle53");
    obj.rectangle53:setStrokeColor("#343434");
    obj.rectangle53:setStrokeSize(2);
    obj.rectangle53:setColor("#1f1e1e");
    obj.rectangle53.grid["padding-top"] = 5;
    obj.rectangle53.grid["padding-left"] = 8;
    obj.rectangle53.grid["padding-right"] = 8;
    obj.rectangle53.grid["padding-bottom"] = 5;

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.rectangle53);
    obj.edit56:setField("cam_MOD.EQUIP");
    obj.edit56:setTransparent(true);
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setVertTextAlign("center");
    obj.edit56.grid.role = "col";
    obj.edit56.grid.width = 12;
    obj.edit56:setFontSize(15);
    obj.edit56:setName("edit56");
    obj.edit56:setHeight(25);

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout90);
    obj.label54:setText("MOD.EQUIP");
    obj.label54:setVertTextAlign("trailing");
    obj.label54:setHorzTextAlign("center");
    obj.label54.grid.role = "col";
    obj.label54.grid.width = 12;
    obj.label54:setFontSize(10);
    obj.label54:setTextTrimming("none");
    obj.label54:setWordWrap(true);
    obj.label54:setName("label54");
    obj.label54:setFontColor("#b5b5b5");
    obj.label54:setHeight(25);

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle50);
    obj.layout91.grid.role = "col";
    obj.layout91.grid.width = 2;
    obj.layout91.grid["auto-height"] = true;
    obj.layout91.grid["cnt-horz-align"] = "middle";
    obj.layout91.grid["min-width"] = 35;
    obj.layout91:setName("layout91");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout91);
    lfm_setPropAsString(obj.rectangle54, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle54.grid.role = "col";
    obj.rectangle54.grid.width = 12;
    obj.rectangle54.grid["auto-height"] = true;
    obj.rectangle54:setXradius(10);
    obj.rectangle54:setYradius(10);
    obj.rectangle54:setCornerType("bevel");
    obj.rectangle54.grid["min-height"] = 30;
    obj.rectangle54.grid["margin-bottom"] = 0;
    obj.rectangle54:setName("rectangle54");
    obj.rectangle54:setStrokeColor("#343434");
    obj.rectangle54:setStrokeSize(2);
    obj.rectangle54:setColor("#1f1e1e");
    obj.rectangle54.grid["padding-top"] = 5;
    obj.rectangle54.grid["padding-left"] = 8;
    obj.rectangle54.grid["padding-right"] = 8;
    obj.rectangle54.grid["padding-bottom"] = 5;

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.rectangle54);
    obj.edit57:setField("cam_OUTRO");
    obj.edit57:setTransparent(true);
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setVertTextAlign("center");
    obj.edit57.grid.role = "col";
    obj.edit57.grid.width = 12;
    obj.edit57:setFontSize(15);
    obj.edit57:setName("edit57");
    obj.edit57:setHeight(25);

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout91);
    obj.label55:setText("OUTRO");
    obj.label55:setVertTextAlign("trailing");
    obj.label55:setHorzTextAlign("center");
    obj.label55.grid.role = "col";
    obj.label55.grid.width = 12;
    obj.label55:setFontSize(10);
    obj.label55:setTextTrimming("none");
    obj.label55:setWordWrap(true);
    obj.label55:setName("label55");
    obj.label55:setFontColor("#b5b5b5");
    obj.label55:setHeight(25);

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle50);
    obj.label56:setText("=");
    obj.label56.grid.role = "col";
    obj.label56.grid.width = 1;
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");
    obj.label56:setFontColor("#b5b5b5");
    obj.label56:setHeight(25);

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle50);
    obj.layout92.grid.role = "col";
    obj.layout92.grid.width = 3;
    obj.layout92.grid["auto-height"] = true;
    obj.layout92.grid["cnt-horz-align"] = "middle";
    obj.layout92.grid["cnt-vert-align"] = "bottom";
    obj.layout92:setName("layout92");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout92);
    lfm_setPropAsString(obj.rectangle55, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle55.grid.role = "col";
    obj.rectangle55.grid.width = 12;
    obj.rectangle55.grid["auto-height"] = true;
    obj.rectangle55.grid["min-width"] = 30;
    obj.rectangle55:setName("rectangle55");
    obj.rectangle55:setCornerType("round");
    obj.rectangle55:setXradius(15);
    obj.rectangle55:setYradius(15);
    obj.rectangle55:setStrokeColor("#343434");
    obj.rectangle55:setStrokeSize(2);
    obj.rectangle55:setColor("#1f1e1e");
    obj.rectangle55.grid["padding-top"] = 5;
    obj.rectangle55.grid["padding-left"] = 8;
    obj.rectangle55.grid["padding-right"] = 8;
    obj.rectangle55.grid["padding-bottom"] = 5;

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.rectangle55);
    obj.edit58:setField("cam_INICIATIVA or 0");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setTransparent(true);
    obj.edit58.grid.role = "col";
    obj.edit58.grid.width = 12;
    obj.edit58:setFontSize(20);
    obj.edit58:setName("edit58");
    obj.edit58:setHeight(25);

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout92);
    obj.button17:setText("INICIATIVA");
    obj.button17:setHorzTextAlign("center");
    obj.button17.grid.role = "col";
    obj.button17.grid.width = 12;
    obj.button17:setFontSize(10);
    obj.button17:setName("button17");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout57);
    obj.rectangle56.grid.role = "col";
    obj.rectangle56.grid.width = 12;
    obj.rectangle56.grid["auto-height"] = true;
    obj.rectangle56.grid["cnt-horz-align"] = "right";
    obj.rectangle56:setName("rectangle56");
    lfm_setPropAsString(obj.rectangle56, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle56:setCornerType("round");
    obj.rectangle56:setXradius(15);
    obj.rectangle56:setYradius(15);
    obj.rectangle56:setStrokeColor("#343434");
    obj.rectangle56:setStrokeSize(2);
    obj.rectangle56:setColor("#1f1e1e");
    obj.rectangle56.grid["padding-top"] = 5;
    obj.rectangle56.grid["padding-left"] = 8;
    obj.rectangle56.grid["padding-right"] = 8;
    obj.rectangle56.grid["padding-bottom"] = 5;

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.rectangle56);
    obj.rectangle57:setColor("grey");
    obj.rectangle57:setXradius(0);
    obj.rectangle57:setYradius(0);
    obj.rectangle57.grid.role = "row";
    obj.rectangle57.grid.width = 12;
    obj.rectangle57.grid["cnt-vert-align"] = "center";
    obj.rectangle57.grid["max-height"] = 23;
    obj.rectangle57.grid["margin-bottom"] = 5;
    obj.rectangle57.grid["margin-top"] = -5;
    obj.rectangle57.grid["margin-left"] = -5;
    obj.rectangle57.grid["margin-right"] = -5;
    obj.rectangle57:setName("rectangle57");
    lfm_setPropAsString(obj.rectangle57, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle57:setCornerType("round");
    obj.rectangle57:setStrokeColor("#343434");
    obj.rectangle57:setStrokeSize(2);
    obj.rectangle57.grid["padding-top"] = 5;
    obj.rectangle57.grid["padding-left"] = 8;
    obj.rectangle57.grid["padding-right"] = 8;
    obj.rectangle57.grid["padding-bottom"] = 5;

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle57);
    obj.label57:setText("ALCANCE DE COMANDO");
    obj.label57:setHorzTextAlign("leading");
    obj.label57:setFontSize(15);
    lfm_setPropAsString(obj.label57, "fontStyle", "bold");
    obj.label57.grid.role = "col";
    obj.label57:setFontColor("black");
    obj.label57.grid["dyn-width-txt"] = true;
    obj.label57:setName("label57");
    obj.label57:setHeight(25);

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle56);
    obj.layout93.grid.role = "col";
    obj.layout93.grid.width = 2;
    obj.layout93.grid["auto-height"] = true;
    obj.layout93.grid["cnt-horz-align"] = "middle";
    obj.layout93.grid["min-width"] = 35;
    obj.layout93:setName("layout93");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout93);
    lfm_setPropAsString(obj.rectangle58, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle58.grid.role = "col";
    obj.rectangle58.grid.width = 12;
    obj.rectangle58.grid["auto-height"] = true;
    obj.rectangle58:setXradius(10);
    obj.rectangle58:setYradius(10);
    obj.rectangle58:setCornerType("bevel");
    obj.rectangle58.grid["min-height"] = 30;
    obj.rectangle58.grid["margin-bottom"] = 0;
    obj.rectangle58:setName("rectangle58");
    obj.rectangle58:setStrokeColor("#343434");
    obj.rectangle58:setStrokeSize(2);
    obj.rectangle58:setColor("#1f1e1e");
    obj.rectangle58.grid["padding-top"] = 5;
    obj.rectangle58.grid["padding-left"] = 8;
    obj.rectangle58.grid["padding-right"] = 8;
    obj.rectangle58.grid["padding-bottom"] = 5;

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.rectangle58);
    obj.edit59:setField("cam_INT");
    obj.edit59:setTransparent(true);
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setVertTextAlign("center");
    obj.edit59.grid.role = "col";
    obj.edit59.grid.width = 12;
    obj.edit59:setFontSize(15);
    obj.edit59:setName("edit59");
    obj.edit59:setHeight(25);

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout93);
    obj.label58:setText("INT");
    obj.label58:setVertTextAlign("trailing");
    obj.label58:setHorzTextAlign("center");
    obj.label58.grid.role = "col";
    obj.label58.grid.width = 12;
    obj.label58:setFontSize(10);
    obj.label58:setTextTrimming("none");
    obj.label58:setWordWrap(true);
    obj.label58:setName("label58");
    obj.label58:setFontColor("#b5b5b5");
    obj.label58:setHeight(25);

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.rectangle56);
    obj.layout94.grid.role = "col";
    obj.layout94.grid.width = 2;
    obj.layout94.grid["auto-height"] = true;
    obj.layout94.grid["cnt-horz-align"] = "middle";
    obj.layout94.grid["min-width"] = 35;
    obj.layout94:setName("layout94");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout94);
    lfm_setPropAsString(obj.rectangle59, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle59.grid.role = "col";
    obj.rectangle59.grid.width = 12;
    obj.rectangle59.grid["auto-height"] = true;
    obj.rectangle59:setXradius(10);
    obj.rectangle59:setYradius(10);
    obj.rectangle59:setCornerType("bevel");
    obj.rectangle59.grid["min-height"] = 30;
    obj.rectangle59.grid["margin-bottom"] = 0;
    obj.rectangle59:setName("rectangle59");
    obj.rectangle59:setStrokeColor("#343434");
    obj.rectangle59:setStrokeSize(2);
    obj.rectangle59:setColor("#1f1e1e");
    obj.rectangle59.grid["padding-top"] = 5;
    obj.rectangle59.grid["padding-left"] = 8;
    obj.rectangle59.grid["padding-right"] = 8;
    obj.rectangle59.grid["padding-bottom"] = 5;

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.rectangle59);
    obj.edit60:setField("cam_COMANDAR");
    obj.edit60:setTransparent(true);
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setVertTextAlign("center");
    obj.edit60.grid.role = "col";
    obj.edit60.grid.width = 12;
    obj.edit60:setFontSize(15);
    obj.edit60:setName("edit60");
    obj.edit60:setHeight(25);

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout94);
    obj.label59:setText("COMANDAR");
    obj.label59:setVertTextAlign("trailing");
    obj.label59:setHorzTextAlign("center");
    obj.label59.grid.role = "col";
    obj.label59.grid.width = 12;
    obj.label59:setFontSize(10);
    obj.label59:setTextTrimming("none");
    obj.label59:setWordWrap(true);
    obj.label59:setName("label59");
    obj.label59:setFontColor("#b5b5b5");
    obj.label59:setHeight(25);

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.rectangle56);
    obj.layout95.grid.role = "col";
    obj.layout95.grid.width = 2;
    obj.layout95.grid["auto-height"] = true;
    obj.layout95.grid["cnt-horz-align"] = "middle";
    obj.layout95.grid["min-width"] = 35;
    obj.layout95:setName("layout95");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout95);
    lfm_setPropAsString(obj.rectangle60, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle60.grid.role = "col";
    obj.rectangle60.grid.width = 12;
    obj.rectangle60.grid["auto-height"] = true;
    obj.rectangle60:setXradius(10);
    obj.rectangle60:setYradius(10);
    obj.rectangle60:setCornerType("bevel");
    obj.rectangle60.grid["min-height"] = 30;
    obj.rectangle60.grid["margin-bottom"] = 0;
    obj.rectangle60:setName("rectangle60");
    obj.rectangle60:setStrokeColor("#343434");
    obj.rectangle60:setStrokeSize(2);
    obj.rectangle60:setColor("#1f1e1e");
    obj.rectangle60.grid["padding-top"] = 5;
    obj.rectangle60.grid["padding-left"] = 8;
    obj.rectangle60.grid["padding-right"] = 8;
    obj.rectangle60.grid["padding-bottom"] = 5;

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.rectangle60);
    obj.edit61:setField("cam_OUTRO");
    obj.edit61:setTransparent(true);
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setVertTextAlign("center");
    obj.edit61.grid.role = "col";
    obj.edit61.grid.width = 12;
    obj.edit61:setFontSize(15);
    obj.edit61:setName("edit61");
    obj.edit61:setHeight(25);

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout95);
    obj.label60:setText("OUTRO");
    obj.label60:setVertTextAlign("trailing");
    obj.label60:setHorzTextAlign("center");
    obj.label60.grid.role = "col";
    obj.label60.grid.width = 12;
    obj.label60:setFontSize(10);
    obj.label60:setTextTrimming("none");
    obj.label60:setWordWrap(true);
    obj.label60:setName("label60");
    obj.label60:setFontColor("#b5b5b5");
    obj.label60:setHeight(25);

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle56);
    obj.label61:setText("=");
    obj.label61.grid.role = "col";
    obj.label61.grid.width = 1;
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");
    obj.label61:setFontColor("#b5b5b5");
    obj.label61:setHeight(25);

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle56);
    obj.layout96.grid.role = "col";
    obj.layout96.grid.width = 3;
    obj.layout96.grid["auto-height"] = true;
    obj.layout96.grid["cnt-horz-align"] = "middle";
    obj.layout96.grid["cnt-vert-align"] = "bottom";
    obj.layout96:setName("layout96");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout96);
    lfm_setPropAsString(obj.rectangle61, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle61.grid.role = "col";
    obj.rectangle61.grid.width = 12;
    obj.rectangle61.grid["auto-height"] = true;
    obj.rectangle61.grid["min-width"] = 30;
    obj.rectangle61:setName("rectangle61");
    obj.rectangle61:setCornerType("round");
    obj.rectangle61:setXradius(15);
    obj.rectangle61:setYradius(15);
    obj.rectangle61:setStrokeColor("#343434");
    obj.rectangle61:setStrokeSize(2);
    obj.rectangle61:setColor("#1f1e1e");
    obj.rectangle61.grid["padding-top"] = 5;
    obj.rectangle61.grid["padding-left"] = 8;
    obj.rectangle61.grid["padding-right"] = 8;
    obj.rectangle61.grid["padding-bottom"] = 5;

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.rectangle61);
    obj.edit62:setField("cam_ARMADURA or 0");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setTransparent(true);
    obj.edit62.grid.role = "col";
    obj.edit62.grid.width = 12;
    obj.edit62:setFontSize(20);
    obj.edit62:setName("edit62");
    obj.edit62:setHeight(25);

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout96);
    obj.button18:setText("ARMADURA");
    obj.button18:setHorzTextAlign("center");
    obj.button18.grid.role = "col";
    obj.button18.grid.width = 12;
    obj.button18:setFontSize(10);
    obj.button18:setName("button18");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout1);
    obj.layout97.grid.role = "col";
    obj.layout97.grid.width = 4;
    obj.layout97.grid["auto-height"] = true;
    obj.layout97:setName("layout97");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout97);
    obj.rectangle62.grid.role = "col";
    obj.rectangle62.grid.width = 12;
    obj.rectangle62.grid["auto-height"] = true;
    obj.rectangle62.grid["max-height"] = 400;
    obj.rectangle62:setName("rectangle62");
    lfm_setPropAsString(obj.rectangle62, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle62:setCornerType("round");
    obj.rectangle62:setXradius(15);
    obj.rectangle62:setYradius(15);
    obj.rectangle62:setStrokeColor("#343434");
    obj.rectangle62:setStrokeSize(2);
    obj.rectangle62:setColor("#1f1e1e");
    obj.rectangle62.grid["padding-top"] = 5;
    obj.rectangle62.grid["padding-left"] = 8;
    obj.rectangle62.grid["padding-right"] = 8;
    obj.rectangle62.grid["padding-bottom"] = 5;

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.rectangle62);
    obj.rectangle63:setColor("grey");
    obj.rectangle63:setXradius(0);
    obj.rectangle63:setYradius(0);
    obj.rectangle63.grid.role = "row";
    obj.rectangle63.grid.width = 12;
    obj.rectangle63.grid["cnt-vert-align"] = "center";
    obj.rectangle63.grid["max-height"] = 23;
    obj.rectangle63.grid["margin-bottom"] = 5;
    obj.rectangle63.grid["margin-top"] = -5;
    obj.rectangle63.grid["margin-left"] = -5;
    obj.rectangle63.grid["margin-right"] = -5;
    obj.rectangle63:setName("rectangle63");
    lfm_setPropAsString(obj.rectangle63, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle63:setCornerType("round");
    obj.rectangle63:setStrokeColor("#343434");
    obj.rectangle63:setStrokeSize(2);
    obj.rectangle63.grid["padding-top"] = 5;
    obj.rectangle63.grid["padding-left"] = 8;
    obj.rectangle63.grid["padding-right"] = 8;
    obj.rectangle63.grid["padding-bottom"] = 5;

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle63);
    obj.label62:setText("PERÍCIAS");
    obj.label62:setHorzTextAlign("leading");
    obj.label62:setFontSize(15);
    lfm_setPropAsString(obj.label62, "fontStyle", "bold");
    obj.label62.grid.role = "col";
    obj.label62:setFontColor("black");
    obj.label62.grid["dyn-width-txt"] = true;
    obj.label62:setName("label62");
    obj.label62:setHeight(25);

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle62);
    obj.label63:setHorzTextAlign("leading");
    obj.label63:setText("Pericia");
    obj.label63.grid.role = "col";
    obj.label63.grid.width = 4;
    obj.label63:setName("label63");
    obj.label63:setFontColor("#b5b5b5");
    obj.label63:setHeight(25);

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle62);
    obj.label64:setHorzTextAlign("leading");
    obj.label64:setText("Chave");
    obj.label64.grid.role = "col";
    obj.label64.grid.width = 2;
    obj.label64:setName("label64");
    obj.label64:setFontColor("#b5b5b5");
    obj.label64:setHeight(25);

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle62);
    obj.label65:setHorzTextAlign("leading");
    obj.label65:setText("ATR");
    obj.label65.grid.role = "col";
    obj.label65.grid.width = 2;
    obj.label65:setName("label65");
    obj.label65:setFontColor("#b5b5b5");
    obj.label65:setHeight(25);

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle62);
    obj.label66:setHorzTextAlign("leading");
    obj.label66:setText("NIV");
    obj.label66.grid.role = "col";
    obj.label66.grid.width = 2;
    obj.label66:setName("label66");
    obj.label66:setFontColor("#b5b5b5");
    obj.label66:setHeight(25);

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle62);
    obj.label67:setHorzTextAlign("leading");
    obj.label67:setText("O");
    obj.label67.grid.role = "col";
    obj.label67.grid.width = 1;
    obj.label67:setName("label67");
    obj.label67:setFontColor("#b5b5b5");
    obj.label67:setHeight(25);

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle62);
    obj.label68:setHorzTextAlign("leading");
    obj.label68:setText("");
    obj.label68.grid.role = "col";
    obj.label68.grid.width = 1;
    obj.label68:setName("label68");
    obj.label68:setFontColor("#b5b5b5");
    obj.label68:setHeight(25);

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.rectangle62);
    obj.scrollBox2.grid.role = "col";
    obj.scrollBox2.grid.width = 12;
    obj.scrollBox2.grid["min-height"] = 350;
    obj.scrollBox2:setName("scrollBox2");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.scrollBox2);
    obj.layout98.grid.role = "row";
    obj.layout98.grid.width = 12;
    obj.layout98.grid["auto-height"] = true;
    obj.layout98:setName("layout98");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout98);
    obj.edit63:setTransparent(true);
    obj.edit63:setField("");
    obj.edit63.grid.role = "col";
    obj.edit63.grid.width = 4;
    obj.edit63:setHorzTextAlign("leading");
    obj.edit63:setName("edit63");
    obj.edit63:setHeight(25);

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout98);
    obj.comboBox3:setTransparent(true);
    obj.comboBox3:setField("cha_");
    obj.comboBox3:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox3.grid.role = "col";
    obj.comboBox3.grid.width = 2;
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setName("comboBox3");
    obj.comboBox3:setHeight(25);

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout98);
    obj.edit64:setTransparent(true);
    obj.edit64:setField("valAtr_");
    obj.edit64.grid.role = "col";
    obj.edit64.grid.width = 2;
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");
    obj.edit64:setHeight(25);

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout98);
    obj.edit65:setTransparent(true);
    obj.edit65:setField("nivel_");
    obj.edit65.grid.role = "col";
    obj.edit65.grid.width = 2;
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");
    obj.edit65:setHeight(25);

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout98);
    obj.edit66:setTransparent(true);
    obj.edit66:setField("outro_");
    obj.edit66.grid.role = "col";
    obj.edit66.grid.width = 1;
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setName("edit66");
    obj.edit66:setHeight(25);

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout98);
    obj.button19.grid.role = "col";
    obj.button19.grid.width = 1;
    obj.button19:setText("🎲");
    obj.button19:setName("button19");

    obj.horzLine22 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine22:setParent(obj.layout98);
    obj.horzLine22.grid.role = "row";
    obj.horzLine22:setName("horzLine22");
    obj.horzLine22:setStrokeColor("grey");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.scrollBox2);
    obj.layout99.grid.role = "row";
    obj.layout99.grid.width = 12;
    obj.layout99.grid["auto-height"] = true;
    obj.layout99:setName("layout99");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout99);
    obj.edit67:setTransparent(true);
    obj.edit67:setField("");
    obj.edit67.grid.role = "col";
    obj.edit67.grid.width = 4;
    obj.edit67:setHorzTextAlign("leading");
    obj.edit67:setName("edit67");
    obj.edit67:setHeight(25);

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout99);
    obj.comboBox4:setTransparent(true);
    obj.comboBox4:setField("cha_");
    obj.comboBox4:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox4.grid.role = "col";
    obj.comboBox4.grid.width = 2;
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setName("comboBox4");
    obj.comboBox4:setHeight(25);

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout99);
    obj.edit68:setTransparent(true);
    obj.edit68:setField("valAtr_");
    obj.edit68.grid.role = "col";
    obj.edit68.grid.width = 2;
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setName("edit68");
    obj.edit68:setHeight(25);

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout99);
    obj.edit69:setTransparent(true);
    obj.edit69:setField("nivel_");
    obj.edit69.grid.role = "col";
    obj.edit69.grid.width = 2;
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setName("edit69");
    obj.edit69:setHeight(25);

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout99);
    obj.edit70:setTransparent(true);
    obj.edit70:setField("outro_");
    obj.edit70.grid.role = "col";
    obj.edit70.grid.width = 1;
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setName("edit70");
    obj.edit70:setHeight(25);

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout99);
    obj.button20.grid.role = "col";
    obj.button20.grid.width = 1;
    obj.button20:setText("🎲");
    obj.button20:setName("button20");

    obj.horzLine23 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine23:setParent(obj.layout99);
    obj.horzLine23.grid.role = "row";
    obj.horzLine23:setName("horzLine23");
    obj.horzLine23:setStrokeColor("grey");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.scrollBox2);
    obj.layout100.grid.role = "row";
    obj.layout100.grid.width = 12;
    obj.layout100.grid["auto-height"] = true;
    obj.layout100:setName("layout100");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout100);
    obj.edit71:setTransparent(true);
    obj.edit71:setField("");
    obj.edit71.grid.role = "col";
    obj.edit71.grid.width = 4;
    obj.edit71:setHorzTextAlign("leading");
    obj.edit71:setName("edit71");
    obj.edit71:setHeight(25);

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout100);
    obj.comboBox5:setTransparent(true);
    obj.comboBox5:setField("cha_");
    obj.comboBox5:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox5.grid.role = "col";
    obj.comboBox5.grid.width = 2;
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setName("comboBox5");
    obj.comboBox5:setHeight(25);

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout100);
    obj.edit72:setTransparent(true);
    obj.edit72:setField("valAtr_");
    obj.edit72.grid.role = "col";
    obj.edit72.grid.width = 2;
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setName("edit72");
    obj.edit72:setHeight(25);

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout100);
    obj.edit73:setTransparent(true);
    obj.edit73:setField("nivel_");
    obj.edit73.grid.role = "col";
    obj.edit73.grid.width = 2;
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setName("edit73");
    obj.edit73:setHeight(25);

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout100);
    obj.edit74:setTransparent(true);
    obj.edit74:setField("outro_");
    obj.edit74.grid.role = "col";
    obj.edit74.grid.width = 1;
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setName("edit74");
    obj.edit74:setHeight(25);

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout100);
    obj.button21.grid.role = "col";
    obj.button21.grid.width = 1;
    obj.button21:setText("🎲");
    obj.button21:setName("button21");

    obj.horzLine24 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine24:setParent(obj.layout100);
    obj.horzLine24.grid.role = "row";
    obj.horzLine24:setName("horzLine24");
    obj.horzLine24:setStrokeColor("grey");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.scrollBox2);
    obj.layout101.grid.role = "row";
    obj.layout101.grid.width = 12;
    obj.layout101.grid["auto-height"] = true;
    obj.layout101:setName("layout101");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout101);
    obj.edit75:setTransparent(true);
    obj.edit75:setField("");
    obj.edit75.grid.role = "col";
    obj.edit75.grid.width = 4;
    obj.edit75:setHorzTextAlign("leading");
    obj.edit75:setName("edit75");
    obj.edit75:setHeight(25);

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout101);
    obj.comboBox6:setTransparent(true);
    obj.comboBox6:setField("cha_");
    obj.comboBox6:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox6.grid.role = "col";
    obj.comboBox6.grid.width = 2;
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setName("comboBox6");
    obj.comboBox6:setHeight(25);

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout101);
    obj.edit76:setTransparent(true);
    obj.edit76:setField("valAtr_");
    obj.edit76.grid.role = "col";
    obj.edit76.grid.width = 2;
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setName("edit76");
    obj.edit76:setHeight(25);

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout101);
    obj.edit77:setTransparent(true);
    obj.edit77:setField("nivel_");
    obj.edit77.grid.role = "col";
    obj.edit77.grid.width = 2;
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");
    obj.edit77:setHeight(25);

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout101);
    obj.edit78:setTransparent(true);
    obj.edit78:setField("outro_");
    obj.edit78.grid.role = "col";
    obj.edit78.grid.width = 1;
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setName("edit78");
    obj.edit78:setHeight(25);

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout101);
    obj.button22.grid.role = "col";
    obj.button22.grid.width = 1;
    obj.button22:setText("🎲");
    obj.button22:setName("button22");

    obj.horzLine25 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine25:setParent(obj.layout101);
    obj.horzLine25.grid.role = "row";
    obj.horzLine25:setName("horzLine25");
    obj.horzLine25:setStrokeColor("grey");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.scrollBox2);
    obj.layout102.grid.role = "row";
    obj.layout102.grid.width = 12;
    obj.layout102.grid["auto-height"] = true;
    obj.layout102:setName("layout102");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout102);
    obj.edit79:setTransparent(true);
    obj.edit79:setField("");
    obj.edit79.grid.role = "col";
    obj.edit79.grid.width = 4;
    obj.edit79:setHorzTextAlign("leading");
    obj.edit79:setName("edit79");
    obj.edit79:setHeight(25);

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout102);
    obj.comboBox7:setTransparent(true);
    obj.comboBox7:setField("cha_");
    obj.comboBox7:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox7.grid.role = "col";
    obj.comboBox7.grid.width = 2;
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setName("comboBox7");
    obj.comboBox7:setHeight(25);

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout102);
    obj.edit80:setTransparent(true);
    obj.edit80:setField("valAtr_");
    obj.edit80.grid.role = "col";
    obj.edit80.grid.width = 2;
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setName("edit80");
    obj.edit80:setHeight(25);

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout102);
    obj.edit81:setTransparent(true);
    obj.edit81:setField("nivel_");
    obj.edit81.grid.role = "col";
    obj.edit81.grid.width = 2;
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setName("edit81");
    obj.edit81:setHeight(25);

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout102);
    obj.edit82:setTransparent(true);
    obj.edit82:setField("outro_");
    obj.edit82.grid.role = "col";
    obj.edit82.grid.width = 1;
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setName("edit82");
    obj.edit82:setHeight(25);

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout102);
    obj.button23.grid.role = "col";
    obj.button23.grid.width = 1;
    obj.button23:setText("🎲");
    obj.button23:setName("button23");

    obj.horzLine26 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine26:setParent(obj.layout102);
    obj.horzLine26.grid.role = "row";
    obj.horzLine26:setName("horzLine26");
    obj.horzLine26:setStrokeColor("grey");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.scrollBox2);
    obj.layout103.grid.role = "row";
    obj.layout103.grid.width = 12;
    obj.layout103.grid["auto-height"] = true;
    obj.layout103:setName("layout103");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout103);
    obj.edit83:setTransparent(true);
    obj.edit83:setField("");
    obj.edit83.grid.role = "col";
    obj.edit83.grid.width = 4;
    obj.edit83:setHorzTextAlign("leading");
    obj.edit83:setName("edit83");
    obj.edit83:setHeight(25);

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout103);
    obj.comboBox8:setTransparent(true);
    obj.comboBox8:setField("cha_");
    obj.comboBox8:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox8.grid.role = "col";
    obj.comboBox8.grid.width = 2;
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setName("comboBox8");
    obj.comboBox8:setHeight(25);

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout103);
    obj.edit84:setTransparent(true);
    obj.edit84:setField("valAtr_");
    obj.edit84.grid.role = "col";
    obj.edit84.grid.width = 2;
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setName("edit84");
    obj.edit84:setHeight(25);

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout103);
    obj.edit85:setTransparent(true);
    obj.edit85:setField("nivel_");
    obj.edit85.grid.role = "col";
    obj.edit85.grid.width = 2;
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setName("edit85");
    obj.edit85:setHeight(25);

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout103);
    obj.edit86:setTransparent(true);
    obj.edit86:setField("outro_");
    obj.edit86.grid.role = "col";
    obj.edit86.grid.width = 1;
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setName("edit86");
    obj.edit86:setHeight(25);

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout103);
    obj.button24.grid.role = "col";
    obj.button24.grid.width = 1;
    obj.button24:setText("🎲");
    obj.button24:setName("button24");

    obj.horzLine27 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine27:setParent(obj.layout103);
    obj.horzLine27.grid.role = "row";
    obj.horzLine27:setName("horzLine27");
    obj.horzLine27:setStrokeColor("grey");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.scrollBox2);
    obj.layout104.grid.role = "row";
    obj.layout104.grid.width = 12;
    obj.layout104.grid["auto-height"] = true;
    obj.layout104:setName("layout104");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout104);
    obj.edit87:setTransparent(true);
    obj.edit87:setField("");
    obj.edit87.grid.role = "col";
    obj.edit87.grid.width = 4;
    obj.edit87:setHorzTextAlign("leading");
    obj.edit87:setName("edit87");
    obj.edit87:setHeight(25);

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout104);
    obj.comboBox9:setTransparent(true);
    obj.comboBox9:setField("cha_");
    obj.comboBox9:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox9.grid.role = "col";
    obj.comboBox9.grid.width = 2;
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setName("comboBox9");
    obj.comboBox9:setHeight(25);

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout104);
    obj.edit88:setTransparent(true);
    obj.edit88:setField("valAtr_");
    obj.edit88.grid.role = "col";
    obj.edit88.grid.width = 2;
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setName("edit88");
    obj.edit88:setHeight(25);

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout104);
    obj.edit89:setTransparent(true);
    obj.edit89:setField("nivel_");
    obj.edit89.grid.role = "col";
    obj.edit89.grid.width = 2;
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");
    obj.edit89:setHeight(25);

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout104);
    obj.edit90:setTransparent(true);
    obj.edit90:setField("outro_");
    obj.edit90.grid.role = "col";
    obj.edit90.grid.width = 1;
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");
    obj.edit90:setHeight(25);

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout104);
    obj.button25.grid.role = "col";
    obj.button25.grid.width = 1;
    obj.button25:setText("🎲");
    obj.button25:setName("button25");

    obj.horzLine28 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine28:setParent(obj.layout104);
    obj.horzLine28.grid.role = "row";
    obj.horzLine28:setName("horzLine28");
    obj.horzLine28:setStrokeColor("grey");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.scrollBox2);
    obj.layout105.grid.role = "row";
    obj.layout105.grid.width = 12;
    obj.layout105.grid["auto-height"] = true;
    obj.layout105:setName("layout105");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout105);
    obj.edit91:setTransparent(true);
    obj.edit91:setField("");
    obj.edit91.grid.role = "col";
    obj.edit91.grid.width = 4;
    obj.edit91:setHorzTextAlign("leading");
    obj.edit91:setName("edit91");
    obj.edit91:setHeight(25);

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout105);
    obj.comboBox10:setTransparent(true);
    obj.comboBox10:setField("cha_");
    obj.comboBox10:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox10.grid.role = "col";
    obj.comboBox10.grid.width = 2;
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setName("comboBox10");
    obj.comboBox10:setHeight(25);

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout105);
    obj.edit92:setTransparent(true);
    obj.edit92:setField("valAtr_");
    obj.edit92.grid.role = "col";
    obj.edit92.grid.width = 2;
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");
    obj.edit92:setHeight(25);

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout105);
    obj.edit93:setTransparent(true);
    obj.edit93:setField("nivel_");
    obj.edit93.grid.role = "col";
    obj.edit93.grid.width = 2;
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setName("edit93");
    obj.edit93:setHeight(25);

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout105);
    obj.edit94:setTransparent(true);
    obj.edit94:setField("outro_");
    obj.edit94.grid.role = "col";
    obj.edit94.grid.width = 1;
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setName("edit94");
    obj.edit94:setHeight(25);

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout105);
    obj.button26.grid.role = "col";
    obj.button26.grid.width = 1;
    obj.button26:setText("🎲");
    obj.button26:setName("button26");

    obj.horzLine29 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine29:setParent(obj.layout105);
    obj.horzLine29.grid.role = "row";
    obj.horzLine29:setName("horzLine29");
    obj.horzLine29:setStrokeColor("grey");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.scrollBox2);
    obj.layout106.grid.role = "row";
    obj.layout106.grid.width = 12;
    obj.layout106.grid["auto-height"] = true;
    obj.layout106:setName("layout106");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout106);
    obj.edit95:setTransparent(true);
    obj.edit95:setField("");
    obj.edit95.grid.role = "col";
    obj.edit95.grid.width = 4;
    obj.edit95:setHorzTextAlign("leading");
    obj.edit95:setName("edit95");
    obj.edit95:setHeight(25);

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.layout106);
    obj.comboBox11:setTransparent(true);
    obj.comboBox11:setField("cha_");
    obj.comboBox11:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox11.grid.role = "col";
    obj.comboBox11.grid.width = 2;
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setName("comboBox11");
    obj.comboBox11:setHeight(25);

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout106);
    obj.edit96:setTransparent(true);
    obj.edit96:setField("valAtr_");
    obj.edit96.grid.role = "col";
    obj.edit96.grid.width = 2;
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setName("edit96");
    obj.edit96:setHeight(25);

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout106);
    obj.edit97:setTransparent(true);
    obj.edit97:setField("nivel_");
    obj.edit97.grid.role = "col";
    obj.edit97.grid.width = 2;
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setName("edit97");
    obj.edit97:setHeight(25);

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout106);
    obj.edit98:setTransparent(true);
    obj.edit98:setField("outro_");
    obj.edit98.grid.role = "col";
    obj.edit98.grid.width = 1;
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setName("edit98");
    obj.edit98:setHeight(25);

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout106);
    obj.button27.grid.role = "col";
    obj.button27.grid.width = 1;
    obj.button27:setText("🎲");
    obj.button27:setName("button27");

    obj.horzLine30 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine30:setParent(obj.layout106);
    obj.horzLine30.grid.role = "row";
    obj.horzLine30:setName("horzLine30");
    obj.horzLine30:setStrokeColor("grey");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.scrollBox2);
    obj.layout107.grid.role = "row";
    obj.layout107.grid.width = 12;
    obj.layout107.grid["auto-height"] = true;
    obj.layout107:setName("layout107");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout107);
    obj.edit99:setTransparent(true);
    obj.edit99:setField("");
    obj.edit99.grid.role = "col";
    obj.edit99.grid.width = 4;
    obj.edit99:setHorzTextAlign("leading");
    obj.edit99:setName("edit99");
    obj.edit99:setHeight(25);

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.layout107);
    obj.comboBox12:setTransparent(true);
    obj.comboBox12:setField("cha_");
    obj.comboBox12:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox12.grid.role = "col";
    obj.comboBox12.grid.width = 2;
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setName("comboBox12");
    obj.comboBox12:setHeight(25);

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout107);
    obj.edit100:setTransparent(true);
    obj.edit100:setField("valAtr_");
    obj.edit100.grid.role = "col";
    obj.edit100.grid.width = 2;
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setName("edit100");
    obj.edit100:setHeight(25);

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout107);
    obj.edit101:setTransparent(true);
    obj.edit101:setField("nivel_");
    obj.edit101.grid.role = "col";
    obj.edit101.grid.width = 2;
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setName("edit101");
    obj.edit101:setHeight(25);

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout107);
    obj.edit102:setTransparent(true);
    obj.edit102:setField("outro_");
    obj.edit102.grid.role = "col";
    obj.edit102.grid.width = 1;
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setName("edit102");
    obj.edit102:setHeight(25);

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout107);
    obj.button28.grid.role = "col";
    obj.button28.grid.width = 1;
    obj.button28:setText("🎲");
    obj.button28:setName("button28");

    obj.horzLine31 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine31:setParent(obj.layout107);
    obj.horzLine31.grid.role = "row";
    obj.horzLine31:setName("horzLine31");
    obj.horzLine31:setStrokeColor("grey");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.scrollBox2);
    obj.layout108.grid.role = "row";
    obj.layout108.grid.width = 12;
    obj.layout108.grid["auto-height"] = true;
    obj.layout108:setName("layout108");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout108);
    obj.edit103:setTransparent(true);
    obj.edit103:setField("");
    obj.edit103.grid.role = "col";
    obj.edit103.grid.width = 4;
    obj.edit103:setHorzTextAlign("leading");
    obj.edit103:setName("edit103");
    obj.edit103:setHeight(25);

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.layout108);
    obj.comboBox13:setTransparent(true);
    obj.comboBox13:setField("cha_");
    obj.comboBox13:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox13.grid.role = "col";
    obj.comboBox13.grid.width = 2;
    obj.comboBox13:setHorzTextAlign("center");
    obj.comboBox13:setName("comboBox13");
    obj.comboBox13:setHeight(25);

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout108);
    obj.edit104:setTransparent(true);
    obj.edit104:setField("valAtr_");
    obj.edit104.grid.role = "col";
    obj.edit104.grid.width = 2;
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setName("edit104");
    obj.edit104:setHeight(25);

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout108);
    obj.edit105:setTransparent(true);
    obj.edit105:setField("nivel_");
    obj.edit105.grid.role = "col";
    obj.edit105.grid.width = 2;
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setName("edit105");
    obj.edit105:setHeight(25);

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout108);
    obj.edit106:setTransparent(true);
    obj.edit106:setField("outro_");
    obj.edit106.grid.role = "col";
    obj.edit106.grid.width = 1;
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setName("edit106");
    obj.edit106:setHeight(25);

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout108);
    obj.button29.grid.role = "col";
    obj.button29.grid.width = 1;
    obj.button29:setText("🎲");
    obj.button29:setName("button29");

    obj.horzLine32 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine32:setParent(obj.layout108);
    obj.horzLine32.grid.role = "row";
    obj.horzLine32:setName("horzLine32");
    obj.horzLine32:setStrokeColor("grey");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.scrollBox2);
    obj.layout109.grid.role = "row";
    obj.layout109.grid.width = 12;
    obj.layout109.grid["auto-height"] = true;
    obj.layout109:setName("layout109");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout109);
    obj.edit107:setTransparent(true);
    obj.edit107:setField("");
    obj.edit107.grid.role = "col";
    obj.edit107.grid.width = 4;
    obj.edit107:setHorzTextAlign("leading");
    obj.edit107:setName("edit107");
    obj.edit107:setHeight(25);

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout109);
    obj.comboBox14:setTransparent(true);
    obj.comboBox14:setField("cha_");
    obj.comboBox14:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox14.grid.role = "col";
    obj.comboBox14.grid.width = 2;
    obj.comboBox14:setHorzTextAlign("center");
    obj.comboBox14:setName("comboBox14");
    obj.comboBox14:setHeight(25);

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout109);
    obj.edit108:setTransparent(true);
    obj.edit108:setField("valAtr_");
    obj.edit108.grid.role = "col";
    obj.edit108.grid.width = 2;
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setName("edit108");
    obj.edit108:setHeight(25);

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout109);
    obj.edit109:setTransparent(true);
    obj.edit109:setField("nivel_");
    obj.edit109.grid.role = "col";
    obj.edit109.grid.width = 2;
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setName("edit109");
    obj.edit109:setHeight(25);

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout109);
    obj.edit110:setTransparent(true);
    obj.edit110:setField("outro_");
    obj.edit110.grid.role = "col";
    obj.edit110.grid.width = 1;
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setName("edit110");
    obj.edit110:setHeight(25);

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout109);
    obj.button30.grid.role = "col";
    obj.button30.grid.width = 1;
    obj.button30:setText("🎲");
    obj.button30:setName("button30");

    obj.horzLine33 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine33:setParent(obj.layout109);
    obj.horzLine33.grid.role = "row";
    obj.horzLine33:setName("horzLine33");
    obj.horzLine33:setStrokeColor("grey");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.scrollBox2);
    obj.layout110.grid.role = "row";
    obj.layout110.grid.width = 12;
    obj.layout110.grid["auto-height"] = true;
    obj.layout110:setName("layout110");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout110);
    obj.edit111:setTransparent(true);
    obj.edit111:setField("");
    obj.edit111.grid.role = "col";
    obj.edit111.grid.width = 4;
    obj.edit111:setHorzTextAlign("leading");
    obj.edit111:setName("edit111");
    obj.edit111:setHeight(25);

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout110);
    obj.comboBox15:setTransparent(true);
    obj.comboBox15:setField("cha_");
    obj.comboBox15:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox15.grid.role = "col";
    obj.comboBox15.grid.width = 2;
    obj.comboBox15:setHorzTextAlign("center");
    obj.comboBox15:setName("comboBox15");
    obj.comboBox15:setHeight(25);

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout110);
    obj.edit112:setTransparent(true);
    obj.edit112:setField("valAtr_");
    obj.edit112.grid.role = "col";
    obj.edit112.grid.width = 2;
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setName("edit112");
    obj.edit112:setHeight(25);

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout110);
    obj.edit113:setTransparent(true);
    obj.edit113:setField("nivel_");
    obj.edit113.grid.role = "col";
    obj.edit113.grid.width = 2;
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setName("edit113");
    obj.edit113:setHeight(25);

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout110);
    obj.edit114:setTransparent(true);
    obj.edit114:setField("outro_");
    obj.edit114.grid.role = "col";
    obj.edit114.grid.width = 1;
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setName("edit114");
    obj.edit114:setHeight(25);

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout110);
    obj.button31.grid.role = "col";
    obj.button31.grid.width = 1;
    obj.button31:setText("🎲");
    obj.button31:setName("button31");

    obj.horzLine34 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine34:setParent(obj.layout110);
    obj.horzLine34.grid.role = "row";
    obj.horzLine34:setName("horzLine34");
    obj.horzLine34:setStrokeColor("grey");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.scrollBox2);
    obj.layout111.grid.role = "row";
    obj.layout111.grid.width = 12;
    obj.layout111.grid["auto-height"] = true;
    obj.layout111:setName("layout111");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout111);
    obj.edit115:setTransparent(true);
    obj.edit115:setField("");
    obj.edit115.grid.role = "col";
    obj.edit115.grid.width = 4;
    obj.edit115:setHorzTextAlign("leading");
    obj.edit115:setName("edit115");
    obj.edit115:setHeight(25);

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout111);
    obj.comboBox16:setTransparent(true);
    obj.comboBox16:setField("cha_");
    obj.comboBox16:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox16.grid.role = "col";
    obj.comboBox16.grid.width = 2;
    obj.comboBox16:setHorzTextAlign("center");
    obj.comboBox16:setName("comboBox16");
    obj.comboBox16:setHeight(25);

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout111);
    obj.edit116:setTransparent(true);
    obj.edit116:setField("valAtr_");
    obj.edit116.grid.role = "col";
    obj.edit116.grid.width = 2;
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setName("edit116");
    obj.edit116:setHeight(25);

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout111);
    obj.edit117:setTransparent(true);
    obj.edit117:setField("nivel_");
    obj.edit117.grid.role = "col";
    obj.edit117.grid.width = 2;
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setName("edit117");
    obj.edit117:setHeight(25);

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout111);
    obj.edit118:setTransparent(true);
    obj.edit118:setField("outro_");
    obj.edit118.grid.role = "col";
    obj.edit118.grid.width = 1;
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setName("edit118");
    obj.edit118:setHeight(25);

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout111);
    obj.button32.grid.role = "col";
    obj.button32.grid.width = 1;
    obj.button32:setText("🎲");
    obj.button32:setName("button32");

    obj.horzLine35 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine35:setParent(obj.layout111);
    obj.horzLine35.grid.role = "row";
    obj.horzLine35:setName("horzLine35");
    obj.horzLine35:setStrokeColor("grey");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.scrollBox2);
    obj.layout112.grid.role = "row";
    obj.layout112.grid.width = 12;
    obj.layout112.grid["auto-height"] = true;
    obj.layout112:setName("layout112");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout112);
    obj.edit119:setTransparent(true);
    obj.edit119:setField("");
    obj.edit119.grid.role = "col";
    obj.edit119.grid.width = 4;
    obj.edit119:setHorzTextAlign("leading");
    obj.edit119:setName("edit119");
    obj.edit119:setHeight(25);

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout112);
    obj.comboBox17:setTransparent(true);
    obj.comboBox17:setField("cha_");
    obj.comboBox17:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox17.grid.role = "col";
    obj.comboBox17.grid.width = 2;
    obj.comboBox17:setHorzTextAlign("center");
    obj.comboBox17:setName("comboBox17");
    obj.comboBox17:setHeight(25);

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout112);
    obj.edit120:setTransparent(true);
    obj.edit120:setField("valAtr_");
    obj.edit120.grid.role = "col";
    obj.edit120.grid.width = 2;
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setName("edit120");
    obj.edit120:setHeight(25);

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout112);
    obj.edit121:setTransparent(true);
    obj.edit121:setField("nivel_");
    obj.edit121.grid.role = "col";
    obj.edit121.grid.width = 2;
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setName("edit121");
    obj.edit121:setHeight(25);

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout112);
    obj.edit122:setTransparent(true);
    obj.edit122:setField("outro_");
    obj.edit122.grid.role = "col";
    obj.edit122.grid.width = 1;
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setName("edit122");
    obj.edit122:setHeight(25);

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout112);
    obj.button33.grid.role = "col";
    obj.button33.grid.width = 1;
    obj.button33:setText("🎲");
    obj.button33:setName("button33");

    obj.horzLine36 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine36:setParent(obj.layout112);
    obj.horzLine36.grid.role = "row";
    obj.horzLine36:setName("horzLine36");
    obj.horzLine36:setStrokeColor("grey");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.scrollBox2);
    obj.layout113.grid.role = "row";
    obj.layout113.grid.width = 12;
    obj.layout113.grid["auto-height"] = true;
    obj.layout113:setName("layout113");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout113);
    obj.edit123:setTransparent(true);
    obj.edit123:setField("");
    obj.edit123.grid.role = "col";
    obj.edit123.grid.width = 4;
    obj.edit123:setHorzTextAlign("leading");
    obj.edit123:setName("edit123");
    obj.edit123:setHeight(25);

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout113);
    obj.comboBox18:setTransparent(true);
    obj.comboBox18:setField("cha_");
    obj.comboBox18:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox18.grid.role = "col";
    obj.comboBox18.grid.width = 2;
    obj.comboBox18:setHorzTextAlign("center");
    obj.comboBox18:setName("comboBox18");
    obj.comboBox18:setHeight(25);

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout113);
    obj.edit124:setTransparent(true);
    obj.edit124:setField("valAtr_");
    obj.edit124.grid.role = "col";
    obj.edit124.grid.width = 2;
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setName("edit124");
    obj.edit124:setHeight(25);

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout113);
    obj.edit125:setTransparent(true);
    obj.edit125:setField("nivel_");
    obj.edit125.grid.role = "col";
    obj.edit125.grid.width = 2;
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setName("edit125");
    obj.edit125:setHeight(25);

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout113);
    obj.edit126:setTransparent(true);
    obj.edit126:setField("outro_");
    obj.edit126.grid.role = "col";
    obj.edit126.grid.width = 1;
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setName("edit126");
    obj.edit126:setHeight(25);

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout113);
    obj.button34.grid.role = "col";
    obj.button34.grid.width = 1;
    obj.button34:setText("🎲");
    obj.button34:setName("button34");

    obj.horzLine37 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine37:setParent(obj.layout113);
    obj.horzLine37.grid.role = "row";
    obj.horzLine37:setName("horzLine37");
    obj.horzLine37:setStrokeColor("grey");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.scrollBox2);
    obj.layout114.grid.role = "row";
    obj.layout114.grid.width = 12;
    obj.layout114.grid["auto-height"] = true;
    obj.layout114:setName("layout114");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout114);
    obj.edit127:setTransparent(true);
    obj.edit127:setField("");
    obj.edit127.grid.role = "col";
    obj.edit127.grid.width = 4;
    obj.edit127:setHorzTextAlign("leading");
    obj.edit127:setName("edit127");
    obj.edit127:setHeight(25);

    obj.comboBox19 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout114);
    obj.comboBox19:setTransparent(true);
    obj.comboBox19:setField("cha_");
    obj.comboBox19:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox19.grid.role = "col";
    obj.comboBox19.grid.width = 2;
    obj.comboBox19:setHorzTextAlign("center");
    obj.comboBox19:setName("comboBox19");
    obj.comboBox19:setHeight(25);

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout114);
    obj.edit128:setTransparent(true);
    obj.edit128:setField("valAtr_");
    obj.edit128.grid.role = "col";
    obj.edit128.grid.width = 2;
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setName("edit128");
    obj.edit128:setHeight(25);

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout114);
    obj.edit129:setTransparent(true);
    obj.edit129:setField("nivel_");
    obj.edit129.grid.role = "col";
    obj.edit129.grid.width = 2;
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setName("edit129");
    obj.edit129:setHeight(25);

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout114);
    obj.edit130:setTransparent(true);
    obj.edit130:setField("outro_");
    obj.edit130.grid.role = "col";
    obj.edit130.grid.width = 1;
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setName("edit130");
    obj.edit130:setHeight(25);

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout114);
    obj.button35.grid.role = "col";
    obj.button35.grid.width = 1;
    obj.button35:setText("🎲");
    obj.button35:setName("button35");

    obj.horzLine38 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine38:setParent(obj.layout114);
    obj.horzLine38.grid.role = "row";
    obj.horzLine38:setName("horzLine38");
    obj.horzLine38:setStrokeColor("grey");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.scrollBox2);
    obj.layout115.grid.role = "row";
    obj.layout115.grid.width = 12;
    obj.layout115.grid["auto-height"] = true;
    obj.layout115:setName("layout115");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout115);
    obj.edit131:setTransparent(true);
    obj.edit131:setField("");
    obj.edit131.grid.role = "col";
    obj.edit131.grid.width = 4;
    obj.edit131:setHorzTextAlign("leading");
    obj.edit131:setName("edit131");
    obj.edit131:setHeight(25);

    obj.comboBox20 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout115);
    obj.comboBox20:setTransparent(true);
    obj.comboBox20:setField("cha_");
    obj.comboBox20:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox20.grid.role = "col";
    obj.comboBox20.grid.width = 2;
    obj.comboBox20:setHorzTextAlign("center");
    obj.comboBox20:setName("comboBox20");
    obj.comboBox20:setHeight(25);

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout115);
    obj.edit132:setTransparent(true);
    obj.edit132:setField("valAtr_");
    obj.edit132.grid.role = "col";
    obj.edit132.grid.width = 2;
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setName("edit132");
    obj.edit132:setHeight(25);

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout115);
    obj.edit133:setTransparent(true);
    obj.edit133:setField("nivel_");
    obj.edit133.grid.role = "col";
    obj.edit133.grid.width = 2;
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setName("edit133");
    obj.edit133:setHeight(25);

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout115);
    obj.edit134:setTransparent(true);
    obj.edit134:setField("outro_");
    obj.edit134.grid.role = "col";
    obj.edit134.grid.width = 1;
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setName("edit134");
    obj.edit134:setHeight(25);

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout115);
    obj.button36.grid.role = "col";
    obj.button36.grid.width = 1;
    obj.button36:setText("🎲");
    obj.button36:setName("button36");

    obj.horzLine39 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine39:setParent(obj.layout115);
    obj.horzLine39.grid.role = "row";
    obj.horzLine39:setName("horzLine39");
    obj.horzLine39:setStrokeColor("grey");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.scrollBox2);
    obj.layout116.grid.role = "row";
    obj.layout116.grid.width = 12;
    obj.layout116.grid["auto-height"] = true;
    obj.layout116:setName("layout116");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout116);
    obj.edit135:setTransparent(true);
    obj.edit135:setField("");
    obj.edit135.grid.role = "col";
    obj.edit135.grid.width = 4;
    obj.edit135:setHorzTextAlign("leading");
    obj.edit135:setName("edit135");
    obj.edit135:setHeight(25);

    obj.comboBox21 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout116);
    obj.comboBox21:setTransparent(true);
    obj.comboBox21:setField("cha_");
    obj.comboBox21:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox21.grid.role = "col";
    obj.comboBox21.grid.width = 2;
    obj.comboBox21:setHorzTextAlign("center");
    obj.comboBox21:setName("comboBox21");
    obj.comboBox21:setHeight(25);

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout116);
    obj.edit136:setTransparent(true);
    obj.edit136:setField("valAtr_");
    obj.edit136.grid.role = "col";
    obj.edit136.grid.width = 2;
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setName("edit136");
    obj.edit136:setHeight(25);

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout116);
    obj.edit137:setTransparent(true);
    obj.edit137:setField("nivel_");
    obj.edit137.grid.role = "col";
    obj.edit137.grid.width = 2;
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setName("edit137");
    obj.edit137:setHeight(25);

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout116);
    obj.edit138:setTransparent(true);
    obj.edit138:setField("outro_");
    obj.edit138.grid.role = "col";
    obj.edit138.grid.width = 1;
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setName("edit138");
    obj.edit138:setHeight(25);

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout116);
    obj.button37.grid.role = "col";
    obj.button37.grid.width = 1;
    obj.button37:setText("🎲");
    obj.button37:setName("button37");

    obj.horzLine40 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine40:setParent(obj.layout116);
    obj.horzLine40.grid.role = "row";
    obj.horzLine40:setName("horzLine40");
    obj.horzLine40:setStrokeColor("grey");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.scrollBox2);
    obj.layout117.grid.role = "row";
    obj.layout117.grid.width = 12;
    obj.layout117.grid["auto-height"] = true;
    obj.layout117:setName("layout117");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout117);
    obj.edit139:setTransparent(true);
    obj.edit139:setField("");
    obj.edit139.grid.role = "col";
    obj.edit139.grid.width = 4;
    obj.edit139:setHorzTextAlign("leading");
    obj.edit139:setName("edit139");
    obj.edit139:setHeight(25);

    obj.comboBox22 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox22:setParent(obj.layout117);
    obj.comboBox22:setTransparent(true);
    obj.comboBox22:setField("cha_");
    obj.comboBox22:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox22.grid.role = "col";
    obj.comboBox22.grid.width = 2;
    obj.comboBox22:setHorzTextAlign("center");
    obj.comboBox22:setName("comboBox22");
    obj.comboBox22:setHeight(25);

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout117);
    obj.edit140:setTransparent(true);
    obj.edit140:setField("valAtr_");
    obj.edit140.grid.role = "col";
    obj.edit140.grid.width = 2;
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setName("edit140");
    obj.edit140:setHeight(25);

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout117);
    obj.edit141:setTransparent(true);
    obj.edit141:setField("nivel_");
    obj.edit141.grid.role = "col";
    obj.edit141.grid.width = 2;
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setName("edit141");
    obj.edit141:setHeight(25);

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout117);
    obj.edit142:setTransparent(true);
    obj.edit142:setField("outro_");
    obj.edit142.grid.role = "col";
    obj.edit142.grid.width = 1;
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setName("edit142");
    obj.edit142:setHeight(25);

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout117);
    obj.button38.grid.role = "col";
    obj.button38.grid.width = 1;
    obj.button38:setText("🎲");
    obj.button38:setName("button38");

    obj.horzLine41 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine41:setParent(obj.layout117);
    obj.horzLine41.grid.role = "row";
    obj.horzLine41:setName("horzLine41");
    obj.horzLine41:setStrokeColor("grey");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.scrollBox2);
    obj.layout118.grid.role = "row";
    obj.layout118.grid.width = 12;
    obj.layout118.grid["auto-height"] = true;
    obj.layout118:setName("layout118");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout118);
    obj.edit143:setTransparent(true);
    obj.edit143:setField("");
    obj.edit143.grid.role = "col";
    obj.edit143.grid.width = 4;
    obj.edit143:setHorzTextAlign("leading");
    obj.edit143:setName("edit143");
    obj.edit143:setHeight(25);

    obj.comboBox23 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox23:setParent(obj.layout118);
    obj.comboBox23:setTransparent(true);
    obj.comboBox23:setField("cha_");
    obj.comboBox23:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox23.grid.role = "col";
    obj.comboBox23.grid.width = 2;
    obj.comboBox23:setHorzTextAlign("center");
    obj.comboBox23:setName("comboBox23");
    obj.comboBox23:setHeight(25);

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout118);
    obj.edit144:setTransparent(true);
    obj.edit144:setField("valAtr_");
    obj.edit144.grid.role = "col";
    obj.edit144.grid.width = 2;
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setName("edit144");
    obj.edit144:setHeight(25);

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout118);
    obj.edit145:setTransparent(true);
    obj.edit145:setField("nivel_");
    obj.edit145.grid.role = "col";
    obj.edit145.grid.width = 2;
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setName("edit145");
    obj.edit145:setHeight(25);

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout118);
    obj.edit146:setTransparent(true);
    obj.edit146:setField("outro_");
    obj.edit146.grid.role = "col";
    obj.edit146.grid.width = 1;
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setName("edit146");
    obj.edit146:setHeight(25);

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout118);
    obj.button39.grid.role = "col";
    obj.button39.grid.width = 1;
    obj.button39:setText("🎲");
    obj.button39:setName("button39");

    obj.horzLine42 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine42:setParent(obj.layout118);
    obj.horzLine42.grid.role = "row";
    obj.horzLine42:setName("horzLine42");
    obj.horzLine42:setStrokeColor("grey");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.scrollBox2);
    obj.layout119.grid.role = "row";
    obj.layout119.grid.width = 12;
    obj.layout119.grid["auto-height"] = true;
    obj.layout119:setName("layout119");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout119);
    obj.edit147:setTransparent(true);
    obj.edit147:setField("");
    obj.edit147.grid.role = "col";
    obj.edit147.grid.width = 4;
    obj.edit147:setHorzTextAlign("leading");
    obj.edit147:setName("edit147");
    obj.edit147:setHeight(25);

    obj.comboBox24 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox24:setParent(obj.layout119);
    obj.comboBox24:setTransparent(true);
    obj.comboBox24:setField("cha_");
    obj.comboBox24:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox24.grid.role = "col";
    obj.comboBox24.grid.width = 2;
    obj.comboBox24:setHorzTextAlign("center");
    obj.comboBox24:setName("comboBox24");
    obj.comboBox24:setHeight(25);

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout119);
    obj.edit148:setTransparent(true);
    obj.edit148:setField("valAtr_");
    obj.edit148.grid.role = "col";
    obj.edit148.grid.width = 2;
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setName("edit148");
    obj.edit148:setHeight(25);

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout119);
    obj.edit149:setTransparent(true);
    obj.edit149:setField("nivel_");
    obj.edit149.grid.role = "col";
    obj.edit149.grid.width = 2;
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setName("edit149");
    obj.edit149:setHeight(25);

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout119);
    obj.edit150:setTransparent(true);
    obj.edit150:setField("outro_");
    obj.edit150.grid.role = "col";
    obj.edit150.grid.width = 1;
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setName("edit150");
    obj.edit150:setHeight(25);

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout119);
    obj.button40.grid.role = "col";
    obj.button40.grid.width = 1;
    obj.button40:setText("🎲");
    obj.button40:setName("button40");

    obj.horzLine43 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine43:setParent(obj.layout119);
    obj.horzLine43.grid.role = "row";
    obj.horzLine43:setName("horzLine43");
    obj.horzLine43:setStrokeColor("grey");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.scrollBox2);
    obj.layout120.grid.role = "row";
    obj.layout120.grid.width = 12;
    obj.layout120.grid["auto-height"] = true;
    obj.layout120:setName("layout120");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout120);
    obj.edit151:setTransparent(true);
    obj.edit151:setField("");
    obj.edit151.grid.role = "col";
    obj.edit151.grid.width = 4;
    obj.edit151:setHorzTextAlign("leading");
    obj.edit151:setName("edit151");
    obj.edit151:setHeight(25);

    obj.comboBox25 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox25:setParent(obj.layout120);
    obj.comboBox25:setTransparent(true);
    obj.comboBox25:setField("cha_");
    obj.comboBox25:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox25.grid.role = "col";
    obj.comboBox25.grid.width = 2;
    obj.comboBox25:setHorzTextAlign("center");
    obj.comboBox25:setName("comboBox25");
    obj.comboBox25:setHeight(25);

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout120);
    obj.edit152:setTransparent(true);
    obj.edit152:setField("valAtr_");
    obj.edit152.grid.role = "col";
    obj.edit152.grid.width = 2;
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setName("edit152");
    obj.edit152:setHeight(25);

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout120);
    obj.edit153:setTransparent(true);
    obj.edit153:setField("nivel_");
    obj.edit153.grid.role = "col";
    obj.edit153.grid.width = 2;
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setName("edit153");
    obj.edit153:setHeight(25);

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout120);
    obj.edit154:setTransparent(true);
    obj.edit154:setField("outro_");
    obj.edit154.grid.role = "col";
    obj.edit154.grid.width = 1;
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setName("edit154");
    obj.edit154:setHeight(25);

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout120);
    obj.button41.grid.role = "col";
    obj.button41.grid.width = 1;
    obj.button41:setText("🎲");
    obj.button41:setName("button41");

    obj.horzLine44 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine44:setParent(obj.layout120);
    obj.horzLine44.grid.role = "row";
    obj.horzLine44:setName("horzLine44");
    obj.horzLine44:setStrokeColor("grey");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.scrollBox2);
    obj.layout121.grid.role = "row";
    obj.layout121.grid.width = 12;
    obj.layout121.grid["auto-height"] = true;
    obj.layout121:setName("layout121");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout121);
    obj.edit155:setTransparent(true);
    obj.edit155:setField("");
    obj.edit155.grid.role = "col";
    obj.edit155.grid.width = 4;
    obj.edit155:setHorzTextAlign("leading");
    obj.edit155:setName("edit155");
    obj.edit155:setHeight(25);

    obj.comboBox26 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox26:setParent(obj.layout121);
    obj.comboBox26:setTransparent(true);
    obj.comboBox26:setField("cha_");
    obj.comboBox26:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox26.grid.role = "col";
    obj.comboBox26.grid.width = 2;
    obj.comboBox26:setHorzTextAlign("center");
    obj.comboBox26:setName("comboBox26");
    obj.comboBox26:setHeight(25);

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout121);
    obj.edit156:setTransparent(true);
    obj.edit156:setField("valAtr_");
    obj.edit156.grid.role = "col";
    obj.edit156.grid.width = 2;
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setName("edit156");
    obj.edit156:setHeight(25);

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout121);
    obj.edit157:setTransparent(true);
    obj.edit157:setField("nivel_");
    obj.edit157.grid.role = "col";
    obj.edit157.grid.width = 2;
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setName("edit157");
    obj.edit157:setHeight(25);

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout121);
    obj.edit158:setTransparent(true);
    obj.edit158:setField("outro_");
    obj.edit158.grid.role = "col";
    obj.edit158.grid.width = 1;
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setName("edit158");
    obj.edit158:setHeight(25);

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout121);
    obj.button42.grid.role = "col";
    obj.button42.grid.width = 1;
    obj.button42:setText("🎲");
    obj.button42:setName("button42");

    obj.horzLine45 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine45:setParent(obj.layout121);
    obj.horzLine45.grid.role = "row";
    obj.horzLine45:setName("horzLine45");
    obj.horzLine45:setStrokeColor("grey");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.scrollBox2);
    obj.layout122.grid.role = "row";
    obj.layout122.grid.width = 12;
    obj.layout122.grid["auto-height"] = true;
    obj.layout122:setName("layout122");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout122);
    obj.edit159:setTransparent(true);
    obj.edit159:setField("");
    obj.edit159.grid.role = "col";
    obj.edit159.grid.width = 4;
    obj.edit159:setHorzTextAlign("leading");
    obj.edit159:setName("edit159");
    obj.edit159:setHeight(25);

    obj.comboBox27 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox27:setParent(obj.layout122);
    obj.comboBox27:setTransparent(true);
    obj.comboBox27:setField("cha_");
    obj.comboBox27:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox27.grid.role = "col";
    obj.comboBox27.grid.width = 2;
    obj.comboBox27:setHorzTextAlign("center");
    obj.comboBox27:setName("comboBox27");
    obj.comboBox27:setHeight(25);

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout122);
    obj.edit160:setTransparent(true);
    obj.edit160:setField("valAtr_");
    obj.edit160.grid.role = "col";
    obj.edit160.grid.width = 2;
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setName("edit160");
    obj.edit160:setHeight(25);

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout122);
    obj.edit161:setTransparent(true);
    obj.edit161:setField("nivel_");
    obj.edit161.grid.role = "col";
    obj.edit161.grid.width = 2;
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setName("edit161");
    obj.edit161:setHeight(25);

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout122);
    obj.edit162:setTransparent(true);
    obj.edit162:setField("outro_");
    obj.edit162.grid.role = "col";
    obj.edit162.grid.width = 1;
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setName("edit162");
    obj.edit162:setHeight(25);

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout122);
    obj.button43.grid.role = "col";
    obj.button43.grid.width = 1;
    obj.button43:setText("🎲");
    obj.button43:setName("button43");

    obj.horzLine46 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine46:setParent(obj.layout122);
    obj.horzLine46.grid.role = "row";
    obj.horzLine46:setName("horzLine46");
    obj.horzLine46:setStrokeColor("grey");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.scrollBox2);
    obj.layout123.grid.role = "row";
    obj.layout123.grid.width = 12;
    obj.layout123.grid["auto-height"] = true;
    obj.layout123:setName("layout123");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout123);
    obj.edit163:setTransparent(true);
    obj.edit163:setField("");
    obj.edit163.grid.role = "col";
    obj.edit163.grid.width = 4;
    obj.edit163:setHorzTextAlign("leading");
    obj.edit163:setName("edit163");
    obj.edit163:setHeight(25);

    obj.comboBox28 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox28:setParent(obj.layout123);
    obj.comboBox28:setTransparent(true);
    obj.comboBox28:setField("cha_");
    obj.comboBox28:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox28.grid.role = "col";
    obj.comboBox28.grid.width = 2;
    obj.comboBox28:setHorzTextAlign("center");
    obj.comboBox28:setName("comboBox28");
    obj.comboBox28:setHeight(25);

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout123);
    obj.edit164:setTransparent(true);
    obj.edit164:setField("valAtr_");
    obj.edit164.grid.role = "col";
    obj.edit164.grid.width = 2;
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setName("edit164");
    obj.edit164:setHeight(25);

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout123);
    obj.edit165:setTransparent(true);
    obj.edit165:setField("nivel_");
    obj.edit165.grid.role = "col";
    obj.edit165.grid.width = 2;
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setName("edit165");
    obj.edit165:setHeight(25);

    obj.edit166 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout123);
    obj.edit166:setTransparent(true);
    obj.edit166:setField("outro_");
    obj.edit166.grid.role = "col";
    obj.edit166.grid.width = 1;
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setName("edit166");
    obj.edit166:setHeight(25);

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout123);
    obj.button44.grid.role = "col";
    obj.button44.grid.width = 1;
    obj.button44:setText("🎲");
    obj.button44:setName("button44");

    obj.horzLine47 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine47:setParent(obj.layout123);
    obj.horzLine47.grid.role = "row";
    obj.horzLine47:setName("horzLine47");
    obj.horzLine47:setStrokeColor("grey");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.scrollBox2);
    obj.layout124.grid.role = "row";
    obj.layout124.grid.width = 12;
    obj.layout124.grid["auto-height"] = true;
    obj.layout124:setName("layout124");

    obj.edit167 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout124);
    obj.edit167:setTransparent(true);
    obj.edit167:setField("");
    obj.edit167.grid.role = "col";
    obj.edit167.grid.width = 4;
    obj.edit167:setHorzTextAlign("leading");
    obj.edit167:setName("edit167");
    obj.edit167:setHeight(25);

    obj.comboBox29 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox29:setParent(obj.layout124);
    obj.comboBox29:setTransparent(true);
    obj.comboBox29:setField("cha_");
    obj.comboBox29:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox29.grid.role = "col";
    obj.comboBox29.grid.width = 2;
    obj.comboBox29:setHorzTextAlign("center");
    obj.comboBox29:setName("comboBox29");
    obj.comboBox29:setHeight(25);

    obj.edit168 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout124);
    obj.edit168:setTransparent(true);
    obj.edit168:setField("valAtr_");
    obj.edit168.grid.role = "col";
    obj.edit168.grid.width = 2;
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setName("edit168");
    obj.edit168:setHeight(25);

    obj.edit169 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout124);
    obj.edit169:setTransparent(true);
    obj.edit169:setField("nivel_");
    obj.edit169.grid.role = "col";
    obj.edit169.grid.width = 2;
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setName("edit169");
    obj.edit169:setHeight(25);

    obj.edit170 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout124);
    obj.edit170:setTransparent(true);
    obj.edit170:setField("outro_");
    obj.edit170.grid.role = "col";
    obj.edit170.grid.width = 1;
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setName("edit170");
    obj.edit170:setHeight(25);

    obj.button45 = GUI.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout124);
    obj.button45.grid.role = "col";
    obj.button45.grid.width = 1;
    obj.button45:setText("🎲");
    obj.button45:setName("button45");

    obj.horzLine48 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine48:setParent(obj.layout124);
    obj.horzLine48.grid.role = "row";
    obj.horzLine48:setName("horzLine48");
    obj.horzLine48:setStrokeColor("grey");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.scrollBox2);
    obj.layout125.grid.role = "row";
    obj.layout125.grid.width = 12;
    obj.layout125.grid["auto-height"] = true;
    obj.layout125:setName("layout125");

    obj.edit171 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout125);
    obj.edit171:setTransparent(true);
    obj.edit171:setField("");
    obj.edit171.grid.role = "col";
    obj.edit171.grid.width = 4;
    obj.edit171:setHorzTextAlign("leading");
    obj.edit171:setName("edit171");
    obj.edit171:setHeight(25);

    obj.comboBox30 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox30:setParent(obj.layout125);
    obj.comboBox30:setTransparent(true);
    obj.comboBox30:setField("cha_");
    obj.comboBox30:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox30.grid.role = "col";
    obj.comboBox30.grid.width = 2;
    obj.comboBox30:setHorzTextAlign("center");
    obj.comboBox30:setName("comboBox30");
    obj.comboBox30:setHeight(25);

    obj.edit172 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout125);
    obj.edit172:setTransparent(true);
    obj.edit172:setField("valAtr_");
    obj.edit172.grid.role = "col";
    obj.edit172.grid.width = 2;
    obj.edit172:setHorzTextAlign("center");
    obj.edit172:setName("edit172");
    obj.edit172:setHeight(25);

    obj.edit173 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout125);
    obj.edit173:setTransparent(true);
    obj.edit173:setField("nivel_");
    obj.edit173.grid.role = "col";
    obj.edit173.grid.width = 2;
    obj.edit173:setHorzTextAlign("center");
    obj.edit173:setName("edit173");
    obj.edit173:setHeight(25);

    obj.edit174 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout125);
    obj.edit174:setTransparent(true);
    obj.edit174:setField("outro_");
    obj.edit174.grid.role = "col";
    obj.edit174.grid.width = 1;
    obj.edit174:setHorzTextAlign("center");
    obj.edit174:setName("edit174");
    obj.edit174:setHeight(25);

    obj.button46 = GUI.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout125);
    obj.button46.grid.role = "col";
    obj.button46.grid.width = 1;
    obj.button46:setText("🎲");
    obj.button46:setName("button46");

    obj.horzLine49 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine49:setParent(obj.layout125);
    obj.horzLine49.grid.role = "row";
    obj.horzLine49:setName("horzLine49");
    obj.horzLine49:setStrokeColor("grey");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.scrollBox2);
    obj.layout126.grid.role = "row";
    obj.layout126.grid.width = 12;
    obj.layout126.grid["auto-height"] = true;
    obj.layout126:setName("layout126");

    obj.edit175 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout126);
    obj.edit175:setTransparent(true);
    obj.edit175:setField("");
    obj.edit175.grid.role = "col";
    obj.edit175.grid.width = 4;
    obj.edit175:setHorzTextAlign("leading");
    obj.edit175:setName("edit175");
    obj.edit175:setHeight(25);

    obj.comboBox31 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox31:setParent(obj.layout126);
    obj.comboBox31:setTransparent(true);
    obj.comboBox31:setField("cha_");
    obj.comboBox31:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox31.grid.role = "col";
    obj.comboBox31.grid.width = 2;
    obj.comboBox31:setHorzTextAlign("center");
    obj.comboBox31:setName("comboBox31");
    obj.comboBox31:setHeight(25);

    obj.edit176 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout126);
    obj.edit176:setTransparent(true);
    obj.edit176:setField("valAtr_");
    obj.edit176.grid.role = "col";
    obj.edit176.grid.width = 2;
    obj.edit176:setHorzTextAlign("center");
    obj.edit176:setName("edit176");
    obj.edit176:setHeight(25);

    obj.edit177 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout126);
    obj.edit177:setTransparent(true);
    obj.edit177:setField("nivel_");
    obj.edit177.grid.role = "col";
    obj.edit177.grid.width = 2;
    obj.edit177:setHorzTextAlign("center");
    obj.edit177:setName("edit177");
    obj.edit177:setHeight(25);

    obj.edit178 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout126);
    obj.edit178:setTransparent(true);
    obj.edit178:setField("outro_");
    obj.edit178.grid.role = "col";
    obj.edit178.grid.width = 1;
    obj.edit178:setHorzTextAlign("center");
    obj.edit178:setName("edit178");
    obj.edit178:setHeight(25);

    obj.button47 = GUI.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout126);
    obj.button47.grid.role = "col";
    obj.button47.grid.width = 1;
    obj.button47:setText("🎲");
    obj.button47:setName("button47");

    obj.horzLine50 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine50:setParent(obj.layout126);
    obj.horzLine50.grid.role = "row";
    obj.horzLine50:setName("horzLine50");
    obj.horzLine50:setStrokeColor("grey");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.scrollBox2);
    obj.layout127.grid.role = "row";
    obj.layout127.grid.width = 12;
    obj.layout127.grid["auto-height"] = true;
    obj.layout127:setName("layout127");

    obj.edit179 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout127);
    obj.edit179:setTransparent(true);
    obj.edit179:setField("");
    obj.edit179.grid.role = "col";
    obj.edit179.grid.width = 4;
    obj.edit179:setHorzTextAlign("leading");
    obj.edit179:setName("edit179");
    obj.edit179:setHeight(25);

    obj.comboBox32 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox32:setParent(obj.layout127);
    obj.comboBox32:setTransparent(true);
    obj.comboBox32:setField("cha_");
    obj.comboBox32:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox32.grid.role = "col";
    obj.comboBox32.grid.width = 2;
    obj.comboBox32:setHorzTextAlign("center");
    obj.comboBox32:setName("comboBox32");
    obj.comboBox32:setHeight(25);

    obj.edit180 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout127);
    obj.edit180:setTransparent(true);
    obj.edit180:setField("valAtr_");
    obj.edit180.grid.role = "col";
    obj.edit180.grid.width = 2;
    obj.edit180:setHorzTextAlign("center");
    obj.edit180:setName("edit180");
    obj.edit180:setHeight(25);

    obj.edit181 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout127);
    obj.edit181:setTransparent(true);
    obj.edit181:setField("nivel_");
    obj.edit181.grid.role = "col";
    obj.edit181.grid.width = 2;
    obj.edit181:setHorzTextAlign("center");
    obj.edit181:setName("edit181");
    obj.edit181:setHeight(25);

    obj.edit182 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout127);
    obj.edit182:setTransparent(true);
    obj.edit182:setField("outro_");
    obj.edit182.grid.role = "col";
    obj.edit182.grid.width = 1;
    obj.edit182:setHorzTextAlign("center");
    obj.edit182:setName("edit182");
    obj.edit182:setHeight(25);

    obj.button48 = GUI.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout127);
    obj.button48.grid.role = "col";
    obj.button48.grid.width = 1;
    obj.button48:setText("🎲");
    obj.button48:setName("button48");

    obj.horzLine51 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine51:setParent(obj.layout127);
    obj.horzLine51.grid.role = "row";
    obj.horzLine51:setName("horzLine51");
    obj.horzLine51:setStrokeColor("grey");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.scrollBox2);
    obj.layout128.grid.role = "row";
    obj.layout128.grid.width = 12;
    obj.layout128.grid["auto-height"] = true;
    obj.layout128:setName("layout128");

    obj.edit183 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout128);
    obj.edit183:setTransparent(true);
    obj.edit183:setField("");
    obj.edit183.grid.role = "col";
    obj.edit183.grid.width = 4;
    obj.edit183:setHorzTextAlign("leading");
    obj.edit183:setName("edit183");
    obj.edit183:setHeight(25);

    obj.comboBox33 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox33:setParent(obj.layout128);
    obj.comboBox33:setTransparent(true);
    obj.comboBox33:setField("cha_");
    obj.comboBox33:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox33.grid.role = "col";
    obj.comboBox33.grid.width = 2;
    obj.comboBox33:setHorzTextAlign("center");
    obj.comboBox33:setName("comboBox33");
    obj.comboBox33:setHeight(25);

    obj.edit184 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout128);
    obj.edit184:setTransparent(true);
    obj.edit184:setField("valAtr_");
    obj.edit184.grid.role = "col";
    obj.edit184.grid.width = 2;
    obj.edit184:setHorzTextAlign("center");
    obj.edit184:setName("edit184");
    obj.edit184:setHeight(25);

    obj.edit185 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout128);
    obj.edit185:setTransparent(true);
    obj.edit185:setField("nivel_");
    obj.edit185.grid.role = "col";
    obj.edit185.grid.width = 2;
    obj.edit185:setHorzTextAlign("center");
    obj.edit185:setName("edit185");
    obj.edit185:setHeight(25);

    obj.edit186 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout128);
    obj.edit186:setTransparent(true);
    obj.edit186:setField("outro_");
    obj.edit186.grid.role = "col";
    obj.edit186.grid.width = 1;
    obj.edit186:setHorzTextAlign("center");
    obj.edit186:setName("edit186");
    obj.edit186:setHeight(25);

    obj.button49 = GUI.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout128);
    obj.button49.grid.role = "col";
    obj.button49.grid.width = 1;
    obj.button49:setText("🎲");
    obj.button49:setName("button49");

    obj.horzLine52 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine52:setParent(obj.layout128);
    obj.horzLine52.grid.role = "row";
    obj.horzLine52:setName("horzLine52");
    obj.horzLine52:setStrokeColor("grey");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.scrollBox2);
    obj.layout129.grid.role = "row";
    obj.layout129.grid.width = 12;
    obj.layout129.grid["auto-height"] = true;
    obj.layout129:setName("layout129");

    obj.edit187 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout129);
    obj.edit187:setTransparent(true);
    obj.edit187:setField("");
    obj.edit187.grid.role = "col";
    obj.edit187.grid.width = 4;
    obj.edit187:setHorzTextAlign("leading");
    obj.edit187:setName("edit187");
    obj.edit187:setHeight(25);

    obj.comboBox34 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox34:setParent(obj.layout129);
    obj.comboBox34:setTransparent(true);
    obj.comboBox34:setField("cha_");
    obj.comboBox34:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox34.grid.role = "col";
    obj.comboBox34.grid.width = 2;
    obj.comboBox34:setHorzTextAlign("center");
    obj.comboBox34:setName("comboBox34");
    obj.comboBox34:setHeight(25);

    obj.edit188 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout129);
    obj.edit188:setTransparent(true);
    obj.edit188:setField("valAtr_");
    obj.edit188.grid.role = "col";
    obj.edit188.grid.width = 2;
    obj.edit188:setHorzTextAlign("center");
    obj.edit188:setName("edit188");
    obj.edit188:setHeight(25);

    obj.edit189 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout129);
    obj.edit189:setTransparent(true);
    obj.edit189:setField("nivel_");
    obj.edit189.grid.role = "col";
    obj.edit189.grid.width = 2;
    obj.edit189:setHorzTextAlign("center");
    obj.edit189:setName("edit189");
    obj.edit189:setHeight(25);

    obj.edit190 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout129);
    obj.edit190:setTransparent(true);
    obj.edit190:setField("outro_");
    obj.edit190.grid.role = "col";
    obj.edit190.grid.width = 1;
    obj.edit190:setHorzTextAlign("center");
    obj.edit190:setName("edit190");
    obj.edit190:setHeight(25);

    obj.button50 = GUI.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout129);
    obj.button50.grid.role = "col";
    obj.button50.grid.width = 1;
    obj.button50:setText("🎲");
    obj.button50:setName("button50");

    obj.horzLine53 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine53:setParent(obj.layout129);
    obj.horzLine53.grid.role = "row";
    obj.horzLine53:setName("horzLine53");
    obj.horzLine53:setStrokeColor("grey");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.scrollBox2);
    obj.layout130.grid.role = "row";
    obj.layout130.grid.width = 12;
    obj.layout130.grid["auto-height"] = true;
    obj.layout130:setName("layout130");

    obj.edit191 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout130);
    obj.edit191:setTransparent(true);
    obj.edit191:setField("");
    obj.edit191.grid.role = "col";
    obj.edit191.grid.width = 4;
    obj.edit191:setHorzTextAlign("leading");
    obj.edit191:setName("edit191");
    obj.edit191:setHeight(25);

    obj.comboBox35 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox35:setParent(obj.layout130);
    obj.comboBox35:setTransparent(true);
    obj.comboBox35:setField("cha_");
    obj.comboBox35:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox35.grid.role = "col";
    obj.comboBox35.grid.width = 2;
    obj.comboBox35:setHorzTextAlign("center");
    obj.comboBox35:setName("comboBox35");
    obj.comboBox35:setHeight(25);

    obj.edit192 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout130);
    obj.edit192:setTransparent(true);
    obj.edit192:setField("valAtr_");
    obj.edit192.grid.role = "col";
    obj.edit192.grid.width = 2;
    obj.edit192:setHorzTextAlign("center");
    obj.edit192:setName("edit192");
    obj.edit192:setHeight(25);

    obj.edit193 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout130);
    obj.edit193:setTransparent(true);
    obj.edit193:setField("nivel_");
    obj.edit193.grid.role = "col";
    obj.edit193.grid.width = 2;
    obj.edit193:setHorzTextAlign("center");
    obj.edit193:setName("edit193");
    obj.edit193:setHeight(25);

    obj.edit194 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout130);
    obj.edit194:setTransparent(true);
    obj.edit194:setField("outro_");
    obj.edit194.grid.role = "col";
    obj.edit194.grid.width = 1;
    obj.edit194:setHorzTextAlign("center");
    obj.edit194:setName("edit194");
    obj.edit194:setHeight(25);

    obj.button51 = GUI.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.layout130);
    obj.button51.grid.role = "col";
    obj.button51.grid.width = 1;
    obj.button51:setText("🎲");
    obj.button51:setName("button51");

    obj.horzLine54 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine54:setParent(obj.layout130);
    obj.horzLine54.grid.role = "row";
    obj.horzLine54:setName("horzLine54");
    obj.horzLine54:setStrokeColor("grey");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.scrollBox2);
    obj.layout131.grid.role = "row";
    obj.layout131.grid.width = 12;
    obj.layout131.grid["auto-height"] = true;
    obj.layout131:setName("layout131");

    obj.edit195 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout131);
    obj.edit195:setTransparent(true);
    obj.edit195:setField("");
    obj.edit195.grid.role = "col";
    obj.edit195.grid.width = 4;
    obj.edit195:setHorzTextAlign("leading");
    obj.edit195:setName("edit195");
    obj.edit195:setHeight(25);

    obj.comboBox36 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox36:setParent(obj.layout131);
    obj.comboBox36:setTransparent(true);
    obj.comboBox36:setField("cha_");
    obj.comboBox36:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox36.grid.role = "col";
    obj.comboBox36.grid.width = 2;
    obj.comboBox36:setHorzTextAlign("center");
    obj.comboBox36:setName("comboBox36");
    obj.comboBox36:setHeight(25);

    obj.edit196 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout131);
    obj.edit196:setTransparent(true);
    obj.edit196:setField("valAtr_");
    obj.edit196.grid.role = "col";
    obj.edit196.grid.width = 2;
    obj.edit196:setHorzTextAlign("center");
    obj.edit196:setName("edit196");
    obj.edit196:setHeight(25);

    obj.edit197 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout131);
    obj.edit197:setTransparent(true);
    obj.edit197:setField("nivel_");
    obj.edit197.grid.role = "col";
    obj.edit197.grid.width = 2;
    obj.edit197:setHorzTextAlign("center");
    obj.edit197:setName("edit197");
    obj.edit197:setHeight(25);

    obj.edit198 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout131);
    obj.edit198:setTransparent(true);
    obj.edit198:setField("outro_");
    obj.edit198.grid.role = "col";
    obj.edit198.grid.width = 1;
    obj.edit198:setHorzTextAlign("center");
    obj.edit198:setName("edit198");
    obj.edit198:setHeight(25);

    obj.button52 = GUI.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.layout131);
    obj.button52.grid.role = "col";
    obj.button52.grid.width = 1;
    obj.button52:setText("🎲");
    obj.button52:setName("button52");

    obj.horzLine55 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine55:setParent(obj.layout131);
    obj.horzLine55.grid.role = "row";
    obj.horzLine55:setName("horzLine55");
    obj.horzLine55:setStrokeColor("grey");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.scrollBox2);
    obj.layout132.grid.role = "row";
    obj.layout132.grid.width = 12;
    obj.layout132.grid["auto-height"] = true;
    obj.layout132:setName("layout132");

    obj.edit199 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout132);
    obj.edit199:setTransparent(true);
    obj.edit199:setField("");
    obj.edit199.grid.role = "col";
    obj.edit199.grid.width = 4;
    obj.edit199:setHorzTextAlign("leading");
    obj.edit199:setName("edit199");
    obj.edit199:setHeight(25);

    obj.comboBox37 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox37:setParent(obj.layout132);
    obj.comboBox37:setTransparent(true);
    obj.comboBox37:setField("cha_");
    obj.comboBox37:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox37.grid.role = "col";
    obj.comboBox37.grid.width = 2;
    obj.comboBox37:setHorzTextAlign("center");
    obj.comboBox37:setName("comboBox37");
    obj.comboBox37:setHeight(25);

    obj.edit200 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout132);
    obj.edit200:setTransparent(true);
    obj.edit200:setField("valAtr_");
    obj.edit200.grid.role = "col";
    obj.edit200.grid.width = 2;
    obj.edit200:setHorzTextAlign("center");
    obj.edit200:setName("edit200");
    obj.edit200:setHeight(25);

    obj.edit201 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout132);
    obj.edit201:setTransparent(true);
    obj.edit201:setField("nivel_");
    obj.edit201.grid.role = "col";
    obj.edit201.grid.width = 2;
    obj.edit201:setHorzTextAlign("center");
    obj.edit201:setName("edit201");
    obj.edit201:setHeight(25);

    obj.edit202 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout132);
    obj.edit202:setTransparent(true);
    obj.edit202:setField("outro_");
    obj.edit202.grid.role = "col";
    obj.edit202.grid.width = 1;
    obj.edit202:setHorzTextAlign("center");
    obj.edit202:setName("edit202");
    obj.edit202:setHeight(25);

    obj.button53 = GUI.fromHandle(_obj_newObject("button"));
    obj.button53:setParent(obj.layout132);
    obj.button53.grid.role = "col";
    obj.button53.grid.width = 1;
    obj.button53:setText("🎲");
    obj.button53:setName("button53");

    obj.horzLine56 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine56:setParent(obj.layout132);
    obj.horzLine56.grid.role = "row";
    obj.horzLine56:setName("horzLine56");
    obj.horzLine56:setStrokeColor("grey");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.scrollBox2);
    obj.layout133.grid.role = "row";
    obj.layout133.grid.width = 12;
    obj.layout133.grid["auto-height"] = true;
    obj.layout133:setName("layout133");

    obj.edit203 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout133);
    obj.edit203:setTransparent(true);
    obj.edit203:setField("");
    obj.edit203.grid.role = "col";
    obj.edit203.grid.width = 4;
    obj.edit203:setHorzTextAlign("leading");
    obj.edit203:setName("edit203");
    obj.edit203:setHeight(25);

    obj.comboBox38 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox38:setParent(obj.layout133);
    obj.comboBox38:setTransparent(true);
    obj.comboBox38:setField("cha_");
    obj.comboBox38:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox38.grid.role = "col";
    obj.comboBox38.grid.width = 2;
    obj.comboBox38:setHorzTextAlign("center");
    obj.comboBox38:setName("comboBox38");
    obj.comboBox38:setHeight(25);

    obj.edit204 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout133);
    obj.edit204:setTransparent(true);
    obj.edit204:setField("valAtr_");
    obj.edit204.grid.role = "col";
    obj.edit204.grid.width = 2;
    obj.edit204:setHorzTextAlign("center");
    obj.edit204:setName("edit204");
    obj.edit204:setHeight(25);

    obj.edit205 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout133);
    obj.edit205:setTransparent(true);
    obj.edit205:setField("nivel_");
    obj.edit205.grid.role = "col";
    obj.edit205.grid.width = 2;
    obj.edit205:setHorzTextAlign("center");
    obj.edit205:setName("edit205");
    obj.edit205:setHeight(25);

    obj.edit206 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout133);
    obj.edit206:setTransparent(true);
    obj.edit206:setField("outro_");
    obj.edit206.grid.role = "col";
    obj.edit206.grid.width = 1;
    obj.edit206:setHorzTextAlign("center");
    obj.edit206:setName("edit206");
    obj.edit206:setHeight(25);

    obj.button54 = GUI.fromHandle(_obj_newObject("button"));
    obj.button54:setParent(obj.layout133);
    obj.button54.grid.role = "col";
    obj.button54.grid.width = 1;
    obj.button54:setText("🎲");
    obj.button54:setName("button54");

    obj.horzLine57 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine57:setParent(obj.layout133);
    obj.horzLine57.grid.role = "row";
    obj.horzLine57:setName("horzLine57");
    obj.horzLine57:setStrokeColor("grey");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.scrollBox2);
    obj.layout134.grid.role = "row";
    obj.layout134.grid.width = 12;
    obj.layout134.grid["auto-height"] = true;
    obj.layout134:setName("layout134");

    obj.edit207 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout134);
    obj.edit207:setTransparent(true);
    obj.edit207:setField("");
    obj.edit207.grid.role = "col";
    obj.edit207.grid.width = 4;
    obj.edit207:setHorzTextAlign("leading");
    obj.edit207:setName("edit207");
    obj.edit207:setHeight(25);

    obj.comboBox39 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox39:setParent(obj.layout134);
    obj.comboBox39:setTransparent(true);
    obj.comboBox39:setField("cha_");
    obj.comboBox39:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox39.grid.role = "col";
    obj.comboBox39.grid.width = 2;
    obj.comboBox39:setHorzTextAlign("center");
    obj.comboBox39:setName("comboBox39");
    obj.comboBox39:setHeight(25);

    obj.edit208 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout134);
    obj.edit208:setTransparent(true);
    obj.edit208:setField("valAtr_");
    obj.edit208.grid.role = "col";
    obj.edit208.grid.width = 2;
    obj.edit208:setHorzTextAlign("center");
    obj.edit208:setName("edit208");
    obj.edit208:setHeight(25);

    obj.edit209 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout134);
    obj.edit209:setTransparent(true);
    obj.edit209:setField("nivel_");
    obj.edit209.grid.role = "col";
    obj.edit209.grid.width = 2;
    obj.edit209:setHorzTextAlign("center");
    obj.edit209:setName("edit209");
    obj.edit209:setHeight(25);

    obj.edit210 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout134);
    obj.edit210:setTransparent(true);
    obj.edit210:setField("outro_");
    obj.edit210.grid.role = "col";
    obj.edit210.grid.width = 1;
    obj.edit210:setHorzTextAlign("center");
    obj.edit210:setName("edit210");
    obj.edit210:setHeight(25);

    obj.button55 = GUI.fromHandle(_obj_newObject("button"));
    obj.button55:setParent(obj.layout134);
    obj.button55.grid.role = "col";
    obj.button55.grid.width = 1;
    obj.button55:setText("🎲");
    obj.button55:setName("button55");

    obj.horzLine58 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine58:setParent(obj.layout134);
    obj.horzLine58.grid.role = "row";
    obj.horzLine58:setName("horzLine58");
    obj.horzLine58:setStrokeColor("grey");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.scrollBox2);
    obj.layout135.grid.role = "row";
    obj.layout135.grid.width = 12;
    obj.layout135.grid["auto-height"] = true;
    obj.layout135:setName("layout135");

    obj.edit211 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout135);
    obj.edit211:setTransparent(true);
    obj.edit211:setField("");
    obj.edit211.grid.role = "col";
    obj.edit211.grid.width = 4;
    obj.edit211:setHorzTextAlign("leading");
    obj.edit211:setName("edit211");
    obj.edit211:setHeight(25);

    obj.comboBox40 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox40:setParent(obj.layout135);
    obj.comboBox40:setTransparent(true);
    obj.comboBox40:setField("cha_");
    obj.comboBox40:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox40.grid.role = "col";
    obj.comboBox40.grid.width = 2;
    obj.comboBox40:setHorzTextAlign("center");
    obj.comboBox40:setName("comboBox40");
    obj.comboBox40:setHeight(25);

    obj.edit212 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout135);
    obj.edit212:setTransparent(true);
    obj.edit212:setField("valAtr_");
    obj.edit212.grid.role = "col";
    obj.edit212.grid.width = 2;
    obj.edit212:setHorzTextAlign("center");
    obj.edit212:setName("edit212");
    obj.edit212:setHeight(25);

    obj.edit213 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout135);
    obj.edit213:setTransparent(true);
    obj.edit213:setField("nivel_");
    obj.edit213.grid.role = "col";
    obj.edit213.grid.width = 2;
    obj.edit213:setHorzTextAlign("center");
    obj.edit213:setName("edit213");
    obj.edit213:setHeight(25);

    obj.edit214 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout135);
    obj.edit214:setTransparent(true);
    obj.edit214:setField("outro_");
    obj.edit214.grid.role = "col";
    obj.edit214.grid.width = 1;
    obj.edit214:setHorzTextAlign("center");
    obj.edit214:setName("edit214");
    obj.edit214:setHeight(25);

    obj.button56 = GUI.fromHandle(_obj_newObject("button"));
    obj.button56:setParent(obj.layout135);
    obj.button56.grid.role = "col";
    obj.button56.grid.width = 1;
    obj.button56:setText("🎲");
    obj.button56:setName("button56");

    obj.horzLine59 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine59:setParent(obj.layout135);
    obj.horzLine59.grid.role = "row";
    obj.horzLine59:setName("horzLine59");
    obj.horzLine59:setStrokeColor("grey");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.scrollBox2);
    obj.layout136.grid.role = "row";
    obj.layout136.grid.width = 12;
    obj.layout136.grid["auto-height"] = true;
    obj.layout136:setName("layout136");

    obj.edit215 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout136);
    obj.edit215:setTransparent(true);
    obj.edit215:setField("");
    obj.edit215.grid.role = "col";
    obj.edit215.grid.width = 4;
    obj.edit215:setHorzTextAlign("leading");
    obj.edit215:setName("edit215");
    obj.edit215:setHeight(25);

    obj.comboBox41 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox41:setParent(obj.layout136);
    obj.comboBox41:setTransparent(true);
    obj.comboBox41:setField("cha_");
    obj.comboBox41:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox41.grid.role = "col";
    obj.comboBox41.grid.width = 2;
    obj.comboBox41:setHorzTextAlign("center");
    obj.comboBox41:setName("comboBox41");
    obj.comboBox41:setHeight(25);

    obj.edit216 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout136);
    obj.edit216:setTransparent(true);
    obj.edit216:setField("valAtr_");
    obj.edit216.grid.role = "col";
    obj.edit216.grid.width = 2;
    obj.edit216:setHorzTextAlign("center");
    obj.edit216:setName("edit216");
    obj.edit216:setHeight(25);

    obj.edit217 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout136);
    obj.edit217:setTransparent(true);
    obj.edit217:setField("nivel_");
    obj.edit217.grid.role = "col";
    obj.edit217.grid.width = 2;
    obj.edit217:setHorzTextAlign("center");
    obj.edit217:setName("edit217");
    obj.edit217:setHeight(25);

    obj.edit218 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout136);
    obj.edit218:setTransparent(true);
    obj.edit218:setField("outro_");
    obj.edit218.grid.role = "col";
    obj.edit218.grid.width = 1;
    obj.edit218:setHorzTextAlign("center");
    obj.edit218:setName("edit218");
    obj.edit218:setHeight(25);

    obj.button57 = GUI.fromHandle(_obj_newObject("button"));
    obj.button57:setParent(obj.layout136);
    obj.button57.grid.role = "col";
    obj.button57.grid.width = 1;
    obj.button57:setText("🎲");
    obj.button57:setName("button57");

    obj.horzLine60 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine60:setParent(obj.layout136);
    obj.horzLine60.grid.role = "row";
    obj.horzLine60:setName("horzLine60");
    obj.horzLine60:setStrokeColor("grey");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.scrollBox2);
    obj.layout137.grid.role = "row";
    obj.layout137.grid.width = 12;
    obj.layout137.grid["auto-height"] = true;
    obj.layout137:setName("layout137");

    obj.edit219 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout137);
    obj.edit219:setTransparent(true);
    obj.edit219:setField("");
    obj.edit219.grid.role = "col";
    obj.edit219.grid.width = 4;
    obj.edit219:setHorzTextAlign("leading");
    obj.edit219:setName("edit219");
    obj.edit219:setHeight(25);

    obj.comboBox42 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox42:setParent(obj.layout137);
    obj.comboBox42:setTransparent(true);
    obj.comboBox42:setField("cha_");
    obj.comboBox42:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox42.grid.role = "col";
    obj.comboBox42.grid.width = 2;
    obj.comboBox42:setHorzTextAlign("center");
    obj.comboBox42:setName("comboBox42");
    obj.comboBox42:setHeight(25);

    obj.edit220 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout137);
    obj.edit220:setTransparent(true);
    obj.edit220:setField("valAtr_");
    obj.edit220.grid.role = "col";
    obj.edit220.grid.width = 2;
    obj.edit220:setHorzTextAlign("center");
    obj.edit220:setName("edit220");
    obj.edit220:setHeight(25);

    obj.edit221 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout137);
    obj.edit221:setTransparent(true);
    obj.edit221:setField("nivel_");
    obj.edit221.grid.role = "col";
    obj.edit221.grid.width = 2;
    obj.edit221:setHorzTextAlign("center");
    obj.edit221:setName("edit221");
    obj.edit221:setHeight(25);

    obj.edit222 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout137);
    obj.edit222:setTransparent(true);
    obj.edit222:setField("outro_");
    obj.edit222.grid.role = "col";
    obj.edit222.grid.width = 1;
    obj.edit222:setHorzTextAlign("center");
    obj.edit222:setName("edit222");
    obj.edit222:setHeight(25);

    obj.button58 = GUI.fromHandle(_obj_newObject("button"));
    obj.button58:setParent(obj.layout137);
    obj.button58.grid.role = "col";
    obj.button58.grid.width = 1;
    obj.button58:setText("🎲");
    obj.button58:setName("button58");

    obj.horzLine61 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine61:setParent(obj.layout137);
    obj.horzLine61.grid.role = "row";
    obj.horzLine61:setName("horzLine61");
    obj.horzLine61:setStrokeColor("grey");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.scrollBox2);
    obj.layout138.grid.role = "row";
    obj.layout138.grid.width = 12;
    obj.layout138.grid["auto-height"] = true;
    obj.layout138:setName("layout138");

    obj.edit223 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout138);
    obj.edit223:setTransparent(true);
    obj.edit223:setField("");
    obj.edit223.grid.role = "col";
    obj.edit223.grid.width = 4;
    obj.edit223:setHorzTextAlign("leading");
    obj.edit223:setName("edit223");
    obj.edit223:setHeight(25);

    obj.comboBox43 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox43:setParent(obj.layout138);
    obj.comboBox43:setTransparent(true);
    obj.comboBox43:setField("cha_");
    obj.comboBox43:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox43.grid.role = "col";
    obj.comboBox43.grid.width = 2;
    obj.comboBox43:setHorzTextAlign("center");
    obj.comboBox43:setName("comboBox43");
    obj.comboBox43:setHeight(25);

    obj.edit224 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout138);
    obj.edit224:setTransparent(true);
    obj.edit224:setField("valAtr_");
    obj.edit224.grid.role = "col";
    obj.edit224.grid.width = 2;
    obj.edit224:setHorzTextAlign("center");
    obj.edit224:setName("edit224");
    obj.edit224:setHeight(25);

    obj.edit225 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout138);
    obj.edit225:setTransparent(true);
    obj.edit225:setField("nivel_");
    obj.edit225.grid.role = "col";
    obj.edit225.grid.width = 2;
    obj.edit225:setHorzTextAlign("center");
    obj.edit225:setName("edit225");
    obj.edit225:setHeight(25);

    obj.edit226 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout138);
    obj.edit226:setTransparent(true);
    obj.edit226:setField("outro_");
    obj.edit226.grid.role = "col";
    obj.edit226.grid.width = 1;
    obj.edit226:setHorzTextAlign("center");
    obj.edit226:setName("edit226");
    obj.edit226:setHeight(25);

    obj.button59 = GUI.fromHandle(_obj_newObject("button"));
    obj.button59:setParent(obj.layout138);
    obj.button59.grid.role = "col";
    obj.button59.grid.width = 1;
    obj.button59:setText("🎲");
    obj.button59:setName("button59");

    obj.horzLine62 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine62:setParent(obj.layout138);
    obj.horzLine62.grid.role = "row";
    obj.horzLine62:setName("horzLine62");
    obj.horzLine62:setStrokeColor("grey");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.scrollBox2);
    obj.layout139.grid.role = "row";
    obj.layout139.grid.width = 12;
    obj.layout139.grid["auto-height"] = true;
    obj.layout139:setName("layout139");

    obj.edit227 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout139);
    obj.edit227:setTransparent(true);
    obj.edit227:setField("");
    obj.edit227.grid.role = "col";
    obj.edit227.grid.width = 4;
    obj.edit227:setHorzTextAlign("leading");
    obj.edit227:setName("edit227");
    obj.edit227:setHeight(25);

    obj.comboBox44 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox44:setParent(obj.layout139);
    obj.comboBox44:setTransparent(true);
    obj.comboBox44:setField("cha_");
    obj.comboBox44:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox44.grid.role = "col";
    obj.comboBox44.grid.width = 2;
    obj.comboBox44:setHorzTextAlign("center");
    obj.comboBox44:setName("comboBox44");
    obj.comboBox44:setHeight(25);

    obj.edit228 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout139);
    obj.edit228:setTransparent(true);
    obj.edit228:setField("valAtr_");
    obj.edit228.grid.role = "col";
    obj.edit228.grid.width = 2;
    obj.edit228:setHorzTextAlign("center");
    obj.edit228:setName("edit228");
    obj.edit228:setHeight(25);

    obj.edit229 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout139);
    obj.edit229:setTransparent(true);
    obj.edit229:setField("nivel_");
    obj.edit229.grid.role = "col";
    obj.edit229.grid.width = 2;
    obj.edit229:setHorzTextAlign("center");
    obj.edit229:setName("edit229");
    obj.edit229:setHeight(25);

    obj.edit230 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout139);
    obj.edit230:setTransparent(true);
    obj.edit230:setField("outro_");
    obj.edit230.grid.role = "col";
    obj.edit230.grid.width = 1;
    obj.edit230:setHorzTextAlign("center");
    obj.edit230:setName("edit230");
    obj.edit230:setHeight(25);

    obj.button60 = GUI.fromHandle(_obj_newObject("button"));
    obj.button60:setParent(obj.layout139);
    obj.button60.grid.role = "col";
    obj.button60.grid.width = 1;
    obj.button60:setText("🎲");
    obj.button60:setName("button60");

    obj.horzLine63 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine63:setParent(obj.layout139);
    obj.horzLine63.grid.role = "row";
    obj.horzLine63:setName("horzLine63");
    obj.horzLine63:setStrokeColor("grey");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.scrollBox2);
    obj.layout140.grid.role = "row";
    obj.layout140.grid.width = 12;
    obj.layout140.grid["auto-height"] = true;
    obj.layout140:setName("layout140");

    obj.edit231 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout140);
    obj.edit231:setTransparent(true);
    obj.edit231:setField("");
    obj.edit231.grid.role = "col";
    obj.edit231.grid.width = 4;
    obj.edit231:setHorzTextAlign("leading");
    obj.edit231:setName("edit231");
    obj.edit231:setHeight(25);

    obj.comboBox45 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox45:setParent(obj.layout140);
    obj.comboBox45:setTransparent(true);
    obj.comboBox45:setField("cha_");
    obj.comboBox45:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox45.grid.role = "col";
    obj.comboBox45.grid.width = 2;
    obj.comboBox45:setHorzTextAlign("center");
    obj.comboBox45:setName("comboBox45");
    obj.comboBox45:setHeight(25);

    obj.edit232 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout140);
    obj.edit232:setTransparent(true);
    obj.edit232:setField("valAtr_");
    obj.edit232.grid.role = "col";
    obj.edit232.grid.width = 2;
    obj.edit232:setHorzTextAlign("center");
    obj.edit232:setName("edit232");
    obj.edit232:setHeight(25);

    obj.edit233 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout140);
    obj.edit233:setTransparent(true);
    obj.edit233:setField("nivel_");
    obj.edit233.grid.role = "col";
    obj.edit233.grid.width = 2;
    obj.edit233:setHorzTextAlign("center");
    obj.edit233:setName("edit233");
    obj.edit233:setHeight(25);

    obj.edit234 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout140);
    obj.edit234:setTransparent(true);
    obj.edit234:setField("outro_");
    obj.edit234.grid.role = "col";
    obj.edit234.grid.width = 1;
    obj.edit234:setHorzTextAlign("center");
    obj.edit234:setName("edit234");
    obj.edit234:setHeight(25);

    obj.button61 = GUI.fromHandle(_obj_newObject("button"));
    obj.button61:setParent(obj.layout140);
    obj.button61.grid.role = "col";
    obj.button61.grid.width = 1;
    obj.button61:setText("🎲");
    obj.button61:setName("button61");

    obj.horzLine64 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine64:setParent(obj.layout140);
    obj.horzLine64.grid.role = "row";
    obj.horzLine64:setName("horzLine64");
    obj.horzLine64:setStrokeColor("grey");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.scrollBox2);
    obj.layout141.grid.role = "row";
    obj.layout141.grid.width = 12;
    obj.layout141.grid["auto-height"] = true;
    obj.layout141:setName("layout141");

    obj.edit235 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout141);
    obj.edit235:setTransparent(true);
    obj.edit235:setField("");
    obj.edit235.grid.role = "col";
    obj.edit235.grid.width = 4;
    obj.edit235:setHorzTextAlign("leading");
    obj.edit235:setName("edit235");
    obj.edit235:setHeight(25);

    obj.comboBox46 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox46:setParent(obj.layout141);
    obj.comboBox46:setTransparent(true);
    obj.comboBox46:setField("cha_");
    obj.comboBox46:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox46.grid.role = "col";
    obj.comboBox46.grid.width = 2;
    obj.comboBox46:setHorzTextAlign("center");
    obj.comboBox46:setName("comboBox46");
    obj.comboBox46:setHeight(25);

    obj.edit236 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout141);
    obj.edit236:setTransparent(true);
    obj.edit236:setField("valAtr_");
    obj.edit236.grid.role = "col";
    obj.edit236.grid.width = 2;
    obj.edit236:setHorzTextAlign("center");
    obj.edit236:setName("edit236");
    obj.edit236:setHeight(25);

    obj.edit237 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout141);
    obj.edit237:setTransparent(true);
    obj.edit237:setField("nivel_");
    obj.edit237.grid.role = "col";
    obj.edit237.grid.width = 2;
    obj.edit237:setHorzTextAlign("center");
    obj.edit237:setName("edit237");
    obj.edit237:setHeight(25);

    obj.edit238 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout141);
    obj.edit238:setTransparent(true);
    obj.edit238:setField("outro_");
    obj.edit238.grid.role = "col";
    obj.edit238.grid.width = 1;
    obj.edit238:setHorzTextAlign("center");
    obj.edit238:setName("edit238");
    obj.edit238:setHeight(25);

    obj.button62 = GUI.fromHandle(_obj_newObject("button"));
    obj.button62:setParent(obj.layout141);
    obj.button62.grid.role = "col";
    obj.button62.grid.width = 1;
    obj.button62:setText("🎲");
    obj.button62:setName("button62");

    obj.horzLine65 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine65:setParent(obj.layout141);
    obj.horzLine65.grid.role = "row";
    obj.horzLine65:setName("horzLine65");
    obj.horzLine65:setStrokeColor("grey");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.scrollBox2);
    obj.layout142.grid.role = "row";
    obj.layout142.grid.width = 12;
    obj.layout142.grid["auto-height"] = true;
    obj.layout142:setName("layout142");

    obj.edit239 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout142);
    obj.edit239:setTransparent(true);
    obj.edit239:setField("");
    obj.edit239.grid.role = "col";
    obj.edit239.grid.width = 4;
    obj.edit239:setHorzTextAlign("leading");
    obj.edit239:setName("edit239");
    obj.edit239:setHeight(25);

    obj.comboBox47 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox47:setParent(obj.layout142);
    obj.comboBox47:setTransparent(true);
    obj.comboBox47:setField("cha_");
    obj.comboBox47:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox47.grid.role = "col";
    obj.comboBox47.grid.width = 2;
    obj.comboBox47:setHorzTextAlign("center");
    obj.comboBox47:setName("comboBox47");
    obj.comboBox47:setHeight(25);

    obj.edit240 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout142);
    obj.edit240:setTransparent(true);
    obj.edit240:setField("valAtr_");
    obj.edit240.grid.role = "col";
    obj.edit240.grid.width = 2;
    obj.edit240:setHorzTextAlign("center");
    obj.edit240:setName("edit240");
    obj.edit240:setHeight(25);

    obj.edit241 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout142);
    obj.edit241:setTransparent(true);
    obj.edit241:setField("nivel_");
    obj.edit241.grid.role = "col";
    obj.edit241.grid.width = 2;
    obj.edit241:setHorzTextAlign("center");
    obj.edit241:setName("edit241");
    obj.edit241:setHeight(25);

    obj.edit242 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout142);
    obj.edit242:setTransparent(true);
    obj.edit242:setField("outro_");
    obj.edit242.grid.role = "col";
    obj.edit242.grid.width = 1;
    obj.edit242:setHorzTextAlign("center");
    obj.edit242:setName("edit242");
    obj.edit242:setHeight(25);

    obj.button63 = GUI.fromHandle(_obj_newObject("button"));
    obj.button63:setParent(obj.layout142);
    obj.button63.grid.role = "col";
    obj.button63.grid.width = 1;
    obj.button63:setText("🎲");
    obj.button63:setName("button63");

    obj.horzLine66 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine66:setParent(obj.layout142);
    obj.horzLine66.grid.role = "row";
    obj.horzLine66:setName("horzLine66");
    obj.horzLine66:setStrokeColor("grey");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.scrollBox2);
    obj.layout143.grid.role = "row";
    obj.layout143.grid.width = 12;
    obj.layout143.grid["auto-height"] = true;
    obj.layout143:setName("layout143");

    obj.edit243 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout143);
    obj.edit243:setTransparent(true);
    obj.edit243:setField("");
    obj.edit243.grid.role = "col";
    obj.edit243.grid.width = 4;
    obj.edit243:setHorzTextAlign("leading");
    obj.edit243:setName("edit243");
    obj.edit243:setHeight(25);

    obj.comboBox48 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox48:setParent(obj.layout143);
    obj.comboBox48:setTransparent(true);
    obj.comboBox48:setField("cha_");
    obj.comboBox48:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox48.grid.role = "col";
    obj.comboBox48.grid.width = 2;
    obj.comboBox48:setHorzTextAlign("center");
    obj.comboBox48:setName("comboBox48");
    obj.comboBox48:setHeight(25);

    obj.edit244 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout143);
    obj.edit244:setTransparent(true);
    obj.edit244:setField("valAtr_");
    obj.edit244.grid.role = "col";
    obj.edit244.grid.width = 2;
    obj.edit244:setHorzTextAlign("center");
    obj.edit244:setName("edit244");
    obj.edit244:setHeight(25);

    obj.edit245 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout143);
    obj.edit245:setTransparent(true);
    obj.edit245:setField("nivel_");
    obj.edit245.grid.role = "col";
    obj.edit245.grid.width = 2;
    obj.edit245:setHorzTextAlign("center");
    obj.edit245:setName("edit245");
    obj.edit245:setHeight(25);

    obj.edit246 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout143);
    obj.edit246:setTransparent(true);
    obj.edit246:setField("outro_");
    obj.edit246.grid.role = "col";
    obj.edit246.grid.width = 1;
    obj.edit246:setHorzTextAlign("center");
    obj.edit246:setName("edit246");
    obj.edit246:setHeight(25);

    obj.button64 = GUI.fromHandle(_obj_newObject("button"));
    obj.button64:setParent(obj.layout143);
    obj.button64.grid.role = "col";
    obj.button64.grid.width = 1;
    obj.button64:setText("🎲");
    obj.button64:setName("button64");

    obj.horzLine67 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine67:setParent(obj.layout143);
    obj.horzLine67.grid.role = "row";
    obj.horzLine67:setName("horzLine67");
    obj.horzLine67:setStrokeColor("grey");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.scrollBox2);
    obj.layout144.grid.role = "row";
    obj.layout144.grid.width = 12;
    obj.layout144.grid["auto-height"] = true;
    obj.layout144:setName("layout144");

    obj.edit247 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout144);
    obj.edit247:setTransparent(true);
    obj.edit247:setField("");
    obj.edit247.grid.role = "col";
    obj.edit247.grid.width = 4;
    obj.edit247:setHorzTextAlign("leading");
    obj.edit247:setName("edit247");
    obj.edit247:setHeight(25);

    obj.comboBox49 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox49:setParent(obj.layout144);
    obj.comboBox49:setTransparent(true);
    obj.comboBox49:setField("cha_");
    obj.comboBox49:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox49.grid.role = "col";
    obj.comboBox49.grid.width = 2;
    obj.comboBox49:setHorzTextAlign("center");
    obj.comboBox49:setName("comboBox49");
    obj.comboBox49:setHeight(25);

    obj.edit248 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout144);
    obj.edit248:setTransparent(true);
    obj.edit248:setField("valAtr_");
    obj.edit248.grid.role = "col";
    obj.edit248.grid.width = 2;
    obj.edit248:setHorzTextAlign("center");
    obj.edit248:setName("edit248");
    obj.edit248:setHeight(25);

    obj.edit249 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout144);
    obj.edit249:setTransparent(true);
    obj.edit249:setField("nivel_");
    obj.edit249.grid.role = "col";
    obj.edit249.grid.width = 2;
    obj.edit249:setHorzTextAlign("center");
    obj.edit249:setName("edit249");
    obj.edit249:setHeight(25);

    obj.edit250 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout144);
    obj.edit250:setTransparent(true);
    obj.edit250:setField("outro_");
    obj.edit250.grid.role = "col";
    obj.edit250.grid.width = 1;
    obj.edit250:setHorzTextAlign("center");
    obj.edit250:setName("edit250");
    obj.edit250:setHeight(25);

    obj.button65 = GUI.fromHandle(_obj_newObject("button"));
    obj.button65:setParent(obj.layout144);
    obj.button65.grid.role = "col";
    obj.button65.grid.width = 1;
    obj.button65:setText("🎲");
    obj.button65:setName("button65");

    obj.horzLine68 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine68:setParent(obj.layout144);
    obj.horzLine68.grid.role = "row";
    obj.horzLine68:setName("horzLine68");
    obj.horzLine68:setStrokeColor("grey");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.scrollBox2);
    obj.layout145.grid.role = "row";
    obj.layout145.grid.width = 12;
    obj.layout145.grid["auto-height"] = true;
    obj.layout145:setName("layout145");

    obj.edit251 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout145);
    obj.edit251:setTransparent(true);
    obj.edit251:setField("");
    obj.edit251.grid.role = "col";
    obj.edit251.grid.width = 4;
    obj.edit251:setHorzTextAlign("leading");
    obj.edit251:setName("edit251");
    obj.edit251:setHeight(25);

    obj.comboBox50 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox50:setParent(obj.layout145);
    obj.comboBox50:setTransparent(true);
    obj.comboBox50:setField("cha_");
    obj.comboBox50:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox50.grid.role = "col";
    obj.comboBox50.grid.width = 2;
    obj.comboBox50:setHorzTextAlign("center");
    obj.comboBox50:setName("comboBox50");
    obj.comboBox50:setHeight(25);

    obj.edit252 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout145);
    obj.edit252:setTransparent(true);
    obj.edit252:setField("valAtr_");
    obj.edit252.grid.role = "col";
    obj.edit252.grid.width = 2;
    obj.edit252:setHorzTextAlign("center");
    obj.edit252:setName("edit252");
    obj.edit252:setHeight(25);

    obj.edit253 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout145);
    obj.edit253:setTransparent(true);
    obj.edit253:setField("nivel_");
    obj.edit253.grid.role = "col";
    obj.edit253.grid.width = 2;
    obj.edit253:setHorzTextAlign("center");
    obj.edit253:setName("edit253");
    obj.edit253:setHeight(25);

    obj.edit254 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout145);
    obj.edit254:setTransparent(true);
    obj.edit254:setField("outro_");
    obj.edit254.grid.role = "col";
    obj.edit254.grid.width = 1;
    obj.edit254:setHorzTextAlign("center");
    obj.edit254:setName("edit254");
    obj.edit254:setHeight(25);

    obj.button66 = GUI.fromHandle(_obj_newObject("button"));
    obj.button66:setParent(obj.layout145);
    obj.button66.grid.role = "col";
    obj.button66.grid.width = 1;
    obj.button66:setText("🎲");
    obj.button66:setName("button66");

    obj.horzLine69 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine69:setParent(obj.layout145);
    obj.horzLine69.grid.role = "row";
    obj.horzLine69:setName("horzLine69");
    obj.horzLine69:setStrokeColor("grey");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.scrollBox2);
    obj.layout146.grid.role = "row";
    obj.layout146.grid.width = 12;
    obj.layout146.grid["auto-height"] = true;
    obj.layout146:setName("layout146");

    obj.edit255 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout146);
    obj.edit255:setTransparent(true);
    obj.edit255:setField("");
    obj.edit255.grid.role = "col";
    obj.edit255.grid.width = 4;
    obj.edit255:setHorzTextAlign("leading");
    obj.edit255:setName("edit255");
    obj.edit255:setHeight(25);

    obj.comboBox51 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox51:setParent(obj.layout146);
    obj.comboBox51:setTransparent(true);
    obj.comboBox51:setField("cha_");
    obj.comboBox51:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox51.grid.role = "col";
    obj.comboBox51.grid.width = 2;
    obj.comboBox51:setHorzTextAlign("center");
    obj.comboBox51:setName("comboBox51");
    obj.comboBox51:setHeight(25);

    obj.edit256 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout146);
    obj.edit256:setTransparent(true);
    obj.edit256:setField("valAtr_");
    obj.edit256.grid.role = "col";
    obj.edit256.grid.width = 2;
    obj.edit256:setHorzTextAlign("center");
    obj.edit256:setName("edit256");
    obj.edit256:setHeight(25);

    obj.edit257 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout146);
    obj.edit257:setTransparent(true);
    obj.edit257:setField("nivel_");
    obj.edit257.grid.role = "col";
    obj.edit257.grid.width = 2;
    obj.edit257:setHorzTextAlign("center");
    obj.edit257:setName("edit257");
    obj.edit257:setHeight(25);

    obj.edit258 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout146);
    obj.edit258:setTransparent(true);
    obj.edit258:setField("outro_");
    obj.edit258.grid.role = "col";
    obj.edit258.grid.width = 1;
    obj.edit258:setHorzTextAlign("center");
    obj.edit258:setName("edit258");
    obj.edit258:setHeight(25);

    obj.button67 = GUI.fromHandle(_obj_newObject("button"));
    obj.button67:setParent(obj.layout146);
    obj.button67.grid.role = "col";
    obj.button67.grid.width = 1;
    obj.button67:setText("🎲");
    obj.button67:setName("button67");

    obj.horzLine70 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine70:setParent(obj.layout146);
    obj.horzLine70.grid.role = "row";
    obj.horzLine70:setName("horzLine70");
    obj.horzLine70:setStrokeColor("grey");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.scrollBox2);
    obj.layout147.grid.role = "row";
    obj.layout147.grid.width = 12;
    obj.layout147.grid["auto-height"] = true;
    obj.layout147:setName("layout147");

    obj.edit259 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout147);
    obj.edit259:setTransparent(true);
    obj.edit259:setField("");
    obj.edit259.grid.role = "col";
    obj.edit259.grid.width = 4;
    obj.edit259:setHorzTextAlign("leading");
    obj.edit259:setName("edit259");
    obj.edit259:setHeight(25);

    obj.comboBox52 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox52:setParent(obj.layout147);
    obj.comboBox52:setTransparent(true);
    obj.comboBox52:setField("cha_");
    obj.comboBox52:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox52.grid.role = "col";
    obj.comboBox52.grid.width = 2;
    obj.comboBox52:setHorzTextAlign("center");
    obj.comboBox52:setName("comboBox52");
    obj.comboBox52:setHeight(25);

    obj.edit260 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout147);
    obj.edit260:setTransparent(true);
    obj.edit260:setField("valAtr_");
    obj.edit260.grid.role = "col";
    obj.edit260.grid.width = 2;
    obj.edit260:setHorzTextAlign("center");
    obj.edit260:setName("edit260");
    obj.edit260:setHeight(25);

    obj.edit261 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout147);
    obj.edit261:setTransparent(true);
    obj.edit261:setField("nivel_");
    obj.edit261.grid.role = "col";
    obj.edit261.grid.width = 2;
    obj.edit261:setHorzTextAlign("center");
    obj.edit261:setName("edit261");
    obj.edit261:setHeight(25);

    obj.edit262 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout147);
    obj.edit262:setTransparent(true);
    obj.edit262:setField("outro_");
    obj.edit262.grid.role = "col";
    obj.edit262.grid.width = 1;
    obj.edit262:setHorzTextAlign("center");
    obj.edit262:setName("edit262");
    obj.edit262:setHeight(25);

    obj.button68 = GUI.fromHandle(_obj_newObject("button"));
    obj.button68:setParent(obj.layout147);
    obj.button68.grid.role = "col";
    obj.button68.grid.width = 1;
    obj.button68:setText("🎲");
    obj.button68:setName("button68");

    obj.horzLine71 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine71:setParent(obj.layout147);
    obj.horzLine71.grid.role = "row";
    obj.horzLine71:setName("horzLine71");
    obj.horzLine71:setStrokeColor("grey");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.scrollBox2);
    obj.layout148.grid.role = "row";
    obj.layout148.grid.width = 12;
    obj.layout148.grid["auto-height"] = true;
    obj.layout148:setName("layout148");

    obj.edit263 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout148);
    obj.edit263:setTransparent(true);
    obj.edit263:setField("");
    obj.edit263.grid.role = "col";
    obj.edit263.grid.width = 4;
    obj.edit263:setHorzTextAlign("leading");
    obj.edit263:setName("edit263");
    obj.edit263:setHeight(25);

    obj.comboBox53 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox53:setParent(obj.layout148);
    obj.comboBox53:setTransparent(true);
    obj.comboBox53:setField("cha_");
    obj.comboBox53:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox53.grid.role = "col";
    obj.comboBox53.grid.width = 2;
    obj.comboBox53:setHorzTextAlign("center");
    obj.comboBox53:setName("comboBox53");
    obj.comboBox53:setHeight(25);

    obj.edit264 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout148);
    obj.edit264:setTransparent(true);
    obj.edit264:setField("valAtr_");
    obj.edit264.grid.role = "col";
    obj.edit264.grid.width = 2;
    obj.edit264:setHorzTextAlign("center");
    obj.edit264:setName("edit264");
    obj.edit264:setHeight(25);

    obj.edit265 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout148);
    obj.edit265:setTransparent(true);
    obj.edit265:setField("nivel_");
    obj.edit265.grid.role = "col";
    obj.edit265.grid.width = 2;
    obj.edit265:setHorzTextAlign("center");
    obj.edit265:setName("edit265");
    obj.edit265:setHeight(25);

    obj.edit266 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.layout148);
    obj.edit266:setTransparent(true);
    obj.edit266:setField("outro_");
    obj.edit266.grid.role = "col";
    obj.edit266.grid.width = 1;
    obj.edit266:setHorzTextAlign("center");
    obj.edit266:setName("edit266");
    obj.edit266:setHeight(25);

    obj.button69 = GUI.fromHandle(_obj_newObject("button"));
    obj.button69:setParent(obj.layout148);
    obj.button69.grid.role = "col";
    obj.button69.grid.width = 1;
    obj.button69:setText("🎲");
    obj.button69:setName("button69");

    obj.horzLine72 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine72:setParent(obj.layout148);
    obj.horzLine72.grid.role = "row";
    obj.horzLine72:setName("horzLine72");
    obj.horzLine72:setStrokeColor("grey");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout97);
    obj.rectangle64.grid.role = "col";
    obj.rectangle64.grid.width = 12;
    obj.rectangle64.grid["auto-height"] = true;
    obj.rectangle64:setName("rectangle64");
    lfm_setPropAsString(obj.rectangle64, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle64:setCornerType("round");
    obj.rectangle64:setXradius(15);
    obj.rectangle64:setYradius(15);
    obj.rectangle64:setStrokeColor("#343434");
    obj.rectangle64:setStrokeSize(2);
    obj.rectangle64:setColor("#1f1e1e");
    obj.rectangle64.grid["padding-top"] = 5;
    obj.rectangle64.grid["padding-left"] = 8;
    obj.rectangle64.grid["padding-right"] = 8;
    obj.rectangle64.grid["padding-bottom"] = 5;

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.rectangle64);
    obj.rectangle65:setColor("grey");
    obj.rectangle65:setXradius(0);
    obj.rectangle65:setYradius(0);
    obj.rectangle65.grid.role = "col";
    obj.rectangle65.grid.width = 12;
    obj.rectangle65.grid["cnt-vert-align"] = "center";
    obj.rectangle65.grid["max-height"] = 23;
    obj.rectangle65.grid["margin-bottom"] = 5;
    obj.rectangle65.grid["margin-top"] = -5;
    obj.rectangle65.grid["margin-left"] = -5;
    obj.rectangle65.grid["margin-right"] = -5;
    obj.rectangle65:setName("rectangle65");
    lfm_setPropAsString(obj.rectangle65, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle65:setCornerType("round");
    obj.rectangle65:setStrokeColor("#343434");
    obj.rectangle65:setStrokeSize(2);
    obj.rectangle65.grid["padding-top"] = 5;
    obj.rectangle65.grid["padding-left"] = 8;
    obj.rectangle65.grid["padding-right"] = 8;
    obj.rectangle65.grid["padding-bottom"] = 5;

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle65);
    obj.label69:setText("ESPIRAL VITAL");
    obj.label69:setHorzTextAlign("leading");
    obj.label69:setFontSize(15);
    lfm_setPropAsString(obj.label69, "fontStyle", "bold");
    obj.label69.grid.role = "col";
    obj.label69:setFontColor("black");
    obj.label69.grid["dyn-width-txt"] = true;
    obj.label69:setName("label69");
    obj.label69:setHeight(25);

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.rectangle64);
    obj.layout149.grid.role = "col";
    obj.layout149.grid.width = 2;
    obj.layout149.grid["auto-height"] = true;
    obj.layout149.grid["vert-tile"] = true;
    obj.layout149.grid["cnt-vert-align"] = "center";
    obj.layout149.grid["cnt-line-spacing"] = 50;
    obj.layout149:setName("layout149");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout149);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setText("Físico");
    obj.label70.grid.role = "col";
    obj.label70.grid.width = 12;
    obj.label70:setName("label70");
    obj.label70:setFontColor("#b5b5b5");
    obj.label70:setHeight(25);

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout149);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setText("Agilidade");
    obj.label71.grid.role = "col";
    obj.label71.grid.width = 12;
    obj.label71:setName("label71");
    obj.label71:setFontColor("#b5b5b5");
    obj.label71:setHeight(25);

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout149);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setText("Intelecto");
    obj.label72.grid.role = "col";
    obj.label72.grid.width = 12;
    obj.label72:setName("label72");
    obj.label72:setFontColor("#b5b5b5");
    obj.label72:setHeight(25);

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.rectangle64);
    obj.layout150.grid.role = "col";
    obj.layout150.grid.width = 7;
    obj.layout150.grid["auto-height"] = true;
    obj.layout150.grid["cnt-line-spacing"] = 5;
    obj.layout150:setName("layout150");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.layout150);
    obj.layout151.grid.role = "col";
    obj.layout151.grid.width = 12;
    obj.layout151.grid["auto-height"] = true;
    obj.layout151.grid["padding-top"] = 8;
    obj.layout151.grid["cnt-gutter"] = 5;
    obj.layout151.grid["padding-bottom"] = 15;
    obj.layout151:setName("layout151");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout151);
    obj.rectangle66:setAlign("client");
    lfm_setPropAsString(obj.rectangle66, "corners", "topRight bottomRight bottomLeft topLeft");
    obj.rectangle66:setStrokeColor("#374457");
    obj.rectangle66.grid["cnt-gutter"] = 5;
    obj.rectangle66:setCornerType("bevel");
    obj.rectangle66:setName("rectangle66");
    obj.rectangle66:setXradius(15);
    obj.rectangle66:setYradius(15);
    obj.rectangle66:setStrokeSize(2);
    obj.rectangle66:setColor("#1f1e1e");
    obj.rectangle66.grid["padding-top"] = 5;
    obj.rectangle66.grid["padding-left"] = 8;
    obj.rectangle66.grid["padding-right"] = 8;
    obj.rectangle66.grid["padding-bottom"] = 5;

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.layout151);
    obj.layout152.grid.role = "col";
    obj.layout152.grid.width = 8;
    obj.layout152.grid["auto-height"] = true;
    obj.layout152:setName("layout152");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.layout152);
    obj.layout153.grid.role = "col";
    obj.layout153.grid.width = 12;
    obj.layout153.grid["auto-height"] = true;
    obj.layout153:setName("layout153");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout153);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setText("1");
    obj.label73.grid.role = "col";
    obj.label73.grid.width = 4;
    obj.label73:setName("label73");
    obj.label73:setFontColor("#b5b5b5");
    obj.label73:setHeight(25);

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout153);
    obj.checkBox1.grid.role = "col";
    obj.checkBox1.grid.width = 2;
    obj.checkBox1:setName("checkBox1");
    obj.checkBox1:setScale(1.2);
    obj.checkBox1.grid["vert-align"] = "middle";

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout153);
    obj.checkBox2.grid.role = "col";
    obj.checkBox2.grid.width = 2;
    obj.checkBox2:setName("checkBox2");
    obj.checkBox2:setScale(1.2);
    obj.checkBox2.grid["vert-align"] = "middle";

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout153);
    obj.checkBox3.grid.role = "col";
    obj.checkBox3.grid.width = 2;
    obj.checkBox3:setName("checkBox3");
    obj.checkBox3:setScale(1.2);
    obj.checkBox3.grid["vert-align"] = "middle";

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout153);
    obj.checkBox4.grid.role = "col";
    obj.checkBox4.grid.width = 2;
    obj.checkBox4:setName("checkBox4");
    obj.checkBox4:setScale(1.2);
    obj.checkBox4.grid["vert-align"] = "middle";

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.layout152);
    obj.layout154.grid.role = "col";
    obj.layout154.grid.width = 12;
    obj.layout154.grid["auto-height"] = true;
    obj.layout154:setName("layout154");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout154);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setText("2");
    obj.label74.grid.role = "col";
    obj.label74.grid.width = 4;
    obj.label74:setName("label74");
    obj.label74:setFontColor("#b5b5b5");
    obj.label74:setHeight(25);

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout154);
    obj.checkBox5.grid.role = "col";
    obj.checkBox5.grid.width = 2;
    obj.checkBox5:setName("checkBox5");
    obj.checkBox5:setScale(1.2);
    obj.checkBox5.grid["vert-align"] = "middle";

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout154);
    obj.checkBox6.grid.role = "col";
    obj.checkBox6.grid.width = 2;
    obj.checkBox6:setName("checkBox6");
    obj.checkBox6:setScale(1.2);
    obj.checkBox6.grid["vert-align"] = "middle";

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout154);
    obj.checkBox7.grid.role = "col";
    obj.checkBox7.grid.width = 2;
    obj.checkBox7:setName("checkBox7");
    obj.checkBox7:setScale(1.2);
    obj.checkBox7.grid["vert-align"] = "middle";

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout154);
    obj.checkBox8.grid.role = "col";
    obj.checkBox8.grid.width = 2;
    obj.checkBox8:setName("checkBox8");
    obj.checkBox8:setScale(1.2);
    obj.checkBox8.grid["vert-align"] = "middle";

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.layout151);
    obj.layout155.grid.role = "col";
    obj.layout155.grid.width = 4;
    obj.layout155.grid["auto-height"] = true;
    obj.layout155.grid["vert-align"] = "center";
    obj.layout155.grid["cnt-gutter"] = 5;
    obj.layout155:setName("layout155");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout155);
    obj.checkBox9.grid.role = "col";
    obj.checkBox9.grid.width = 4;
    obj.checkBox9:setName("checkBox9");
    obj.checkBox9:setScale(1.2);
    obj.checkBox9.grid["vert-align"] = "middle";

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout155);
    obj.checkBox10.grid.role = "col";
    obj.checkBox10.grid.width = 4;
    obj.checkBox10:setName("checkBox10");
    obj.checkBox10:setScale(1.2);
    obj.checkBox10.grid["vert-align"] = "middle";

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.layout155);
    obj.layout156.grid.role = "col";
    obj.layout156.grid.width = 4;
    obj.layout156:setName("layout156");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.layout150);
    obj.layout157.grid.role = "col";
    obj.layout157.grid.width = 12;
    obj.layout157.grid["auto-height"] = true;
    obj.layout157.grid["padding-top"] = 8;
    obj.layout157.grid["cnt-gutter"] = 5;
    obj.layout157.grid["padding-bottom"] = 15;
    obj.layout157:setName("layout157");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout157);
    obj.rectangle67:setAlign("client");
    lfm_setPropAsString(obj.rectangle67, "corners", "topRight bottomRight bottomLeft topLeft");
    obj.rectangle67:setStrokeColor("#57373f");
    obj.rectangle67.grid["cnt-gutter"] = 5;
    obj.rectangle67:setCornerType("bevel");
    obj.rectangle67:setName("rectangle67");
    obj.rectangle67:setXradius(15);
    obj.rectangle67:setYradius(15);
    obj.rectangle67:setStrokeSize(2);
    obj.rectangle67:setColor("#1f1e1e");
    obj.rectangle67.grid["padding-top"] = 5;
    obj.rectangle67.grid["padding-left"] = 8;
    obj.rectangle67.grid["padding-right"] = 8;
    obj.rectangle67.grid["padding-bottom"] = 5;

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.layout157);
    obj.layout158.grid.role = "col";
    obj.layout158.grid.width = 8;
    obj.layout158.grid["auto-height"] = true;
    obj.layout158:setName("layout158");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.layout158);
    obj.layout159.grid.role = "col";
    obj.layout159.grid.width = 12;
    obj.layout159.grid["auto-height"] = true;
    obj.layout159:setName("layout159");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout159);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setText("3");
    obj.label75.grid.role = "col";
    obj.label75.grid.width = 4;
    obj.label75:setName("label75");
    obj.label75:setFontColor("#b5b5b5");
    obj.label75:setHeight(25);

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout159);
    obj.checkBox11.grid.role = "col";
    obj.checkBox11.grid.width = 2;
    obj.checkBox11:setName("checkBox11");
    obj.checkBox11:setScale(1.2);
    obj.checkBox11.grid["vert-align"] = "middle";

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout159);
    obj.checkBox12.grid.role = "col";
    obj.checkBox12.grid.width = 2;
    obj.checkBox12:setName("checkBox12");
    obj.checkBox12:setScale(1.2);
    obj.checkBox12.grid["vert-align"] = "middle";

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout159);
    obj.checkBox13.grid.role = "col";
    obj.checkBox13.grid.width = 2;
    obj.checkBox13:setName("checkBox13");
    obj.checkBox13:setScale(1.2);
    obj.checkBox13.grid["vert-align"] = "middle";

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout159);
    obj.checkBox14.grid.role = "col";
    obj.checkBox14.grid.width = 2;
    obj.checkBox14:setName("checkBox14");
    obj.checkBox14:setScale(1.2);
    obj.checkBox14.grid["vert-align"] = "middle";

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.layout158);
    obj.layout160.grid.role = "col";
    obj.layout160.grid.width = 12;
    obj.layout160.grid["auto-height"] = true;
    obj.layout160:setName("layout160");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout160);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setText("4");
    obj.label76.grid.role = "col";
    obj.label76.grid.width = 4;
    obj.label76:setName("label76");
    obj.label76:setFontColor("#b5b5b5");
    obj.label76:setHeight(25);

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout160);
    obj.checkBox15.grid.role = "col";
    obj.checkBox15.grid.width = 2;
    obj.checkBox15:setName("checkBox15");
    obj.checkBox15:setScale(1.2);
    obj.checkBox15.grid["vert-align"] = "middle";

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout160);
    obj.checkBox16.grid.role = "col";
    obj.checkBox16.grid.width = 2;
    obj.checkBox16:setName("checkBox16");
    obj.checkBox16:setScale(1.2);
    obj.checkBox16.grid["vert-align"] = "middle";

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout160);
    obj.checkBox17.grid.role = "col";
    obj.checkBox17.grid.width = 2;
    obj.checkBox17:setName("checkBox17");
    obj.checkBox17:setScale(1.2);
    obj.checkBox17.grid["vert-align"] = "middle";

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout160);
    obj.checkBox18.grid.role = "col";
    obj.checkBox18.grid.width = 2;
    obj.checkBox18:setName("checkBox18");
    obj.checkBox18:setScale(1.2);
    obj.checkBox18.grid["vert-align"] = "middle";

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.layout157);
    obj.layout161.grid.role = "col";
    obj.layout161.grid.width = 4;
    obj.layout161.grid["auto-height"] = true;
    obj.layout161.grid["vert-align"] = "center";
    obj.layout161.grid["cnt-gutter"] = 5;
    obj.layout161:setName("layout161");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout161);
    obj.checkBox19.grid.role = "col";
    obj.checkBox19.grid.width = 4;
    obj.checkBox19:setName("checkBox19");
    obj.checkBox19:setScale(1.2);
    obj.checkBox19.grid["vert-align"] = "middle";

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout161);
    obj.checkBox20.grid.role = "col";
    obj.checkBox20.grid.width = 4;
    obj.checkBox20:setName("checkBox20");
    obj.checkBox20:setScale(1.2);
    obj.checkBox20.grid["vert-align"] = "middle";

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.layout161);
    obj.layout162.grid.role = "col";
    obj.layout162.grid.width = 4;
    obj.layout162:setName("layout162");

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.layout150);
    obj.layout163.grid.role = "col";
    obj.layout163.grid.width = 12;
    obj.layout163.grid["auto-height"] = true;
    obj.layout163.grid["padding-top"] = 8;
    obj.layout163.grid["cnt-gutter"] = 5;
    obj.layout163.grid["padding-bottom"] = 15;
    obj.layout163:setName("layout163");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout163);
    obj.rectangle68:setAlign("client");
    lfm_setPropAsString(obj.rectangle68, "corners", "topRight bottomRight bottomLeft topLeft");
    obj.rectangle68:setStrokeColor("#475737");
    obj.rectangle68.grid["cnt-gutter"] = 5;
    obj.rectangle68:setCornerType("bevel");
    obj.rectangle68:setName("rectangle68");
    obj.rectangle68:setXradius(15);
    obj.rectangle68:setYradius(15);
    obj.rectangle68:setStrokeSize(2);
    obj.rectangle68:setColor("#1f1e1e");
    obj.rectangle68.grid["padding-top"] = 5;
    obj.rectangle68.grid["padding-left"] = 8;
    obj.rectangle68.grid["padding-right"] = 8;
    obj.rectangle68.grid["padding-bottom"] = 5;

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.layout163);
    obj.layout164.grid.role = "col";
    obj.layout164.grid.width = 8;
    obj.layout164.grid["auto-height"] = true;
    obj.layout164:setName("layout164");

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.layout164);
    obj.layout165.grid.role = "col";
    obj.layout165.grid.width = 12;
    obj.layout165.grid["auto-height"] = true;
    obj.layout165:setName("layout165");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout165);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setText("5");
    obj.label77.grid.role = "col";
    obj.label77.grid.width = 4;
    obj.label77:setName("label77");
    obj.label77:setFontColor("#b5b5b5");
    obj.label77:setHeight(25);

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout165);
    obj.checkBox21.grid.role = "col";
    obj.checkBox21.grid.width = 2;
    obj.checkBox21:setName("checkBox21");
    obj.checkBox21:setScale(1.2);
    obj.checkBox21.grid["vert-align"] = "middle";

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout165);
    obj.checkBox22.grid.role = "col";
    obj.checkBox22.grid.width = 2;
    obj.checkBox22:setName("checkBox22");
    obj.checkBox22:setScale(1.2);
    obj.checkBox22.grid["vert-align"] = "middle";

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout165);
    obj.checkBox23.grid.role = "col";
    obj.checkBox23.grid.width = 2;
    obj.checkBox23:setName("checkBox23");
    obj.checkBox23:setScale(1.2);
    obj.checkBox23.grid["vert-align"] = "middle";

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout165);
    obj.checkBox24.grid.role = "col";
    obj.checkBox24.grid.width = 2;
    obj.checkBox24:setName("checkBox24");
    obj.checkBox24:setScale(1.2);
    obj.checkBox24.grid["vert-align"] = "middle";

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.layout164);
    obj.layout166.grid.role = "col";
    obj.layout166.grid.width = 12;
    obj.layout166.grid["auto-height"] = true;
    obj.layout166:setName("layout166");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout166);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setText("6");
    obj.label78.grid.role = "col";
    obj.label78.grid.width = 4;
    obj.label78:setName("label78");
    obj.label78:setFontColor("#b5b5b5");
    obj.label78:setHeight(25);

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout166);
    obj.checkBox25.grid.role = "col";
    obj.checkBox25.grid.width = 2;
    obj.checkBox25:setName("checkBox25");
    obj.checkBox25:setScale(1.2);
    obj.checkBox25.grid["vert-align"] = "middle";

    obj.checkBox26 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout166);
    obj.checkBox26.grid.role = "col";
    obj.checkBox26.grid.width = 2;
    obj.checkBox26:setName("checkBox26");
    obj.checkBox26:setScale(1.2);
    obj.checkBox26.grid["vert-align"] = "middle";

    obj.checkBox27 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout166);
    obj.checkBox27.grid.role = "col";
    obj.checkBox27.grid.width = 2;
    obj.checkBox27:setName("checkBox27");
    obj.checkBox27:setScale(1.2);
    obj.checkBox27.grid["vert-align"] = "middle";

    obj.checkBox28 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout166);
    obj.checkBox28.grid.role = "col";
    obj.checkBox28.grid.width = 2;
    obj.checkBox28:setName("checkBox28");
    obj.checkBox28:setScale(1.2);
    obj.checkBox28.grid["vert-align"] = "middle";

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.layout163);
    obj.layout167.grid.role = "col";
    obj.layout167.grid.width = 4;
    obj.layout167.grid["auto-height"] = true;
    obj.layout167.grid["vert-align"] = "center";
    obj.layout167.grid["cnt-gutter"] = 5;
    obj.layout167:setName("layout167");

    obj.checkBox29 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout167);
    obj.checkBox29.grid.role = "col";
    obj.checkBox29.grid.width = 4;
    obj.checkBox29:setName("checkBox29");
    obj.checkBox29:setScale(1.2);
    obj.checkBox29.grid["vert-align"] = "middle";

    obj.checkBox30 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout167);
    obj.checkBox30.grid.role = "col";
    obj.checkBox30.grid.width = 4;
    obj.checkBox30:setName("checkBox30");
    obj.checkBox30:setScale(1.2);
    obj.checkBox30.grid["vert-align"] = "middle";

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.layout167);
    obj.layout168.grid.role = "col";
    obj.layout168.grid.width = 4;
    obj.layout168:setName("layout168");

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.rectangle64);
    obj.layout169.grid.role = "col";
    obj.layout169.grid.width = 3;
    obj.layout169.grid["auto-height"] = true;
    obj.layout169.grid["vert-tile"] = true;
    obj.layout169.grid["cnt-vert-align"] = "center";
    obj.layout169.grid["cnt-line-spacing"] = 50;
    obj.layout169:setName("layout169");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout169);
    obj.label79:setHorzTextAlign("leading");
    obj.label79:setText("- 2 FOR");
    obj.label79.grid.role = "col";
    obj.label79.grid.width = 12;
    obj.label79:setName("label79");
    obj.label79:setFontColor("#b5b5b5");
    obj.label79:setHeight(25);

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout169);
    obj.label80:setHorzTextAlign("leading");
    obj.label80:setText("-2 nas jogadas de ataque");
    obj.label80.grid.role = "col";
    obj.label80.grid.width = 12;
    obj.label80:setTextTrimming("none");
    obj.label80:setName("label80");
    obj.label80:setFontColor("#b5b5b5");
    obj.label80:setHeight(25);

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout169);
    obj.label81:setHorzTextAlign("leading");
    obj.label81:setText("-2 DEF e não pode soltar magias");
    obj.label81.grid.role = "col";
    obj.label81.grid.width = 12;
    obj.label81:setTextTrimming("none");
    obj.label81:setName("label81");
    obj.label81:setFontColor("#b5b5b5");
    obj.label81:setHeight(25);

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Equipamentos");
    obj.tab2:setName("tab2");

    obj.Equipamentos = GUI.fromHandle(_obj_newObject("form"));
    obj.Equipamentos:setParent(obj.tab2);
    obj.Equipamentos:setName("Equipamentos");
    obj.Equipamentos:setAlign("client");
    obj.Equipamentos:setTheme("dark");
    obj.Equipamentos.grid["padding-top"] = 8;
    obj.Equipamentos.grid["cnt-line-spacing"] = 4;

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.Equipamentos);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.scrollBox3);
    obj.layout170.grid.role = "col";
    obj.layout170.grid.width = 8;
    obj.layout170.grid["horz-align"] = "center";
    obj.layout170.grid["cnt-gutter"] = 10;
    obj.layout170.grid["min-height"] = 1000;
    obj.layout170.grid["padding-top"] = 30;
    obj.layout170:setName("layout170");

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.layout170);
    obj.layout171.grid.role = "col";
    obj.layout171.grid.width = 6;
    obj.layout171.grid["min-height"] = 400;
    obj.layout171.grid["auto-height"] = true;
    obj.layout171:setName("layout171");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout171);
    obj.rectangle69.grid.role = "col";
    obj.rectangle69.grid.width = 12;
    obj.rectangle69.grid["auto-height"] = true;
    obj.rectangle69.grid["min-height"] = 300;
    obj.rectangle69.grid["padding-left"] = 10;
    obj.rectangle69.grid["padding-right"] = 10;
    obj.rectangle69.grid["margin-bottom"] = 10;
    obj.rectangle69:setName("rectangle69");
    lfm_setPropAsString(obj.rectangle69, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle69:setCornerType("round");
    obj.rectangle69:setXradius(15);
    obj.rectangle69:setYradius(15);
    obj.rectangle69:setStrokeColor("#343434");
    obj.rectangle69:setStrokeSize(2);
    obj.rectangle69:setColor("#1f1e1e");
    obj.rectangle69.grid["padding-top"] = 5;
    obj.rectangle69.grid["padding-bottom"] = 5;

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.rectangle69);
    obj.rectangle70:setColor("grey");
    obj.rectangle70:setXradius(0);
    obj.rectangle70:setYradius(0);
    obj.rectangle70.grid.role = "row";
    obj.rectangle70.grid.width = 12;
    obj.rectangle70.grid["cnt-vert-align"] = "center";
    obj.rectangle70.grid["max-height"] = 23;
    obj.rectangle70.grid["margin-bottom"] = 5;
    obj.rectangle70.grid["margin-top"] = -5;
    obj.rectangle70.grid["margin-left"] = -5;
    obj.rectangle70.grid["margin-right"] = -5;
    obj.rectangle70:setName("rectangle70");
    lfm_setPropAsString(obj.rectangle70, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle70:setCornerType("round");
    obj.rectangle70:setStrokeColor("#343434");
    obj.rectangle70:setStrokeSize(2);
    obj.rectangle70.grid["padding-top"] = 5;
    obj.rectangle70.grid["padding-left"] = 8;
    obj.rectangle70.grid["padding-right"] = 8;
    obj.rectangle70.grid["padding-bottom"] = 5;

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.rectangle70);
    obj.label82:setText("ARMAS CORPO A CORPO");
    obj.label82:setHorzTextAlign("leading");
    obj.label82:setFontSize(15);
    lfm_setPropAsString(obj.label82, "fontStyle", "bold");
    obj.label82.grid.role = "col";
    obj.label82:setFontColor("black");
    obj.label82.grid["dyn-width-txt"] = true;
    obj.label82:setName("label82");
    obj.label82:setHeight(25);

    obj.button70 = GUI.fromHandle(_obj_newObject("button"));
    obj.button70:setParent(obj.rectangle69);
    obj.button70:setText("➕");
    obj.button70.grid.role = "col";
    obj.button70.grid.width = 1;
    obj.button70:setName("button70");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.rectangle69);
    obj.label83:setText("NOME");
    obj.label83:setHorzTextAlign("leading");
    obj.label83.grid.role = "col";
    obj.label83.grid.width = 3;
    obj.label83:setName("label83");
    obj.label83:setFontColor("#b5b5b5");
    obj.label83:setHeight(25);

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.rectangle69);
    obj.label84:setText("NOTAS");
    obj.label84:setHorzTextAlign("leading");
    obj.label84.grid.role = "col";
    obj.label84.grid.width = 4;
    obj.label84:setName("label84");
    obj.label84:setFontColor("#b5b5b5");
    obj.label84:setHeight(25);

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.rectangle69);
    obj.label85:setText("ACO");
    obj.label85:setHorzTextAlign("leading");
    obj.label85.grid.role = "col";
    obj.label85.grid.width = 1;
    obj.label85:setHitTest(true);
    obj.label85:setHint("Maestria (MAE) + Pericia Militar");
    obj.label85:setName("label85");
    obj.label85:setFontColor("#b5b5b5");
    obj.label85:setHeight(25);

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.rectangle69);
    obj.label86:setText("POD");
    obj.label86:setHorzTextAlign("center");
    obj.label86.grid.role = "col";
    obj.label86.grid.width = 2;
    obj.label86:setName("label86");
    obj.label86:setFontColor("#b5b5b5");
    obj.label86:setHeight(25);

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.rectangle69);
    obj.label87:setText("EQUIP");
    obj.label87:setHorzTextAlign("leading");
    obj.label87.grid.role = "col";
    obj.label87.grid.width = 1;
    obj.label87:setName("label87");
    obj.label87:setFontColor("#b5b5b5");
    obj.label87:setHeight(25);

    obj.rclArmasMelee = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmasMelee:setParent(obj.rectangle69);
    obj.rclArmasMelee:setName("rclArmasMelee");
    obj.rclArmasMelee:setField("armasMelee");
    obj.rclArmasMelee:setTemplateForm("frmItemArmaMelee");
    obj.rclArmasMelee.grid.role = "col";
    obj.rclArmasMelee.grid.width = 12;
    obj.rclArmasMelee.grid["min-height"] = 240;

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout171);
    obj.rectangle71.grid.role = "col";
    obj.rectangle71.grid.width = 12;
    obj.rectangle71.grid["auto-height"] = true;
    obj.rectangle71.grid["min-height"] = 500;
    obj.rectangle71.grid["padding-left"] = 10;
    obj.rectangle71.grid["padding-right"] = 10;
    obj.rectangle71.grid["margin-bottom"] = 10;
    obj.rectangle71:setName("rectangle71");
    lfm_setPropAsString(obj.rectangle71, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle71:setCornerType("round");
    obj.rectangle71:setXradius(15);
    obj.rectangle71:setYradius(15);
    obj.rectangle71:setStrokeColor("#343434");
    obj.rectangle71:setStrokeSize(2);
    obj.rectangle71:setColor("#1f1e1e");
    obj.rectangle71.grid["padding-top"] = 5;
    obj.rectangle71.grid["padding-bottom"] = 5;

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.rectangle71);
    obj.rectangle72:setColor("grey");
    obj.rectangle72:setXradius(0);
    obj.rectangle72:setYradius(0);
    obj.rectangle72.grid.role = "row";
    obj.rectangle72.grid.width = 12;
    obj.rectangle72.grid["cnt-vert-align"] = "center";
    obj.rectangle72.grid["max-height"] = 23;
    obj.rectangle72.grid["margin-bottom"] = 5;
    obj.rectangle72.grid["margin-top"] = -5;
    obj.rectangle72.grid["margin-left"] = -5;
    obj.rectangle72.grid["margin-right"] = -5;
    obj.rectangle72:setName("rectangle72");
    lfm_setPropAsString(obj.rectangle72, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle72:setCornerType("round");
    obj.rectangle72:setStrokeColor("#343434");
    obj.rectangle72:setStrokeSize(2);
    obj.rectangle72.grid["padding-top"] = 5;
    obj.rectangle72.grid["padding-left"] = 8;
    obj.rectangle72.grid["padding-right"] = 8;
    obj.rectangle72.grid["padding-bottom"] = 5;

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.rectangle72);
    obj.label88:setText("EQUIPAMENTO");
    obj.label88:setHorzTextAlign("leading");
    obj.label88:setFontSize(15);
    lfm_setPropAsString(obj.label88, "fontStyle", "bold");
    obj.label88.grid.role = "col";
    obj.label88:setFontColor("black");
    obj.label88.grid["dyn-width-txt"] = true;
    obj.label88:setName("label88");
    obj.label88:setHeight(25);

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.rectangle71);
    obj.layout172.grid.role = "col";
    obj.layout172.grid.width = 12;
    obj.layout172.grid["auto-height"] = true;
    obj.layout172.grid["margin-left"] = 10;
    obj.layout172.grid["margin-right"] = 10;
    obj.layout172.grid["margin-top"] = 10;
    obj.layout172.grid["margin-bottom"] = 10;
    obj.layout172:setName("layout172");

    obj.button71 = GUI.fromHandle(_obj_newObject("button"));
    obj.button71:setParent(obj.layout172);
    obj.button71:setText("➕");
    obj.button71.grid.role = "col";
    obj.button71.grid.width = 1;
    obj.button71:setName("button71");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout172);
    obj.label89:setText("NOME");
    obj.label89:setHorzTextAlign("leading");
    obj.label89.grid.role = "col";
    obj.label89.grid.width = 4;
    obj.label89:setName("label89");
    obj.label89:setFontColor("#b5b5b5");
    obj.label89:setHeight(25);

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout172);
    obj.label90:setText("DESCRIÇÃO");
    obj.label90:setHorzTextAlign("leading");
    obj.label90.grid.role = "col";
    obj.label90.grid.width = 5;
    obj.label90:setName("label90");
    obj.label90:setFontColor("#b5b5b5");
    obj.label90:setHeight(25);

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout172);
    obj.label91:setText("PREÇO (CO)");
    obj.label91:setHorzTextAlign("leading");
    obj.label91.grid.role = "col";
    obj.label91.grid.width = 2;
    obj.label91:setName("label91");
    obj.label91:setFontColor("#b5b5b5");
    obj.label91:setHeight(25);

    obj.rclEquipamento = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquipamento:setParent(obj.layout172);
    obj.rclEquipamento:setName("rclEquipamento");
    obj.rclEquipamento:setField("equipamento");
    obj.rclEquipamento:setTemplateForm("frmItemEquip");
    obj.rclEquipamento.grid.role = "col";
    obj.rclEquipamento.grid.width = 12;
    obj.rclEquipamento.grid["min-height"] = 440;

    obj.layout173 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.layout170);
    obj.layout173.grid.role = "col";
    obj.layout173.grid.width = 6;
    obj.layout173.grid["min-height"] = 400;
    obj.layout173.grid["auto-height"] = true;
    obj.layout173:setName("layout173");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout173);
    obj.rectangle73.grid.role = "col";
    obj.rectangle73.grid.width = 12;
    obj.rectangle73.grid["auto-height"] = true;
    obj.rectangle73.grid["min-height"] = 300;
    obj.rectangle73.grid["padding-left"] = 10;
    obj.rectangle73.grid["padding-right"] = 10;
    obj.rectangle73.grid["margin-bottom"] = 10;
    obj.rectangle73:setName("rectangle73");
    lfm_setPropAsString(obj.rectangle73, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle73:setCornerType("round");
    obj.rectangle73:setXradius(15);
    obj.rectangle73:setYradius(15);
    obj.rectangle73:setStrokeColor("#343434");
    obj.rectangle73:setStrokeSize(2);
    obj.rectangle73:setColor("#1f1e1e");
    obj.rectangle73.grid["padding-top"] = 5;
    obj.rectangle73.grid["padding-bottom"] = 5;

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.rectangle73);
    obj.rectangle74:setColor("grey");
    obj.rectangle74:setXradius(0);
    obj.rectangle74:setYradius(0);
    obj.rectangle74.grid.role = "row";
    obj.rectangle74.grid.width = 12;
    obj.rectangle74.grid["cnt-vert-align"] = "center";
    obj.rectangle74.grid["max-height"] = 23;
    obj.rectangle74.grid["margin-bottom"] = 5;
    obj.rectangle74.grid["margin-top"] = -5;
    obj.rectangle74.grid["margin-left"] = -5;
    obj.rectangle74.grid["margin-right"] = -5;
    obj.rectangle74:setName("rectangle74");
    lfm_setPropAsString(obj.rectangle74, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle74:setCornerType("round");
    obj.rectangle74:setStrokeColor("#343434");
    obj.rectangle74:setStrokeSize(2);
    obj.rectangle74.grid["padding-top"] = 5;
    obj.rectangle74.grid["padding-left"] = 8;
    obj.rectangle74.grid["padding-right"] = 8;
    obj.rectangle74.grid["padding-bottom"] = 5;

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.rectangle74);
    obj.label92:setText("ARMAS À DISTANCIA");
    obj.label92:setHorzTextAlign("leading");
    obj.label92:setFontSize(15);
    lfm_setPropAsString(obj.label92, "fontStyle", "bold");
    obj.label92.grid.role = "col";
    obj.label92:setFontColor("black");
    obj.label92.grid["dyn-width-txt"] = true;
    obj.label92:setName("label92");
    obj.label92:setHeight(25);

    obj.button72 = GUI.fromHandle(_obj_newObject("button"));
    obj.button72:setParent(obj.rectangle73);
    obj.button72:setText("➕");
    obj.button72.grid.role = "col";
    obj.button72.grid.width = 1;
    obj.button72:setName("button72");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.rectangle73);
    obj.label93:setText("NOME");
    obj.label93:setHorzTextAlign("leading");
    obj.label93.grid.role = "col";
    obj.label93.grid.width = 3;
    obj.label93:setName("label93");
    obj.label93:setFontColor("#b5b5b5");
    obj.label93:setHeight(25);

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.rectangle73);
    obj.label94:setText("NOTAS");
    obj.label94:setHorzTextAlign("leading");
    obj.label94.grid.role = "col";
    obj.label94.grid.width = 3;
    obj.label94:setName("label94");
    obj.label94:setFontColor("#b5b5b5");
    obj.label94:setHeight(25);

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.rectangle73);
    obj.label95:setText("ALC");
    obj.label95:setHorzTextAlign("leading");
    obj.label95.grid.role = "col";
    obj.label95.grid.width = 1;
    obj.label95:setHitTest(true);
    obj.label95:setHint("Maestria (MAE) + Pericia Militar");
    obj.label95:setName("label95");
    obj.label95:setFontColor("#b5b5b5");
    obj.label95:setHeight(25);

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.rectangle73);
    obj.label96:setText("ADI");
    obj.label96:setHorzTextAlign("leading");
    obj.label96.grid.role = "col";
    obj.label96.grid.width = 1;
    obj.label96:setName("label96");
    obj.label96:setFontColor("#b5b5b5");
    obj.label96:setHeight(25);

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.rectangle73);
    obj.label97:setText("POD");
    obj.label97:setHorzTextAlign("leading");
    obj.label97.grid.role = "col";
    obj.label97.grid.width = 1;
    obj.label97:setName("label97");
    obj.label97:setFontColor("#b5b5b5");
    obj.label97:setHeight(25);

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.rectangle73);
    obj.label98:setText("MUN");
    obj.label98:setHorzTextAlign("leading");
    obj.label98.grid.role = "col";
    obj.label98.grid.width = 1;
    obj.label98:setName("label98");
    obj.label98:setFontColor("#b5b5b5");
    obj.label98:setHeight(25);

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.rectangle73);
    obj.label99:setText("EQUIP");
    obj.label99:setHorzTextAlign("leading");
    obj.label99.grid.role = "col";
    obj.label99.grid.width = 1;
    obj.label99:setName("label99");
    obj.label99:setFontColor("#b5b5b5");
    obj.label99:setHeight(25);

    obj.rclArmasRanged = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmasRanged:setParent(obj.rectangle73);
    obj.rclArmasRanged:setName("rclArmasRanged");
    obj.rclArmasRanged:setField("armasRanged");
    obj.rclArmasRanged:setTemplateForm("frmItemArmaRanged");
    obj.rclArmasRanged.grid.role = "col";
    obj.rclArmasRanged.grid.width = 12;
    obj.rclArmasRanged.grid["min-height"] = 240;

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout173);
    obj.rectangle75.grid.role = "col";
    obj.rectangle75.grid.width = 12;
    obj.rectangle75.grid["auto-height"] = true;
    obj.rectangle75.grid["min-height"] = 200;
    obj.rectangle75.grid["padding-left"] = 10;
    obj.rectangle75.grid["padding-right"] = 10;
    obj.rectangle75.grid["margin-bottom"] = 10;
    obj.rectangle75:setName("rectangle75");
    lfm_setPropAsString(obj.rectangle75, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle75:setCornerType("round");
    obj.rectangle75:setXradius(15);
    obj.rectangle75:setYradius(15);
    obj.rectangle75:setStrokeColor("#343434");
    obj.rectangle75:setStrokeSize(2);
    obj.rectangle75:setColor("#1f1e1e");
    obj.rectangle75.grid["padding-top"] = 5;
    obj.rectangle75.grid["padding-bottom"] = 5;

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.rectangle75);
    obj.rectangle76:setColor("grey");
    obj.rectangle76:setXradius(0);
    obj.rectangle76:setYradius(0);
    obj.rectangle76.grid.role = "row";
    obj.rectangle76.grid.width = 12;
    obj.rectangle76.grid["cnt-vert-align"] = "center";
    obj.rectangle76.grid["max-height"] = 23;
    obj.rectangle76.grid["margin-bottom"] = 5;
    obj.rectangle76.grid["margin-top"] = -5;
    obj.rectangle76.grid["margin-left"] = -5;
    obj.rectangle76.grid["margin-right"] = -5;
    obj.rectangle76:setName("rectangle76");
    lfm_setPropAsString(obj.rectangle76, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle76:setCornerType("round");
    obj.rectangle76:setStrokeColor("#343434");
    obj.rectangle76:setStrokeSize(2);
    obj.rectangle76.grid["padding-top"] = 5;
    obj.rectangle76.grid["padding-left"] = 8;
    obj.rectangle76.grid["padding-right"] = 8;
    obj.rectangle76.grid["padding-bottom"] = 5;

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.rectangle76);
    obj.label100:setText("ARMADURA");
    obj.label100:setHorzTextAlign("leading");
    obj.label100:setFontSize(15);
    lfm_setPropAsString(obj.label100, "fontStyle", "bold");
    obj.label100.grid.role = "col";
    obj.label100:setFontColor("black");
    obj.label100.grid["dyn-width-txt"] = true;
    obj.label100:setName("label100");
    obj.label100:setHeight(25);

    obj.button73 = GUI.fromHandle(_obj_newObject("button"));
    obj.button73:setParent(obj.rectangle75);
    obj.button73:setText("➕");
    obj.button73.grid.role = "col";
    obj.button73.grid.width = 1;
    obj.button73:setName("button73");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.rectangle75);
    obj.label101:setText("NOME");
    obj.label101:setHorzTextAlign("leading");
    obj.label101.grid.role = "col";
    obj.label101.grid.width = 4;
    obj.label101:setName("label101");
    obj.label101:setFontColor("#b5b5b5");
    obj.label101:setHeight(25);

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.rectangle75);
    obj.label102:setText("DESCRIÇÃO");
    obj.label102:setHorzTextAlign("leading");
    obj.label102.grid.role = "col";
    obj.label102.grid.width = 3;
    obj.label102:setName("label102");
    obj.label102:setFontColor("#b5b5b5");
    obj.label102:setHeight(25);

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.rectangle75);
    obj.label103:setText("VEL");
    obj.label103:setHorzTextAlign("leading");
    obj.label103.grid.role = "col";
    obj.label103.grid.width = 1;
    obj.label103:setHitTest(true);
    obj.label103:setName("label103");
    obj.label103:setFontColor("#b5b5b5");
    obj.label103:setHeight(25);

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.rectangle75);
    obj.label104:setText("DEF");
    obj.label104:setHorzTextAlign("leading");
    obj.label104.grid.role = "col";
    obj.label104.grid.width = 1;
    obj.label104:setName("label104");
    obj.label104:setFontColor("#b5b5b5");
    obj.label104:setHeight(25);

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.rectangle75);
    obj.label105:setText("ARM");
    obj.label105:setHorzTextAlign("leading");
    obj.label105.grid.role = "col";
    obj.label105.grid.width = 1;
    obj.label105:setName("label105");
    obj.label105:setFontColor("#b5b5b5");
    obj.label105:setHeight(25);

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.rectangle75);
    obj.label106:setText("EQUIP");
    obj.label106:setHorzTextAlign("leading");
    obj.label106.grid.role = "col";
    obj.label106.grid.width = 1;
    obj.label106:setName("label106");
    obj.label106:setFontColor("#b5b5b5");
    obj.label106:setHeight(25);

    obj.rclArmadura = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmadura:setParent(obj.rectangle75);
    obj.rclArmadura:setName("rclArmadura");
    obj.rclArmadura:setField("armaduras");
    obj.rclArmadura:setTemplateForm("frmItemArmadura");
    obj.rclArmadura.grid.role = "col";
    obj.rclArmadura.grid.width = 12;
    obj.rclArmadura.grid["min-height"] = 240;

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout173);
    obj.rectangle77.grid.role = "col";
    obj.rectangle77.grid.width = 6;
    obj.rectangle77.grid["auto-height"] = true;
    obj.rectangle77.grid["min-height"] = 100;
    obj.rectangle77.grid["cnt-gutter"] = 20;
    obj.rectangle77.grid["cnt-horz-align"] = "around";
    obj.rectangle77.grid["padding-left"] = 10;
    obj.rectangle77.grid["padding-right"] = 10;
    obj.rectangle77:setName("rectangle77");
    lfm_setPropAsString(obj.rectangle77, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle77:setCornerType("round");
    obj.rectangle77:setXradius(15);
    obj.rectangle77:setYradius(15);
    obj.rectangle77:setStrokeColor("#343434");
    obj.rectangle77:setStrokeSize(2);
    obj.rectangle77:setColor("#1f1e1e");
    obj.rectangle77.grid["padding-top"] = 5;
    obj.rectangle77.grid["padding-bottom"] = 5;

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.rectangle77);
    obj.rectangle78:setColor("grey");
    obj.rectangle78:setXradius(0);
    obj.rectangle78:setYradius(0);
    obj.rectangle78.grid.role = "row";
    obj.rectangle78.grid.width = 12;
    obj.rectangle78.grid["cnt-vert-align"] = "center";
    obj.rectangle78.grid["max-height"] = 23;
    obj.rectangle78.grid["margin-bottom"] = 5;
    obj.rectangle78.grid["margin-top"] = -5;
    obj.rectangle78.grid["margin-left"] = -5;
    obj.rectangle78.grid["margin-right"] = -5;
    obj.rectangle78:setName("rectangle78");
    lfm_setPropAsString(obj.rectangle78, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle78:setCornerType("round");
    obj.rectangle78:setStrokeColor("#343434");
    obj.rectangle78:setStrokeSize(2);
    obj.rectangle78.grid["padding-top"] = 5;
    obj.rectangle78.grid["padding-left"] = 8;
    obj.rectangle78.grid["padding-right"] = 8;
    obj.rectangle78.grid["padding-bottom"] = 5;

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.rectangle78);
    obj.label107:setText("DINHEIRO");
    obj.label107:setHorzTextAlign("leading");
    obj.label107:setFontSize(15);
    lfm_setPropAsString(obj.label107, "fontStyle", "bold");
    obj.label107.grid.role = "col";
    obj.label107:setFontColor("black");
    obj.label107.grid["dyn-width-txt"] = true;
    obj.label107:setName("label107");
    obj.label107:setHeight(25);

    obj.layout174 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.rectangle77);
    obj.layout174.grid.role = "col";
    obj.layout174.grid.width = 12;
    obj.layout174.grid["auto-height"] = true;
    obj.layout174.grid["margin-left"] = 20;
    obj.layout174.grid["margin-right"] = 20;
    obj.layout174.grid["margin-top"] = 20;
    obj.layout174.grid["margin-bottom"] = 20;
    obj.layout174:setName("layout174");

    obj.layout175 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.layout174);
    obj.layout175.grid.role = "col";
    obj.layout175.grid.width = 4;
    obj.layout175.grid["auto-height"] = true;
    obj.layout175.grid["cnt-horz-align"] = "middle";
    obj.layout175.grid["min-width"] = 35;
    obj.layout175:setName("layout175");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout175);
    lfm_setPropAsString(obj.rectangle79, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle79.grid.role = "col";
    obj.rectangle79.grid.width = 12;
    obj.rectangle79.grid["auto-height"] = true;
    obj.rectangle79:setXradius(10);
    obj.rectangle79:setYradius(10);
    obj.rectangle79:setCornerType("bevel");
    obj.rectangle79.grid["min-height"] = 30;
    obj.rectangle79.grid["margin-bottom"] = 0;
    obj.rectangle79:setName("rectangle79");
    obj.rectangle79:setStrokeColor("#343434");
    obj.rectangle79:setStrokeSize(2);
    obj.rectangle79:setColor("#1f1e1e");
    obj.rectangle79.grid["padding-top"] = 5;
    obj.rectangle79.grid["padding-left"] = 8;
    obj.rectangle79.grid["padding-right"] = 8;
    obj.rectangle79.grid["padding-bottom"] = 5;

    obj.edit267 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.rectangle79);
    obj.edit267:setField("cam_CO");
    obj.edit267:setTransparent(true);
    obj.edit267:setHorzTextAlign("center");
    obj.edit267:setVertTextAlign("center");
    obj.edit267.grid.role = "col";
    obj.edit267.grid.width = 12;
    obj.edit267:setFontSize(15);
    obj.edit267:setName("edit267");
    obj.edit267:setHeight(25);

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout175);
    obj.label108:setText("CO");
    obj.label108:setVertTextAlign("trailing");
    obj.label108:setHorzTextAlign("center");
    obj.label108.grid.role = "col";
    obj.label108.grid.width = 12;
    obj.label108:setFontSize(20);
    obj.label108:setTextTrimming("none");
    obj.label108:setWordWrap(true);
    obj.label108:setName("label108");
    obj.label108:setFontColor("#b5b5b5");
    obj.label108:setHeight(25);

    obj.layout176 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.layout174);
    obj.layout176.grid.role = "col";
    obj.layout176.grid.width = 4;
    obj.layout176.grid["auto-height"] = true;
    obj.layout176.grid["cnt-horz-align"] = "middle";
    obj.layout176.grid["min-width"] = 35;
    obj.layout176:setName("layout176");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout176);
    lfm_setPropAsString(obj.rectangle80, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle80.grid.role = "col";
    obj.rectangle80.grid.width = 12;
    obj.rectangle80.grid["auto-height"] = true;
    obj.rectangle80:setXradius(10);
    obj.rectangle80:setYradius(10);
    obj.rectangle80:setCornerType("bevel");
    obj.rectangle80.grid["min-height"] = 30;
    obj.rectangle80.grid["margin-bottom"] = 0;
    obj.rectangle80:setName("rectangle80");
    obj.rectangle80:setStrokeColor("#343434");
    obj.rectangle80:setStrokeSize(2);
    obj.rectangle80:setColor("#1f1e1e");
    obj.rectangle80.grid["padding-top"] = 5;
    obj.rectangle80.grid["padding-left"] = 8;
    obj.rectangle80.grid["padding-right"] = 8;
    obj.rectangle80.grid["padding-bottom"] = 5;

    obj.edit268 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.rectangle80);
    obj.edit268:setField("cam_EP");
    obj.edit268:setTransparent(true);
    obj.edit268:setHorzTextAlign("center");
    obj.edit268:setVertTextAlign("center");
    obj.edit268.grid.role = "col";
    obj.edit268.grid.width = 12;
    obj.edit268:setFontSize(15);
    obj.edit268:setName("edit268");
    obj.edit268:setHeight(25);

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout176);
    obj.label109:setText("EP");
    obj.label109:setVertTextAlign("trailing");
    obj.label109:setHorzTextAlign("center");
    obj.label109.grid.role = "col";
    obj.label109.grid.width = 12;
    obj.label109:setFontSize(20);
    obj.label109:setTextTrimming("none");
    obj.label109:setWordWrap(true);
    obj.label109:setName("label109");
    obj.label109:setFontColor("#b5b5b5");
    obj.label109:setHeight(25);

    obj.layout177 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout177:setParent(obj.layout174);
    obj.layout177.grid.role = "col";
    obj.layout177.grid.width = 4;
    obj.layout177.grid["auto-height"] = true;
    obj.layout177.grid["cnt-horz-align"] = "middle";
    obj.layout177.grid["min-width"] = 35;
    obj.layout177:setName("layout177");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout177);
    lfm_setPropAsString(obj.rectangle81, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle81.grid.role = "col";
    obj.rectangle81.grid.width = 12;
    obj.rectangle81.grid["auto-height"] = true;
    obj.rectangle81:setXradius(10);
    obj.rectangle81:setYradius(10);
    obj.rectangle81:setCornerType("bevel");
    obj.rectangle81.grid["min-height"] = 30;
    obj.rectangle81.grid["margin-bottom"] = 0;
    obj.rectangle81:setName("rectangle81");
    obj.rectangle81:setStrokeColor("#343434");
    obj.rectangle81:setStrokeSize(2);
    obj.rectangle81:setColor("#1f1e1e");
    obj.rectangle81.grid["padding-top"] = 5;
    obj.rectangle81.grid["padding-left"] = 8;
    obj.rectangle81.grid["padding-right"] = 8;
    obj.rectangle81.grid["padding-bottom"] = 5;

    obj.edit269 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.rectangle81);
    obj.edit269:setField("cam_VC");
    obj.edit269:setTransparent(true);
    obj.edit269:setHorzTextAlign("center");
    obj.edit269:setVertTextAlign("center");
    obj.edit269.grid.role = "col";
    obj.edit269.grid.width = 12;
    obj.edit269:setFontSize(15);
    obj.edit269:setName("edit269");
    obj.edit269:setHeight(25);

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout177);
    obj.label110:setText("VC");
    obj.label110:setVertTextAlign("trailing");
    obj.label110:setHorzTextAlign("center");
    obj.label110.grid.role = "col";
    obj.label110.grid.width = 12;
    obj.label110:setFontSize(20);
    obj.label110:setTextTrimming("none");
    obj.label110:setWordWrap(true);
    obj.label110:setName("label110");
    obj.label110:setFontColor("#b5b5b5");
    obj.label110:setHeight(25);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Habilidades");
    obj.tab3:setName("tab3");

    obj.Habilidades = GUI.fromHandle(_obj_newObject("form"));
    obj.Habilidades:setParent(obj.tab3);
    obj.Habilidades:setName("Habilidades");
    obj.Habilidades:setAlign("client");
    obj.Habilidades:setTheme("dark");
    obj.Habilidades.grid["padding-top"] = 8;
    obj.Habilidades.grid["cnt-line-spacing"] = 4;

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.Habilidades);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout178 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout178:setParent(obj.scrollBox4);
    obj.layout178.grid.role = "col";
    obj.layout178.grid.width = 8;
    obj.layout178.grid["horz-align"] = "center";
    obj.layout178.grid["cnt-gutter"] = 10;
    obj.layout178.grid["cnt-line-spacing"] = 10;
    obj.layout178.grid["min-height"] = 900;
    obj.layout178.grid["padding-top"] = 30;
    obj.layout178:setName("layout178");

    obj.layout179 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout179:setParent(obj.layout178);
    obj.layout179.grid.role = "col";
    obj.layout179.grid.width = 8;
    obj.layout179.grid["horz-align"] = "center";
    obj.layout179.grid["cnt-gutter"] = 10;
    obj.layout179.grid["cnt-line-spacing"] = 10;
    obj.layout179.grid["min-height"] = 800;
    obj.layout179:setName("layout179");

    obj.layout180 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout180:setParent(obj.layout179);
    obj.layout180.grid.role = "col";
    obj.layout180.grid.width = 6;
    obj.layout180.grid["min-height"] = 400;
    obj.layout180.grid["auto-height"] = true;
    obj.layout180:setName("layout180");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout180);
    obj.rectangle82.grid.role = "col";
    obj.rectangle82.grid.width = 12;
    obj.rectangle82.grid["min-height"] = 400;
    obj.rectangle82.grid["auto-height"] = true;
    obj.rectangle82:setName("rectangle82");
    lfm_setPropAsString(obj.rectangle82, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle82:setCornerType("round");
    obj.rectangle82:setXradius(15);
    obj.rectangle82:setYradius(15);
    obj.rectangle82:setStrokeColor("#343434");
    obj.rectangle82:setStrokeSize(2);
    obj.rectangle82:setColor("#1f1e1e");
    obj.rectangle82.grid["padding-top"] = 5;
    obj.rectangle82.grid["padding-left"] = 8;
    obj.rectangle82.grid["padding-right"] = 8;
    obj.rectangle82.grid["padding-bottom"] = 5;

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.rectangle82);
    obj.rectangle83:setColor("grey");
    obj.rectangle83:setXradius(0);
    obj.rectangle83:setYradius(0);
    obj.rectangle83.grid.role = "col";
    obj.rectangle83.grid.width = 12;
    obj.rectangle83.grid["cnt-vert-align"] = "center";
    obj.rectangle83.grid["max-height"] = 23;
    obj.rectangle83.grid["margin-bottom"] = 5;
    obj.rectangle83.grid["margin-top"] = -5;
    obj.rectangle83.grid["margin-left"] = -5;
    obj.rectangle83.grid["margin-right"] = -5;
    obj.rectangle83:setName("rectangle83");
    lfm_setPropAsString(obj.rectangle83, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle83:setCornerType("round");
    obj.rectangle83:setStrokeColor("#343434");
    obj.rectangle83:setStrokeSize(2);
    obj.rectangle83.grid["padding-top"] = 5;
    obj.rectangle83.grid["padding-left"] = 8;
    obj.rectangle83.grid["padding-right"] = 8;
    obj.rectangle83.grid["padding-bottom"] = 5;

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.rectangle83);
    obj.label111:setText("BENEFICIOS");
    obj.label111:setHorzTextAlign("leading");
    obj.label111:setFontSize(15);
    lfm_setPropAsString(obj.label111, "fontStyle", "bold");
    obj.label111.grid.role = "col";
    obj.label111:setFontColor("black");
    obj.label111.grid["dyn-width-txt"] = true;
    obj.label111:setName("label111");
    obj.label111:setHeight(25);

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.rectangle82);
    obj.label112.grid.role = "col";
    obj.label112.grid.width = 3;
    obj.label112:setText("BENEFICIO");
    obj.label112:setName("label112");
    obj.label112:setFontColor("#b5b5b5");
    obj.label112:setHeight(25);

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.rectangle82);
    obj.label113.grid.role = "col";
    obj.label113.grid.width = 7;
    obj.label113:setText("DESCRIÇÃO");
    obj.label113:setName("label113");
    obj.label113:setFontColor("#b5b5b5");
    obj.label113:setHeight(25);

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.rectangle82);
    obj.label114.grid.role = "col";
    obj.label114.grid.width = 2;
    obj.label114:setText("PAG");
    obj.label114:setName("label114");
    obj.label114:setFontColor("#b5b5b5");
    obj.label114:setHeight(25);

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.rectangle82);
    obj.scrollBox5.grid.role = "col";
    obj.scrollBox5.grid.width = 12;
    obj.scrollBox5.grid["min-height"] = 380;
    obj.scrollBox5:setName("scrollBox5");

    obj.layout181 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout181:setParent(obj.scrollBox5);
    obj.layout181.grid.role = "col";
    obj.layout181.grid.width = 12;
    obj.layout181.grid["auto-height"] = true;
    obj.layout181.grid["padding-bottom"] = 20;
    obj.layout181:setName("layout181");

    obj.edit270 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.layout181);
    obj.edit270:setTransparent(true);
    obj.edit270.grid.role = "col";
    obj.edit270.grid.width = 3;
    obj.edit270:setName("edit270");
    obj.edit270:setHeight(25);

    obj.edit271 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.layout181);
    obj.edit271:setTransparent(true);
    obj.edit271.grid.role = "col";
    obj.edit271.grid.width = 7;
    obj.edit271:setName("edit271");
    obj.edit271:setHeight(25);

    obj.edit272 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout181);
    obj.edit272:setTransparent(true);
    obj.edit272.grid.role = "col";
    obj.edit272.grid.width = 2;
    obj.edit272:setName("edit272");
    obj.edit272:setHeight(25);

    obj.horzLine73 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine73:setParent(obj.layout181);
    obj.horzLine73.grid.role = "col";
    obj.horzLine73.grid.width = 12;
    obj.horzLine73:setName("horzLine73");
    obj.horzLine73:setStrokeColor("grey");

    obj.edit273 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout181);
    obj.edit273:setTransparent(true);
    obj.edit273.grid.role = "col";
    obj.edit273.grid.width = 3;
    obj.edit273:setName("edit273");
    obj.edit273:setHeight(25);

    obj.edit274 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout181);
    obj.edit274:setTransparent(true);
    obj.edit274.grid.role = "col";
    obj.edit274.grid.width = 7;
    obj.edit274:setName("edit274");
    obj.edit274:setHeight(25);

    obj.edit275 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout181);
    obj.edit275:setTransparent(true);
    obj.edit275.grid.role = "col";
    obj.edit275.grid.width = 2;
    obj.edit275:setName("edit275");
    obj.edit275:setHeight(25);

    obj.horzLine74 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine74:setParent(obj.layout181);
    obj.horzLine74.grid.role = "col";
    obj.horzLine74.grid.width = 12;
    obj.horzLine74:setName("horzLine74");
    obj.horzLine74:setStrokeColor("grey");

    obj.edit276 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout181);
    obj.edit276:setTransparent(true);
    obj.edit276.grid.role = "col";
    obj.edit276.grid.width = 3;
    obj.edit276:setName("edit276");
    obj.edit276:setHeight(25);

    obj.edit277 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout181);
    obj.edit277:setTransparent(true);
    obj.edit277.grid.role = "col";
    obj.edit277.grid.width = 7;
    obj.edit277:setName("edit277");
    obj.edit277:setHeight(25);

    obj.edit278 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout181);
    obj.edit278:setTransparent(true);
    obj.edit278.grid.role = "col";
    obj.edit278.grid.width = 2;
    obj.edit278:setName("edit278");
    obj.edit278:setHeight(25);

    obj.horzLine75 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine75:setParent(obj.layout181);
    obj.horzLine75.grid.role = "col";
    obj.horzLine75.grid.width = 12;
    obj.horzLine75:setName("horzLine75");
    obj.horzLine75:setStrokeColor("grey");

    obj.edit279 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout181);
    obj.edit279:setTransparent(true);
    obj.edit279.grid.role = "col";
    obj.edit279.grid.width = 3;
    obj.edit279:setName("edit279");
    obj.edit279:setHeight(25);

    obj.edit280 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout181);
    obj.edit280:setTransparent(true);
    obj.edit280.grid.role = "col";
    obj.edit280.grid.width = 7;
    obj.edit280:setName("edit280");
    obj.edit280:setHeight(25);

    obj.edit281 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout181);
    obj.edit281:setTransparent(true);
    obj.edit281.grid.role = "col";
    obj.edit281.grid.width = 2;
    obj.edit281:setName("edit281");
    obj.edit281:setHeight(25);

    obj.horzLine76 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine76:setParent(obj.layout181);
    obj.horzLine76.grid.role = "col";
    obj.horzLine76.grid.width = 12;
    obj.horzLine76:setName("horzLine76");
    obj.horzLine76:setStrokeColor("grey");

    obj.edit282 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout181);
    obj.edit282:setTransparent(true);
    obj.edit282.grid.role = "col";
    obj.edit282.grid.width = 3;
    obj.edit282:setName("edit282");
    obj.edit282:setHeight(25);

    obj.edit283 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout181);
    obj.edit283:setTransparent(true);
    obj.edit283.grid.role = "col";
    obj.edit283.grid.width = 7;
    obj.edit283:setName("edit283");
    obj.edit283:setHeight(25);

    obj.edit284 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout181);
    obj.edit284:setTransparent(true);
    obj.edit284.grid.role = "col";
    obj.edit284.grid.width = 2;
    obj.edit284:setName("edit284");
    obj.edit284:setHeight(25);

    obj.horzLine77 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine77:setParent(obj.layout181);
    obj.horzLine77.grid.role = "col";
    obj.horzLine77.grid.width = 12;
    obj.horzLine77:setName("horzLine77");
    obj.horzLine77:setStrokeColor("grey");

    obj.edit285 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout181);
    obj.edit285:setTransparent(true);
    obj.edit285.grid.role = "col";
    obj.edit285.grid.width = 3;
    obj.edit285:setName("edit285");
    obj.edit285:setHeight(25);

    obj.edit286 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout181);
    obj.edit286:setTransparent(true);
    obj.edit286.grid.role = "col";
    obj.edit286.grid.width = 7;
    obj.edit286:setName("edit286");
    obj.edit286:setHeight(25);

    obj.edit287 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout181);
    obj.edit287:setTransparent(true);
    obj.edit287.grid.role = "col";
    obj.edit287.grid.width = 2;
    obj.edit287:setName("edit287");
    obj.edit287:setHeight(25);

    obj.horzLine78 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine78:setParent(obj.layout181);
    obj.horzLine78.grid.role = "col";
    obj.horzLine78.grid.width = 12;
    obj.horzLine78:setName("horzLine78");
    obj.horzLine78:setStrokeColor("grey");

    obj.edit288 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout181);
    obj.edit288:setTransparent(true);
    obj.edit288.grid.role = "col";
    obj.edit288.grid.width = 3;
    obj.edit288:setName("edit288");
    obj.edit288:setHeight(25);

    obj.edit289 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout181);
    obj.edit289:setTransparent(true);
    obj.edit289.grid.role = "col";
    obj.edit289.grid.width = 7;
    obj.edit289:setName("edit289");
    obj.edit289:setHeight(25);

    obj.edit290 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout181);
    obj.edit290:setTransparent(true);
    obj.edit290.grid.role = "col";
    obj.edit290.grid.width = 2;
    obj.edit290:setName("edit290");
    obj.edit290:setHeight(25);

    obj.horzLine79 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine79:setParent(obj.layout181);
    obj.horzLine79.grid.role = "col";
    obj.horzLine79.grid.width = 12;
    obj.horzLine79:setName("horzLine79");
    obj.horzLine79:setStrokeColor("grey");

    obj.edit291 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.layout181);
    obj.edit291:setTransparent(true);
    obj.edit291.grid.role = "col";
    obj.edit291.grid.width = 3;
    obj.edit291:setName("edit291");
    obj.edit291:setHeight(25);

    obj.edit292 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.layout181);
    obj.edit292:setTransparent(true);
    obj.edit292.grid.role = "col";
    obj.edit292.grid.width = 7;
    obj.edit292:setName("edit292");
    obj.edit292:setHeight(25);

    obj.edit293 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit293:setParent(obj.layout181);
    obj.edit293:setTransparent(true);
    obj.edit293.grid.role = "col";
    obj.edit293.grid.width = 2;
    obj.edit293:setName("edit293");
    obj.edit293:setHeight(25);

    obj.horzLine80 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine80:setParent(obj.layout181);
    obj.horzLine80.grid.role = "col";
    obj.horzLine80.grid.width = 12;
    obj.horzLine80:setName("horzLine80");
    obj.horzLine80:setStrokeColor("grey");

    obj.edit294 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit294:setParent(obj.layout181);
    obj.edit294:setTransparent(true);
    obj.edit294.grid.role = "col";
    obj.edit294.grid.width = 3;
    obj.edit294:setName("edit294");
    obj.edit294:setHeight(25);

    obj.edit295 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit295:setParent(obj.layout181);
    obj.edit295:setTransparent(true);
    obj.edit295.grid.role = "col";
    obj.edit295.grid.width = 7;
    obj.edit295:setName("edit295");
    obj.edit295:setHeight(25);

    obj.edit296 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit296:setParent(obj.layout181);
    obj.edit296:setTransparent(true);
    obj.edit296.grid.role = "col";
    obj.edit296.grid.width = 2;
    obj.edit296:setName("edit296");
    obj.edit296:setHeight(25);

    obj.horzLine81 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine81:setParent(obj.layout181);
    obj.horzLine81.grid.role = "col";
    obj.horzLine81.grid.width = 12;
    obj.horzLine81:setName("horzLine81");
    obj.horzLine81:setStrokeColor("grey");

    obj.edit297 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit297:setParent(obj.layout181);
    obj.edit297:setTransparent(true);
    obj.edit297.grid.role = "col";
    obj.edit297.grid.width = 3;
    obj.edit297:setName("edit297");
    obj.edit297:setHeight(25);

    obj.edit298 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit298:setParent(obj.layout181);
    obj.edit298:setTransparent(true);
    obj.edit298.grid.role = "col";
    obj.edit298.grid.width = 7;
    obj.edit298:setName("edit298");
    obj.edit298:setHeight(25);

    obj.edit299 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit299:setParent(obj.layout181);
    obj.edit299:setTransparent(true);
    obj.edit299.grid.role = "col";
    obj.edit299.grid.width = 2;
    obj.edit299:setName("edit299");
    obj.edit299:setHeight(25);

    obj.horzLine82 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine82:setParent(obj.layout181);
    obj.horzLine82.grid.role = "col";
    obj.horzLine82.grid.width = 12;
    obj.horzLine82:setName("horzLine82");
    obj.horzLine82:setStrokeColor("grey");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout180);
    obj.rectangle84.grid.role = "col";
    obj.rectangle84.grid.width = 12;
    obj.rectangle84.grid["min-height"] = 400;
    obj.rectangle84.grid["auto-height"] = true;
    obj.rectangle84:setName("rectangle84");
    lfm_setPropAsString(obj.rectangle84, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle84:setCornerType("round");
    obj.rectangle84:setXradius(15);
    obj.rectangle84:setYradius(15);
    obj.rectangle84:setStrokeColor("#343434");
    obj.rectangle84:setStrokeSize(2);
    obj.rectangle84:setColor("#1f1e1e");
    obj.rectangle84.grid["padding-top"] = 5;
    obj.rectangle84.grid["padding-left"] = 8;
    obj.rectangle84.grid["padding-right"] = 8;
    obj.rectangle84.grid["padding-bottom"] = 5;

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.rectangle84);
    obj.rectangle85:setColor("grey");
    obj.rectangle85:setXradius(0);
    obj.rectangle85:setYradius(0);
    obj.rectangle85.grid.role = "col";
    obj.rectangle85.grid.width = 12;
    obj.rectangle85.grid["cnt-vert-align"] = "center";
    obj.rectangle85.grid["max-height"] = 23;
    obj.rectangle85.grid["margin-bottom"] = 5;
    obj.rectangle85.grid["margin-top"] = -5;
    obj.rectangle85.grid["margin-left"] = -5;
    obj.rectangle85.grid["margin-right"] = -5;
    obj.rectangle85:setName("rectangle85");
    lfm_setPropAsString(obj.rectangle85, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle85:setCornerType("round");
    obj.rectangle85:setStrokeColor("#343434");
    obj.rectangle85:setStrokeSize(2);
    obj.rectangle85.grid["padding-top"] = 5;
    obj.rectangle85.grid["padding-left"] = 8;
    obj.rectangle85.grid["padding-right"] = 8;
    obj.rectangle85.grid["padding-bottom"] = 5;

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.rectangle85);
    obj.label115:setText("CONEXÕES");
    obj.label115:setHorzTextAlign("leading");
    obj.label115:setFontSize(15);
    lfm_setPropAsString(obj.label115, "fontStyle", "bold");
    obj.label115.grid.role = "col";
    obj.label115:setFontColor("black");
    obj.label115.grid["dyn-width-txt"] = true;
    obj.label115:setName("label115");
    obj.label115:setHeight(25);

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle84);
    obj.textEditor1.grid.role = "col";
    obj.textEditor1.grid.width = 12;
    obj.textEditor1.grid["min-height"] = 380;
    obj.textEditor1:setName("textEditor1");

    obj.layout182 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout182:setParent(obj.layout179);
    obj.layout182.grid.role = "col";
    obj.layout182.grid.width = 6;
    obj.layout182.grid["min-height"] = 400;
    obj.layout182.grid["auto-height"] = true;
    obj.layout182:setName("layout182");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout182);
    obj.rectangle86.grid.role = "col";
    obj.rectangle86.grid.width = 12;
    obj.rectangle86.grid["min-height"] = 400;
    obj.rectangle86.grid["auto-height"] = true;
    obj.rectangle86:setName("rectangle86");
    lfm_setPropAsString(obj.rectangle86, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle86:setCornerType("round");
    obj.rectangle86:setXradius(15);
    obj.rectangle86:setYradius(15);
    obj.rectangle86:setStrokeColor("#343434");
    obj.rectangle86:setStrokeSize(2);
    obj.rectangle86:setColor("#1f1e1e");
    obj.rectangle86.grid["padding-top"] = 5;
    obj.rectangle86.grid["padding-left"] = 8;
    obj.rectangle86.grid["padding-right"] = 8;
    obj.rectangle86.grid["padding-bottom"] = 5;

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.rectangle86);
    obj.rectangle87:setColor("grey");
    obj.rectangle87:setXradius(0);
    obj.rectangle87:setYradius(0);
    obj.rectangle87.grid.role = "col";
    obj.rectangle87.grid.width = 12;
    obj.rectangle87.grid["cnt-vert-align"] = "center";
    obj.rectangle87.grid["max-height"] = 23;
    obj.rectangle87.grid["margin-bottom"] = 5;
    obj.rectangle87.grid["margin-top"] = -5;
    obj.rectangle87.grid["margin-left"] = -5;
    obj.rectangle87.grid["margin-right"] = -5;
    obj.rectangle87:setName("rectangle87");
    lfm_setPropAsString(obj.rectangle87, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle87:setCornerType("round");
    obj.rectangle87:setStrokeColor("#343434");
    obj.rectangle87:setStrokeSize(2);
    obj.rectangle87.grid["padding-top"] = 5;
    obj.rectangle87.grid["padding-left"] = 8;
    obj.rectangle87.grid["padding-right"] = 8;
    obj.rectangle87.grid["padding-bottom"] = 5;

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.rectangle87);
    obj.label116:setText("HABILIDADES");
    obj.label116:setHorzTextAlign("leading");
    obj.label116:setFontSize(15);
    lfm_setPropAsString(obj.label116, "fontStyle", "bold");
    obj.label116.grid.role = "col";
    obj.label116:setFontColor("black");
    obj.label116.grid["dyn-width-txt"] = true;
    obj.label116:setName("label116");
    obj.label116:setHeight(25);

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.rectangle86);
    obj.label117.grid.role = "col";
    obj.label117.grid.width = 3;
    obj.label117:setText("HABILIDADE");
    obj.label117:setName("label117");
    obj.label117:setFontColor("#b5b5b5");
    obj.label117:setHeight(25);

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.rectangle86);
    obj.label118.grid.role = "col";
    obj.label118.grid.width = 7;
    obj.label118:setText("DESCRIÇÃO");
    obj.label118:setName("label118");
    obj.label118:setFontColor("#b5b5b5");
    obj.label118:setHeight(25);

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.rectangle86);
    obj.label119.grid.role = "col";
    obj.label119.grid.width = 2;
    obj.label119:setText("PAG");
    obj.label119:setName("label119");
    obj.label119:setFontColor("#b5b5b5");
    obj.label119:setHeight(25);

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.rectangle86);
    obj.scrollBox6.grid.role = "col";
    obj.scrollBox6.grid.width = 12;
    obj.scrollBox6.grid["min-height"] = 380;
    obj.scrollBox6:setName("scrollBox6");

    obj.layout183 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout183:setParent(obj.scrollBox6);
    obj.layout183.grid.role = "col";
    obj.layout183.grid.width = 12;
    obj.layout183.grid["auto-height"] = true;
    obj.layout183.grid["padding-bottom"] = 20;
    obj.layout183:setName("layout183");

    obj.edit300 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit300:setParent(obj.layout183);
    obj.edit300:setTransparent(true);
    obj.edit300.grid.role = "col";
    obj.edit300.grid.width = 3;
    obj.edit300:setName("edit300");
    obj.edit300:setHeight(25);

    obj.edit301 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit301:setParent(obj.layout183);
    obj.edit301:setTransparent(true);
    obj.edit301.grid.role = "col";
    obj.edit301.grid.width = 7;
    obj.edit301:setName("edit301");
    obj.edit301:setHeight(25);

    obj.edit302 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit302:setParent(obj.layout183);
    obj.edit302:setTransparent(true);
    obj.edit302.grid.role = "col";
    obj.edit302.grid.width = 2;
    obj.edit302:setName("edit302");
    obj.edit302:setHeight(25);

    obj.horzLine83 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine83:setParent(obj.layout183);
    obj.horzLine83.grid.role = "col";
    obj.horzLine83.grid.width = 12;
    obj.horzLine83:setName("horzLine83");
    obj.horzLine83:setStrokeColor("grey");

    obj.edit303 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit303:setParent(obj.layout183);
    obj.edit303:setTransparent(true);
    obj.edit303.grid.role = "col";
    obj.edit303.grid.width = 3;
    obj.edit303:setName("edit303");
    obj.edit303:setHeight(25);

    obj.edit304 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit304:setParent(obj.layout183);
    obj.edit304:setTransparent(true);
    obj.edit304.grid.role = "col";
    obj.edit304.grid.width = 7;
    obj.edit304:setName("edit304");
    obj.edit304:setHeight(25);

    obj.edit305 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit305:setParent(obj.layout183);
    obj.edit305:setTransparent(true);
    obj.edit305.grid.role = "col";
    obj.edit305.grid.width = 2;
    obj.edit305:setName("edit305");
    obj.edit305:setHeight(25);

    obj.horzLine84 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine84:setParent(obj.layout183);
    obj.horzLine84.grid.role = "col";
    obj.horzLine84.grid.width = 12;
    obj.horzLine84:setName("horzLine84");
    obj.horzLine84:setStrokeColor("grey");

    obj.edit306 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit306:setParent(obj.layout183);
    obj.edit306:setTransparent(true);
    obj.edit306.grid.role = "col";
    obj.edit306.grid.width = 3;
    obj.edit306:setName("edit306");
    obj.edit306:setHeight(25);

    obj.edit307 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit307:setParent(obj.layout183);
    obj.edit307:setTransparent(true);
    obj.edit307.grid.role = "col";
    obj.edit307.grid.width = 7;
    obj.edit307:setName("edit307");
    obj.edit307:setHeight(25);

    obj.edit308 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit308:setParent(obj.layout183);
    obj.edit308:setTransparent(true);
    obj.edit308.grid.role = "col";
    obj.edit308.grid.width = 2;
    obj.edit308:setName("edit308");
    obj.edit308:setHeight(25);

    obj.horzLine85 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine85:setParent(obj.layout183);
    obj.horzLine85.grid.role = "col";
    obj.horzLine85.grid.width = 12;
    obj.horzLine85:setName("horzLine85");
    obj.horzLine85:setStrokeColor("grey");

    obj.edit309 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit309:setParent(obj.layout183);
    obj.edit309:setTransparent(true);
    obj.edit309.grid.role = "col";
    obj.edit309.grid.width = 3;
    obj.edit309:setName("edit309");
    obj.edit309:setHeight(25);

    obj.edit310 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit310:setParent(obj.layout183);
    obj.edit310:setTransparent(true);
    obj.edit310.grid.role = "col";
    obj.edit310.grid.width = 7;
    obj.edit310:setName("edit310");
    obj.edit310:setHeight(25);

    obj.edit311 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit311:setParent(obj.layout183);
    obj.edit311:setTransparent(true);
    obj.edit311.grid.role = "col";
    obj.edit311.grid.width = 2;
    obj.edit311:setName("edit311");
    obj.edit311:setHeight(25);

    obj.horzLine86 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine86:setParent(obj.layout183);
    obj.horzLine86.grid.role = "col";
    obj.horzLine86.grid.width = 12;
    obj.horzLine86:setName("horzLine86");
    obj.horzLine86:setStrokeColor("grey");

    obj.edit312 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit312:setParent(obj.layout183);
    obj.edit312:setTransparent(true);
    obj.edit312.grid.role = "col";
    obj.edit312.grid.width = 3;
    obj.edit312:setName("edit312");
    obj.edit312:setHeight(25);

    obj.edit313 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit313:setParent(obj.layout183);
    obj.edit313:setTransparent(true);
    obj.edit313.grid.role = "col";
    obj.edit313.grid.width = 7;
    obj.edit313:setName("edit313");
    obj.edit313:setHeight(25);

    obj.edit314 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit314:setParent(obj.layout183);
    obj.edit314:setTransparent(true);
    obj.edit314.grid.role = "col";
    obj.edit314.grid.width = 2;
    obj.edit314:setName("edit314");
    obj.edit314:setHeight(25);

    obj.horzLine87 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine87:setParent(obj.layout183);
    obj.horzLine87.grid.role = "col";
    obj.horzLine87.grid.width = 12;
    obj.horzLine87:setName("horzLine87");
    obj.horzLine87:setStrokeColor("grey");

    obj.edit315 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit315:setParent(obj.layout183);
    obj.edit315:setTransparent(true);
    obj.edit315.grid.role = "col";
    obj.edit315.grid.width = 3;
    obj.edit315:setName("edit315");
    obj.edit315:setHeight(25);

    obj.edit316 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit316:setParent(obj.layout183);
    obj.edit316:setTransparent(true);
    obj.edit316.grid.role = "col";
    obj.edit316.grid.width = 7;
    obj.edit316:setName("edit316");
    obj.edit316:setHeight(25);

    obj.edit317 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit317:setParent(obj.layout183);
    obj.edit317:setTransparent(true);
    obj.edit317.grid.role = "col";
    obj.edit317.grid.width = 2;
    obj.edit317:setName("edit317");
    obj.edit317:setHeight(25);

    obj.horzLine88 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine88:setParent(obj.layout183);
    obj.horzLine88.grid.role = "col";
    obj.horzLine88.grid.width = 12;
    obj.horzLine88:setName("horzLine88");
    obj.horzLine88:setStrokeColor("grey");

    obj.edit318 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit318:setParent(obj.layout183);
    obj.edit318:setTransparent(true);
    obj.edit318.grid.role = "col";
    obj.edit318.grid.width = 3;
    obj.edit318:setName("edit318");
    obj.edit318:setHeight(25);

    obj.edit319 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit319:setParent(obj.layout183);
    obj.edit319:setTransparent(true);
    obj.edit319.grid.role = "col";
    obj.edit319.grid.width = 7;
    obj.edit319:setName("edit319");
    obj.edit319:setHeight(25);

    obj.edit320 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit320:setParent(obj.layout183);
    obj.edit320:setTransparent(true);
    obj.edit320.grid.role = "col";
    obj.edit320.grid.width = 2;
    obj.edit320:setName("edit320");
    obj.edit320:setHeight(25);

    obj.horzLine89 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine89:setParent(obj.layout183);
    obj.horzLine89.grid.role = "col";
    obj.horzLine89.grid.width = 12;
    obj.horzLine89:setName("horzLine89");
    obj.horzLine89:setStrokeColor("grey");

    obj.edit321 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit321:setParent(obj.layout183);
    obj.edit321:setTransparent(true);
    obj.edit321.grid.role = "col";
    obj.edit321.grid.width = 3;
    obj.edit321:setName("edit321");
    obj.edit321:setHeight(25);

    obj.edit322 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit322:setParent(obj.layout183);
    obj.edit322:setTransparent(true);
    obj.edit322.grid.role = "col";
    obj.edit322.grid.width = 7;
    obj.edit322:setName("edit322");
    obj.edit322:setHeight(25);

    obj.edit323 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit323:setParent(obj.layout183);
    obj.edit323:setTransparent(true);
    obj.edit323.grid.role = "col";
    obj.edit323.grid.width = 2;
    obj.edit323:setName("edit323");
    obj.edit323:setHeight(25);

    obj.horzLine90 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine90:setParent(obj.layout183);
    obj.horzLine90.grid.role = "col";
    obj.horzLine90.grid.width = 12;
    obj.horzLine90:setName("horzLine90");
    obj.horzLine90:setStrokeColor("grey");

    obj.edit324 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit324:setParent(obj.layout183);
    obj.edit324:setTransparent(true);
    obj.edit324.grid.role = "col";
    obj.edit324.grid.width = 3;
    obj.edit324:setName("edit324");
    obj.edit324:setHeight(25);

    obj.edit325 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit325:setParent(obj.layout183);
    obj.edit325:setTransparent(true);
    obj.edit325.grid.role = "col";
    obj.edit325.grid.width = 7;
    obj.edit325:setName("edit325");
    obj.edit325:setHeight(25);

    obj.edit326 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit326:setParent(obj.layout183);
    obj.edit326:setTransparent(true);
    obj.edit326.grid.role = "col";
    obj.edit326.grid.width = 2;
    obj.edit326:setName("edit326");
    obj.edit326:setHeight(25);

    obj.horzLine91 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine91:setParent(obj.layout183);
    obj.horzLine91.grid.role = "col";
    obj.horzLine91.grid.width = 12;
    obj.horzLine91:setName("horzLine91");
    obj.horzLine91:setStrokeColor("grey");

    obj.edit327 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit327:setParent(obj.layout183);
    obj.edit327:setTransparent(true);
    obj.edit327.grid.role = "col";
    obj.edit327.grid.width = 3;
    obj.edit327:setName("edit327");
    obj.edit327:setHeight(25);

    obj.edit328 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit328:setParent(obj.layout183);
    obj.edit328:setTransparent(true);
    obj.edit328.grid.role = "col";
    obj.edit328.grid.width = 7;
    obj.edit328:setName("edit328");
    obj.edit328:setHeight(25);

    obj.edit329 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit329:setParent(obj.layout183);
    obj.edit329:setTransparent(true);
    obj.edit329.grid.role = "col";
    obj.edit329.grid.width = 2;
    obj.edit329:setName("edit329");
    obj.edit329:setHeight(25);

    obj.horzLine92 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine92:setParent(obj.layout183);
    obj.horzLine92.grid.role = "col";
    obj.horzLine92.grid.width = 12;
    obj.horzLine92:setName("horzLine92");
    obj.horzLine92:setStrokeColor("grey");

    obj.layout184 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout184:setParent(obj.layout178);
    obj.layout184.grid.role = "col";
    obj.layout184.grid.width = 4;
    obj.layout184.grid["horz-align"] = "center";
    obj.layout184.grid["cnt-gutter"] = 10;
    obj.layout184.grid["cnt-line-spacing"] = 10;
    obj.layout184.grid["min-height"] = 800;
    obj.layout184:setName("layout184");

    obj.layout185 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout185:setParent(obj.layout184);
    obj.layout185.grid.role = "col";
    obj.layout185.grid.width = 12;
    obj.layout185.grid["min-height"] = 400;
    obj.layout185.grid["auto-height"] = true;
    obj.layout185:setName("layout185");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout185);
    obj.rectangle88.grid.role = "col";
    obj.rectangle88.grid.width = 12;
    obj.rectangle88.grid["min-height"] = 800;
    obj.rectangle88.grid["auto-height"] = true;
    obj.rectangle88:setName("rectangle88");
    lfm_setPropAsString(obj.rectangle88, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle88:setCornerType("round");
    obj.rectangle88:setXradius(15);
    obj.rectangle88:setYradius(15);
    obj.rectangle88:setStrokeColor("#343434");
    obj.rectangle88:setStrokeSize(2);
    obj.rectangle88:setColor("#1f1e1e");
    obj.rectangle88.grid["padding-top"] = 5;
    obj.rectangle88.grid["padding-left"] = 8;
    obj.rectangle88.grid["padding-right"] = 8;
    obj.rectangle88.grid["padding-bottom"] = 5;

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.rectangle88);
    obj.rectangle89:setColor("grey");
    obj.rectangle89:setXradius(0);
    obj.rectangle89:setYradius(0);
    obj.rectangle89.grid.role = "col";
    obj.rectangle89.grid.width = 12;
    obj.rectangle89.grid["cnt-vert-align"] = "center";
    obj.rectangle89.grid["max-height"] = 23;
    obj.rectangle89.grid["margin-bottom"] = 5;
    obj.rectangle89.grid["margin-top"] = -5;
    obj.rectangle89.grid["margin-left"] = -5;
    obj.rectangle89.grid["margin-right"] = -5;
    obj.rectangle89:setName("rectangle89");
    lfm_setPropAsString(obj.rectangle89, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle89:setCornerType("round");
    obj.rectangle89:setStrokeColor("#343434");
    obj.rectangle89:setStrokeSize(2);
    obj.rectangle89.grid["padding-top"] = 5;
    obj.rectangle89.grid["padding-left"] = 8;
    obj.rectangle89.grid["padding-right"] = 8;
    obj.rectangle89.grid["padding-bottom"] = 5;

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.rectangle89);
    obj.label120:setText("PERÍCIAS");
    obj.label120:setHorzTextAlign("leading");
    obj.label120:setFontSize(15);
    lfm_setPropAsString(obj.label120, "fontStyle", "bold");
    obj.label120.grid.role = "col";
    obj.label120:setFontColor("black");
    obj.label120.grid["dyn-width-txt"] = true;
    obj.label120:setName("label120");
    obj.label120:setHeight(25);

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.rectangle88);
    obj.label121:setHorzTextAlign("leading");
    obj.label121:setText("Pericia");
    obj.label121.grid.role = "col";
    obj.label121.grid.width = 4;
    obj.label121:setName("label121");
    obj.label121:setFontColor("#b5b5b5");
    obj.label121:setHeight(25);

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.rectangle88);
    obj.label122:setHorzTextAlign("leading");
    obj.label122:setText("Chave");
    obj.label122.grid.role = "col";
    obj.label122.grid.width = 2;
    obj.label122:setName("label122");
    obj.label122:setFontColor("#b5b5b5");
    obj.label122:setHeight(25);

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.rectangle88);
    obj.label123:setHorzTextAlign("leading");
    obj.label123:setText("ATR");
    obj.label123.grid.role = "col";
    obj.label123.grid.width = 2;
    obj.label123:setName("label123");
    obj.label123:setFontColor("#b5b5b5");
    obj.label123:setHeight(25);

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.rectangle88);
    obj.label124:setHorzTextAlign("leading");
    obj.label124:setText("NIV");
    obj.label124.grid.role = "col";
    obj.label124.grid.width = 2;
    obj.label124:setName("label124");
    obj.label124:setFontColor("#b5b5b5");
    obj.label124:setHeight(25);

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.rectangle88);
    obj.label125:setHorzTextAlign("leading");
    obj.label125:setText("O");
    obj.label125.grid.role = "col";
    obj.label125.grid.width = 1;
    obj.label125:setName("label125");
    obj.label125:setFontColor("#b5b5b5");
    obj.label125:setHeight(25);

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.rectangle88);
    obj.label126:setHorzTextAlign("leading");
    obj.label126:setText("");
    obj.label126.grid.role = "col";
    obj.label126.grid.width = 1;
    obj.label126:setName("label126");
    obj.label126:setFontColor("#b5b5b5");
    obj.label126:setHeight(25);

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.rectangle88);
    obj.scrollBox7.grid.role = "col";
    obj.scrollBox7.grid.width = 12;
    obj.scrollBox7.grid["min-height"] = 680;
    obj.scrollBox7:setName("scrollBox7");

    obj.layout186 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout186:setParent(obj.scrollBox7);
    obj.layout186.grid.role = "row";
    obj.layout186.grid.width = 12;
    obj.layout186.grid["auto-height"] = true;
    obj.layout186:setName("layout186");

    obj.edit330 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit330:setParent(obj.layout186);
    obj.edit330:setTransparent(true);
    obj.edit330:setField("");
    obj.edit330.grid.role = "col";
    obj.edit330.grid.width = 4;
    obj.edit330:setHorzTextAlign("leading");
    obj.edit330:setName("edit330");
    obj.edit330:setHeight(25);

    obj.comboBox54 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox54:setParent(obj.layout186);
    obj.comboBox54:setTransparent(true);
    obj.comboBox54:setField("cha_");
    obj.comboBox54:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox54.grid.role = "col";
    obj.comboBox54.grid.width = 2;
    obj.comboBox54:setHorzTextAlign("center");
    obj.comboBox54:setName("comboBox54");
    obj.comboBox54:setHeight(25);

    obj.edit331 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit331:setParent(obj.layout186);
    obj.edit331:setTransparent(true);
    obj.edit331:setField("valAtr_");
    obj.edit331.grid.role = "col";
    obj.edit331.grid.width = 2;
    obj.edit331:setHorzTextAlign("center");
    obj.edit331:setName("edit331");
    obj.edit331:setHeight(25);

    obj.edit332 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit332:setParent(obj.layout186);
    obj.edit332:setTransparent(true);
    obj.edit332:setField("nivel_");
    obj.edit332.grid.role = "col";
    obj.edit332.grid.width = 2;
    obj.edit332:setHorzTextAlign("center");
    obj.edit332:setName("edit332");
    obj.edit332:setHeight(25);

    obj.edit333 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit333:setParent(obj.layout186);
    obj.edit333:setTransparent(true);
    obj.edit333:setField("outro_");
    obj.edit333.grid.role = "col";
    obj.edit333.grid.width = 1;
    obj.edit333:setHorzTextAlign("center");
    obj.edit333:setName("edit333");
    obj.edit333:setHeight(25);

    obj.button74 = GUI.fromHandle(_obj_newObject("button"));
    obj.button74:setParent(obj.layout186);
    obj.button74.grid.role = "col";
    obj.button74.grid.width = 1;
    obj.button74:setText("🎲");
    obj.button74:setName("button74");

    obj.horzLine93 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine93:setParent(obj.layout186);
    obj.horzLine93.grid.role = "row";
    obj.horzLine93:setName("horzLine93");
    obj.horzLine93:setStrokeColor("grey");

    obj.layout187 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout187:setParent(obj.scrollBox7);
    obj.layout187.grid.role = "row";
    obj.layout187.grid.width = 12;
    obj.layout187.grid["auto-height"] = true;
    obj.layout187:setName("layout187");

    obj.edit334 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit334:setParent(obj.layout187);
    obj.edit334:setTransparent(true);
    obj.edit334:setField("");
    obj.edit334.grid.role = "col";
    obj.edit334.grid.width = 4;
    obj.edit334:setHorzTextAlign("leading");
    obj.edit334:setName("edit334");
    obj.edit334:setHeight(25);

    obj.comboBox55 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox55:setParent(obj.layout187);
    obj.comboBox55:setTransparent(true);
    obj.comboBox55:setField("cha_");
    obj.comboBox55:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox55.grid.role = "col";
    obj.comboBox55.grid.width = 2;
    obj.comboBox55:setHorzTextAlign("center");
    obj.comboBox55:setName("comboBox55");
    obj.comboBox55:setHeight(25);

    obj.edit335 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit335:setParent(obj.layout187);
    obj.edit335:setTransparent(true);
    obj.edit335:setField("valAtr_");
    obj.edit335.grid.role = "col";
    obj.edit335.grid.width = 2;
    obj.edit335:setHorzTextAlign("center");
    obj.edit335:setName("edit335");
    obj.edit335:setHeight(25);

    obj.edit336 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit336:setParent(obj.layout187);
    obj.edit336:setTransparent(true);
    obj.edit336:setField("nivel_");
    obj.edit336.grid.role = "col";
    obj.edit336.grid.width = 2;
    obj.edit336:setHorzTextAlign("center");
    obj.edit336:setName("edit336");
    obj.edit336:setHeight(25);

    obj.edit337 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit337:setParent(obj.layout187);
    obj.edit337:setTransparent(true);
    obj.edit337:setField("outro_");
    obj.edit337.grid.role = "col";
    obj.edit337.grid.width = 1;
    obj.edit337:setHorzTextAlign("center");
    obj.edit337:setName("edit337");
    obj.edit337:setHeight(25);

    obj.button75 = GUI.fromHandle(_obj_newObject("button"));
    obj.button75:setParent(obj.layout187);
    obj.button75.grid.role = "col";
    obj.button75.grid.width = 1;
    obj.button75:setText("🎲");
    obj.button75:setName("button75");

    obj.horzLine94 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine94:setParent(obj.layout187);
    obj.horzLine94.grid.role = "row";
    obj.horzLine94:setName("horzLine94");
    obj.horzLine94:setStrokeColor("grey");

    obj.layout188 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout188:setParent(obj.scrollBox7);
    obj.layout188.grid.role = "row";
    obj.layout188.grid.width = 12;
    obj.layout188.grid["auto-height"] = true;
    obj.layout188:setName("layout188");

    obj.edit338 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit338:setParent(obj.layout188);
    obj.edit338:setTransparent(true);
    obj.edit338:setField("");
    obj.edit338.grid.role = "col";
    obj.edit338.grid.width = 4;
    obj.edit338:setHorzTextAlign("leading");
    obj.edit338:setName("edit338");
    obj.edit338:setHeight(25);

    obj.comboBox56 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox56:setParent(obj.layout188);
    obj.comboBox56:setTransparent(true);
    obj.comboBox56:setField("cha_");
    obj.comboBox56:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox56.grid.role = "col";
    obj.comboBox56.grid.width = 2;
    obj.comboBox56:setHorzTextAlign("center");
    obj.comboBox56:setName("comboBox56");
    obj.comboBox56:setHeight(25);

    obj.edit339 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit339:setParent(obj.layout188);
    obj.edit339:setTransparent(true);
    obj.edit339:setField("valAtr_");
    obj.edit339.grid.role = "col";
    obj.edit339.grid.width = 2;
    obj.edit339:setHorzTextAlign("center");
    obj.edit339:setName("edit339");
    obj.edit339:setHeight(25);

    obj.edit340 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit340:setParent(obj.layout188);
    obj.edit340:setTransparent(true);
    obj.edit340:setField("nivel_");
    obj.edit340.grid.role = "col";
    obj.edit340.grid.width = 2;
    obj.edit340:setHorzTextAlign("center");
    obj.edit340:setName("edit340");
    obj.edit340:setHeight(25);

    obj.edit341 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit341:setParent(obj.layout188);
    obj.edit341:setTransparent(true);
    obj.edit341:setField("outro_");
    obj.edit341.grid.role = "col";
    obj.edit341.grid.width = 1;
    obj.edit341:setHorzTextAlign("center");
    obj.edit341:setName("edit341");
    obj.edit341:setHeight(25);

    obj.button76 = GUI.fromHandle(_obj_newObject("button"));
    obj.button76:setParent(obj.layout188);
    obj.button76.grid.role = "col";
    obj.button76.grid.width = 1;
    obj.button76:setText("🎲");
    obj.button76:setName("button76");

    obj.horzLine95 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine95:setParent(obj.layout188);
    obj.horzLine95.grid.role = "row";
    obj.horzLine95:setName("horzLine95");
    obj.horzLine95:setStrokeColor("grey");

    obj.layout189 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout189:setParent(obj.scrollBox7);
    obj.layout189.grid.role = "row";
    obj.layout189.grid.width = 12;
    obj.layout189.grid["auto-height"] = true;
    obj.layout189:setName("layout189");

    obj.edit342 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit342:setParent(obj.layout189);
    obj.edit342:setTransparent(true);
    obj.edit342:setField("");
    obj.edit342.grid.role = "col";
    obj.edit342.grid.width = 4;
    obj.edit342:setHorzTextAlign("leading");
    obj.edit342:setName("edit342");
    obj.edit342:setHeight(25);

    obj.comboBox57 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox57:setParent(obj.layout189);
    obj.comboBox57:setTransparent(true);
    obj.comboBox57:setField("cha_");
    obj.comboBox57:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox57.grid.role = "col";
    obj.comboBox57.grid.width = 2;
    obj.comboBox57:setHorzTextAlign("center");
    obj.comboBox57:setName("comboBox57");
    obj.comboBox57:setHeight(25);

    obj.edit343 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit343:setParent(obj.layout189);
    obj.edit343:setTransparent(true);
    obj.edit343:setField("valAtr_");
    obj.edit343.grid.role = "col";
    obj.edit343.grid.width = 2;
    obj.edit343:setHorzTextAlign("center");
    obj.edit343:setName("edit343");
    obj.edit343:setHeight(25);

    obj.edit344 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit344:setParent(obj.layout189);
    obj.edit344:setTransparent(true);
    obj.edit344:setField("nivel_");
    obj.edit344.grid.role = "col";
    obj.edit344.grid.width = 2;
    obj.edit344:setHorzTextAlign("center");
    obj.edit344:setName("edit344");
    obj.edit344:setHeight(25);

    obj.edit345 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit345:setParent(obj.layout189);
    obj.edit345:setTransparent(true);
    obj.edit345:setField("outro_");
    obj.edit345.grid.role = "col";
    obj.edit345.grid.width = 1;
    obj.edit345:setHorzTextAlign("center");
    obj.edit345:setName("edit345");
    obj.edit345:setHeight(25);

    obj.button77 = GUI.fromHandle(_obj_newObject("button"));
    obj.button77:setParent(obj.layout189);
    obj.button77.grid.role = "col";
    obj.button77.grid.width = 1;
    obj.button77:setText("🎲");
    obj.button77:setName("button77");

    obj.horzLine96 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine96:setParent(obj.layout189);
    obj.horzLine96.grid.role = "row";
    obj.horzLine96:setName("horzLine96");
    obj.horzLine96:setStrokeColor("grey");

    obj.layout190 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout190:setParent(obj.scrollBox7);
    obj.layout190.grid.role = "row";
    obj.layout190.grid.width = 12;
    obj.layout190.grid["auto-height"] = true;
    obj.layout190:setName("layout190");

    obj.edit346 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit346:setParent(obj.layout190);
    obj.edit346:setTransparent(true);
    obj.edit346:setField("");
    obj.edit346.grid.role = "col";
    obj.edit346.grid.width = 4;
    obj.edit346:setHorzTextAlign("leading");
    obj.edit346:setName("edit346");
    obj.edit346:setHeight(25);

    obj.comboBox58 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox58:setParent(obj.layout190);
    obj.comboBox58:setTransparent(true);
    obj.comboBox58:setField("cha_");
    obj.comboBox58:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox58.grid.role = "col";
    obj.comboBox58.grid.width = 2;
    obj.comboBox58:setHorzTextAlign("center");
    obj.comboBox58:setName("comboBox58");
    obj.comboBox58:setHeight(25);

    obj.edit347 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit347:setParent(obj.layout190);
    obj.edit347:setTransparent(true);
    obj.edit347:setField("valAtr_");
    obj.edit347.grid.role = "col";
    obj.edit347.grid.width = 2;
    obj.edit347:setHorzTextAlign("center");
    obj.edit347:setName("edit347");
    obj.edit347:setHeight(25);

    obj.edit348 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit348:setParent(obj.layout190);
    obj.edit348:setTransparent(true);
    obj.edit348:setField("nivel_");
    obj.edit348.grid.role = "col";
    obj.edit348.grid.width = 2;
    obj.edit348:setHorzTextAlign("center");
    obj.edit348:setName("edit348");
    obj.edit348:setHeight(25);

    obj.edit349 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit349:setParent(obj.layout190);
    obj.edit349:setTransparent(true);
    obj.edit349:setField("outro_");
    obj.edit349.grid.role = "col";
    obj.edit349.grid.width = 1;
    obj.edit349:setHorzTextAlign("center");
    obj.edit349:setName("edit349");
    obj.edit349:setHeight(25);

    obj.button78 = GUI.fromHandle(_obj_newObject("button"));
    obj.button78:setParent(obj.layout190);
    obj.button78.grid.role = "col";
    obj.button78.grid.width = 1;
    obj.button78:setText("🎲");
    obj.button78:setName("button78");

    obj.horzLine97 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine97:setParent(obj.layout190);
    obj.horzLine97.grid.role = "row";
    obj.horzLine97:setName("horzLine97");
    obj.horzLine97:setStrokeColor("grey");

    obj.layout191 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout191:setParent(obj.scrollBox7);
    obj.layout191.grid.role = "row";
    obj.layout191.grid.width = 12;
    obj.layout191.grid["auto-height"] = true;
    obj.layout191:setName("layout191");

    obj.edit350 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit350:setParent(obj.layout191);
    obj.edit350:setTransparent(true);
    obj.edit350:setField("");
    obj.edit350.grid.role = "col";
    obj.edit350.grid.width = 4;
    obj.edit350:setHorzTextAlign("leading");
    obj.edit350:setName("edit350");
    obj.edit350:setHeight(25);

    obj.comboBox59 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox59:setParent(obj.layout191);
    obj.comboBox59:setTransparent(true);
    obj.comboBox59:setField("cha_");
    obj.comboBox59:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox59.grid.role = "col";
    obj.comboBox59.grid.width = 2;
    obj.comboBox59:setHorzTextAlign("center");
    obj.comboBox59:setName("comboBox59");
    obj.comboBox59:setHeight(25);

    obj.edit351 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit351:setParent(obj.layout191);
    obj.edit351:setTransparent(true);
    obj.edit351:setField("valAtr_");
    obj.edit351.grid.role = "col";
    obj.edit351.grid.width = 2;
    obj.edit351:setHorzTextAlign("center");
    obj.edit351:setName("edit351");
    obj.edit351:setHeight(25);

    obj.edit352 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit352:setParent(obj.layout191);
    obj.edit352:setTransparent(true);
    obj.edit352:setField("nivel_");
    obj.edit352.grid.role = "col";
    obj.edit352.grid.width = 2;
    obj.edit352:setHorzTextAlign("center");
    obj.edit352:setName("edit352");
    obj.edit352:setHeight(25);

    obj.edit353 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit353:setParent(obj.layout191);
    obj.edit353:setTransparent(true);
    obj.edit353:setField("outro_");
    obj.edit353.grid.role = "col";
    obj.edit353.grid.width = 1;
    obj.edit353:setHorzTextAlign("center");
    obj.edit353:setName("edit353");
    obj.edit353:setHeight(25);

    obj.button79 = GUI.fromHandle(_obj_newObject("button"));
    obj.button79:setParent(obj.layout191);
    obj.button79.grid.role = "col";
    obj.button79.grid.width = 1;
    obj.button79:setText("🎲");
    obj.button79:setName("button79");

    obj.horzLine98 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine98:setParent(obj.layout191);
    obj.horzLine98.grid.role = "row";
    obj.horzLine98:setName("horzLine98");
    obj.horzLine98:setStrokeColor("grey");

    obj.layout192 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout192:setParent(obj.scrollBox7);
    obj.layout192.grid.role = "row";
    obj.layout192.grid.width = 12;
    obj.layout192.grid["auto-height"] = true;
    obj.layout192:setName("layout192");

    obj.edit354 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit354:setParent(obj.layout192);
    obj.edit354:setTransparent(true);
    obj.edit354:setField("");
    obj.edit354.grid.role = "col";
    obj.edit354.grid.width = 4;
    obj.edit354:setHorzTextAlign("leading");
    obj.edit354:setName("edit354");
    obj.edit354:setHeight(25);

    obj.comboBox60 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox60:setParent(obj.layout192);
    obj.comboBox60:setTransparent(true);
    obj.comboBox60:setField("cha_");
    obj.comboBox60:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox60.grid.role = "col";
    obj.comboBox60.grid.width = 2;
    obj.comboBox60:setHorzTextAlign("center");
    obj.comboBox60:setName("comboBox60");
    obj.comboBox60:setHeight(25);

    obj.edit355 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit355:setParent(obj.layout192);
    obj.edit355:setTransparent(true);
    obj.edit355:setField("valAtr_");
    obj.edit355.grid.role = "col";
    obj.edit355.grid.width = 2;
    obj.edit355:setHorzTextAlign("center");
    obj.edit355:setName("edit355");
    obj.edit355:setHeight(25);

    obj.edit356 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit356:setParent(obj.layout192);
    obj.edit356:setTransparent(true);
    obj.edit356:setField("nivel_");
    obj.edit356.grid.role = "col";
    obj.edit356.grid.width = 2;
    obj.edit356:setHorzTextAlign("center");
    obj.edit356:setName("edit356");
    obj.edit356:setHeight(25);

    obj.edit357 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit357:setParent(obj.layout192);
    obj.edit357:setTransparent(true);
    obj.edit357:setField("outro_");
    obj.edit357.grid.role = "col";
    obj.edit357.grid.width = 1;
    obj.edit357:setHorzTextAlign("center");
    obj.edit357:setName("edit357");
    obj.edit357:setHeight(25);

    obj.button80 = GUI.fromHandle(_obj_newObject("button"));
    obj.button80:setParent(obj.layout192);
    obj.button80.grid.role = "col";
    obj.button80.grid.width = 1;
    obj.button80:setText("🎲");
    obj.button80:setName("button80");

    obj.horzLine99 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine99:setParent(obj.layout192);
    obj.horzLine99.grid.role = "row";
    obj.horzLine99:setName("horzLine99");
    obj.horzLine99:setStrokeColor("grey");

    obj.layout193 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout193:setParent(obj.scrollBox7);
    obj.layout193.grid.role = "row";
    obj.layout193.grid.width = 12;
    obj.layout193.grid["auto-height"] = true;
    obj.layout193:setName("layout193");

    obj.edit358 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit358:setParent(obj.layout193);
    obj.edit358:setTransparent(true);
    obj.edit358:setField("");
    obj.edit358.grid.role = "col";
    obj.edit358.grid.width = 4;
    obj.edit358:setHorzTextAlign("leading");
    obj.edit358:setName("edit358");
    obj.edit358:setHeight(25);

    obj.comboBox61 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox61:setParent(obj.layout193);
    obj.comboBox61:setTransparent(true);
    obj.comboBox61:setField("cha_");
    obj.comboBox61:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox61.grid.role = "col";
    obj.comboBox61.grid.width = 2;
    obj.comboBox61:setHorzTextAlign("center");
    obj.comboBox61:setName("comboBox61");
    obj.comboBox61:setHeight(25);

    obj.edit359 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit359:setParent(obj.layout193);
    obj.edit359:setTransparent(true);
    obj.edit359:setField("valAtr_");
    obj.edit359.grid.role = "col";
    obj.edit359.grid.width = 2;
    obj.edit359:setHorzTextAlign("center");
    obj.edit359:setName("edit359");
    obj.edit359:setHeight(25);

    obj.edit360 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit360:setParent(obj.layout193);
    obj.edit360:setTransparent(true);
    obj.edit360:setField("nivel_");
    obj.edit360.grid.role = "col";
    obj.edit360.grid.width = 2;
    obj.edit360:setHorzTextAlign("center");
    obj.edit360:setName("edit360");
    obj.edit360:setHeight(25);

    obj.edit361 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit361:setParent(obj.layout193);
    obj.edit361:setTransparent(true);
    obj.edit361:setField("outro_");
    obj.edit361.grid.role = "col";
    obj.edit361.grid.width = 1;
    obj.edit361:setHorzTextAlign("center");
    obj.edit361:setName("edit361");
    obj.edit361:setHeight(25);

    obj.button81 = GUI.fromHandle(_obj_newObject("button"));
    obj.button81:setParent(obj.layout193);
    obj.button81.grid.role = "col";
    obj.button81.grid.width = 1;
    obj.button81:setText("🎲");
    obj.button81:setName("button81");

    obj.horzLine100 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine100:setParent(obj.layout193);
    obj.horzLine100.grid.role = "row";
    obj.horzLine100:setName("horzLine100");
    obj.horzLine100:setStrokeColor("grey");

    obj.layout194 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout194:setParent(obj.scrollBox7);
    obj.layout194.grid.role = "row";
    obj.layout194.grid.width = 12;
    obj.layout194.grid["auto-height"] = true;
    obj.layout194:setName("layout194");

    obj.edit362 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit362:setParent(obj.layout194);
    obj.edit362:setTransparent(true);
    obj.edit362:setField("");
    obj.edit362.grid.role = "col";
    obj.edit362.grid.width = 4;
    obj.edit362:setHorzTextAlign("leading");
    obj.edit362:setName("edit362");
    obj.edit362:setHeight(25);

    obj.comboBox62 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox62:setParent(obj.layout194);
    obj.comboBox62:setTransparent(true);
    obj.comboBox62:setField("cha_");
    obj.comboBox62:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox62.grid.role = "col";
    obj.comboBox62.grid.width = 2;
    obj.comboBox62:setHorzTextAlign("center");
    obj.comboBox62:setName("comboBox62");
    obj.comboBox62:setHeight(25);

    obj.edit363 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit363:setParent(obj.layout194);
    obj.edit363:setTransparent(true);
    obj.edit363:setField("valAtr_");
    obj.edit363.grid.role = "col";
    obj.edit363.grid.width = 2;
    obj.edit363:setHorzTextAlign("center");
    obj.edit363:setName("edit363");
    obj.edit363:setHeight(25);

    obj.edit364 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit364:setParent(obj.layout194);
    obj.edit364:setTransparent(true);
    obj.edit364:setField("nivel_");
    obj.edit364.grid.role = "col";
    obj.edit364.grid.width = 2;
    obj.edit364:setHorzTextAlign("center");
    obj.edit364:setName("edit364");
    obj.edit364:setHeight(25);

    obj.edit365 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit365:setParent(obj.layout194);
    obj.edit365:setTransparent(true);
    obj.edit365:setField("outro_");
    obj.edit365.grid.role = "col";
    obj.edit365.grid.width = 1;
    obj.edit365:setHorzTextAlign("center");
    obj.edit365:setName("edit365");
    obj.edit365:setHeight(25);

    obj.button82 = GUI.fromHandle(_obj_newObject("button"));
    obj.button82:setParent(obj.layout194);
    obj.button82.grid.role = "col";
    obj.button82.grid.width = 1;
    obj.button82:setText("🎲");
    obj.button82:setName("button82");

    obj.horzLine101 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine101:setParent(obj.layout194);
    obj.horzLine101.grid.role = "row";
    obj.horzLine101:setName("horzLine101");
    obj.horzLine101:setStrokeColor("grey");

    obj.layout195 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout195:setParent(obj.scrollBox7);
    obj.layout195.grid.role = "row";
    obj.layout195.grid.width = 12;
    obj.layout195.grid["auto-height"] = true;
    obj.layout195:setName("layout195");

    obj.edit366 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit366:setParent(obj.layout195);
    obj.edit366:setTransparent(true);
    obj.edit366:setField("");
    obj.edit366.grid.role = "col";
    obj.edit366.grid.width = 4;
    obj.edit366:setHorzTextAlign("leading");
    obj.edit366:setName("edit366");
    obj.edit366:setHeight(25);

    obj.comboBox63 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox63:setParent(obj.layout195);
    obj.comboBox63:setTransparent(true);
    obj.comboBox63:setField("cha_");
    obj.comboBox63:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox63.grid.role = "col";
    obj.comboBox63.grid.width = 2;
    obj.comboBox63:setHorzTextAlign("center");
    obj.comboBox63:setName("comboBox63");
    obj.comboBox63:setHeight(25);

    obj.edit367 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit367:setParent(obj.layout195);
    obj.edit367:setTransparent(true);
    obj.edit367:setField("valAtr_");
    obj.edit367.grid.role = "col";
    obj.edit367.grid.width = 2;
    obj.edit367:setHorzTextAlign("center");
    obj.edit367:setName("edit367");
    obj.edit367:setHeight(25);

    obj.edit368 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit368:setParent(obj.layout195);
    obj.edit368:setTransparent(true);
    obj.edit368:setField("nivel_");
    obj.edit368.grid.role = "col";
    obj.edit368.grid.width = 2;
    obj.edit368:setHorzTextAlign("center");
    obj.edit368:setName("edit368");
    obj.edit368:setHeight(25);

    obj.edit369 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit369:setParent(obj.layout195);
    obj.edit369:setTransparent(true);
    obj.edit369:setField("outro_");
    obj.edit369.grid.role = "col";
    obj.edit369.grid.width = 1;
    obj.edit369:setHorzTextAlign("center");
    obj.edit369:setName("edit369");
    obj.edit369:setHeight(25);

    obj.button83 = GUI.fromHandle(_obj_newObject("button"));
    obj.button83:setParent(obj.layout195);
    obj.button83.grid.role = "col";
    obj.button83.grid.width = 1;
    obj.button83:setText("🎲");
    obj.button83:setName("button83");

    obj.horzLine102 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine102:setParent(obj.layout195);
    obj.horzLine102.grid.role = "row";
    obj.horzLine102:setName("horzLine102");
    obj.horzLine102:setStrokeColor("grey");

    obj.layout196 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout196:setParent(obj.scrollBox7);
    obj.layout196.grid.role = "row";
    obj.layout196.grid.width = 12;
    obj.layout196.grid["auto-height"] = true;
    obj.layout196:setName("layout196");

    obj.edit370 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit370:setParent(obj.layout196);
    obj.edit370:setTransparent(true);
    obj.edit370:setField("");
    obj.edit370.grid.role = "col";
    obj.edit370.grid.width = 4;
    obj.edit370:setHorzTextAlign("leading");
    obj.edit370:setName("edit370");
    obj.edit370:setHeight(25);

    obj.comboBox64 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox64:setParent(obj.layout196);
    obj.comboBox64:setTransparent(true);
    obj.comboBox64:setField("cha_");
    obj.comboBox64:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox64.grid.role = "col";
    obj.comboBox64.grid.width = 2;
    obj.comboBox64:setHorzTextAlign("center");
    obj.comboBox64:setName("comboBox64");
    obj.comboBox64:setHeight(25);

    obj.edit371 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit371:setParent(obj.layout196);
    obj.edit371:setTransparent(true);
    obj.edit371:setField("valAtr_");
    obj.edit371.grid.role = "col";
    obj.edit371.grid.width = 2;
    obj.edit371:setHorzTextAlign("center");
    obj.edit371:setName("edit371");
    obj.edit371:setHeight(25);

    obj.edit372 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit372:setParent(obj.layout196);
    obj.edit372:setTransparent(true);
    obj.edit372:setField("nivel_");
    obj.edit372.grid.role = "col";
    obj.edit372.grid.width = 2;
    obj.edit372:setHorzTextAlign("center");
    obj.edit372:setName("edit372");
    obj.edit372:setHeight(25);

    obj.edit373 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit373:setParent(obj.layout196);
    obj.edit373:setTransparent(true);
    obj.edit373:setField("outro_");
    obj.edit373.grid.role = "col";
    obj.edit373.grid.width = 1;
    obj.edit373:setHorzTextAlign("center");
    obj.edit373:setName("edit373");
    obj.edit373:setHeight(25);

    obj.button84 = GUI.fromHandle(_obj_newObject("button"));
    obj.button84:setParent(obj.layout196);
    obj.button84.grid.role = "col";
    obj.button84.grid.width = 1;
    obj.button84:setText("🎲");
    obj.button84:setName("button84");

    obj.horzLine103 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine103:setParent(obj.layout196);
    obj.horzLine103.grid.role = "row";
    obj.horzLine103:setName("horzLine103");
    obj.horzLine103:setStrokeColor("grey");

    obj.layout197 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout197:setParent(obj.scrollBox7);
    obj.layout197.grid.role = "row";
    obj.layout197.grid.width = 12;
    obj.layout197.grid["auto-height"] = true;
    obj.layout197:setName("layout197");

    obj.edit374 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit374:setParent(obj.layout197);
    obj.edit374:setTransparent(true);
    obj.edit374:setField("");
    obj.edit374.grid.role = "col";
    obj.edit374.grid.width = 4;
    obj.edit374:setHorzTextAlign("leading");
    obj.edit374:setName("edit374");
    obj.edit374:setHeight(25);

    obj.comboBox65 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox65:setParent(obj.layout197);
    obj.comboBox65:setTransparent(true);
    obj.comboBox65:setField("cha_");
    obj.comboBox65:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox65.grid.role = "col";
    obj.comboBox65.grid.width = 2;
    obj.comboBox65:setHorzTextAlign("center");
    obj.comboBox65:setName("comboBox65");
    obj.comboBox65:setHeight(25);

    obj.edit375 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit375:setParent(obj.layout197);
    obj.edit375:setTransparent(true);
    obj.edit375:setField("valAtr_");
    obj.edit375.grid.role = "col";
    obj.edit375.grid.width = 2;
    obj.edit375:setHorzTextAlign("center");
    obj.edit375:setName("edit375");
    obj.edit375:setHeight(25);

    obj.edit376 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit376:setParent(obj.layout197);
    obj.edit376:setTransparent(true);
    obj.edit376:setField("nivel_");
    obj.edit376.grid.role = "col";
    obj.edit376.grid.width = 2;
    obj.edit376:setHorzTextAlign("center");
    obj.edit376:setName("edit376");
    obj.edit376:setHeight(25);

    obj.edit377 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit377:setParent(obj.layout197);
    obj.edit377:setTransparent(true);
    obj.edit377:setField("outro_");
    obj.edit377.grid.role = "col";
    obj.edit377.grid.width = 1;
    obj.edit377:setHorzTextAlign("center");
    obj.edit377:setName("edit377");
    obj.edit377:setHeight(25);

    obj.button85 = GUI.fromHandle(_obj_newObject("button"));
    obj.button85:setParent(obj.layout197);
    obj.button85.grid.role = "col";
    obj.button85.grid.width = 1;
    obj.button85:setText("🎲");
    obj.button85:setName("button85");

    obj.horzLine104 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine104:setParent(obj.layout197);
    obj.horzLine104.grid.role = "row";
    obj.horzLine104:setName("horzLine104");
    obj.horzLine104:setStrokeColor("grey");

    obj.layout198 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout198:setParent(obj.scrollBox7);
    obj.layout198.grid.role = "row";
    obj.layout198.grid.width = 12;
    obj.layout198.grid["auto-height"] = true;
    obj.layout198:setName("layout198");

    obj.edit378 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit378:setParent(obj.layout198);
    obj.edit378:setTransparent(true);
    obj.edit378:setField("");
    obj.edit378.grid.role = "col";
    obj.edit378.grid.width = 4;
    obj.edit378:setHorzTextAlign("leading");
    obj.edit378:setName("edit378");
    obj.edit378:setHeight(25);

    obj.comboBox66 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox66:setParent(obj.layout198);
    obj.comboBox66:setTransparent(true);
    obj.comboBox66:setField("cha_");
    obj.comboBox66:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox66.grid.role = "col";
    obj.comboBox66.grid.width = 2;
    obj.comboBox66:setHorzTextAlign("center");
    obj.comboBox66:setName("comboBox66");
    obj.comboBox66:setHeight(25);

    obj.edit379 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit379:setParent(obj.layout198);
    obj.edit379:setTransparent(true);
    obj.edit379:setField("valAtr_");
    obj.edit379.grid.role = "col";
    obj.edit379.grid.width = 2;
    obj.edit379:setHorzTextAlign("center");
    obj.edit379:setName("edit379");
    obj.edit379:setHeight(25);

    obj.edit380 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit380:setParent(obj.layout198);
    obj.edit380:setTransparent(true);
    obj.edit380:setField("nivel_");
    obj.edit380.grid.role = "col";
    obj.edit380.grid.width = 2;
    obj.edit380:setHorzTextAlign("center");
    obj.edit380:setName("edit380");
    obj.edit380:setHeight(25);

    obj.edit381 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit381:setParent(obj.layout198);
    obj.edit381:setTransparent(true);
    obj.edit381:setField("outro_");
    obj.edit381.grid.role = "col";
    obj.edit381.grid.width = 1;
    obj.edit381:setHorzTextAlign("center");
    obj.edit381:setName("edit381");
    obj.edit381:setHeight(25);

    obj.button86 = GUI.fromHandle(_obj_newObject("button"));
    obj.button86:setParent(obj.layout198);
    obj.button86.grid.role = "col";
    obj.button86.grid.width = 1;
    obj.button86:setText("🎲");
    obj.button86:setName("button86");

    obj.horzLine105 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine105:setParent(obj.layout198);
    obj.horzLine105.grid.role = "row";
    obj.horzLine105:setName("horzLine105");
    obj.horzLine105:setStrokeColor("grey");

    obj.layout199 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout199:setParent(obj.scrollBox7);
    obj.layout199.grid.role = "row";
    obj.layout199.grid.width = 12;
    obj.layout199.grid["auto-height"] = true;
    obj.layout199:setName("layout199");

    obj.edit382 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit382:setParent(obj.layout199);
    obj.edit382:setTransparent(true);
    obj.edit382:setField("");
    obj.edit382.grid.role = "col";
    obj.edit382.grid.width = 4;
    obj.edit382:setHorzTextAlign("leading");
    obj.edit382:setName("edit382");
    obj.edit382:setHeight(25);

    obj.comboBox67 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox67:setParent(obj.layout199);
    obj.comboBox67:setTransparent(true);
    obj.comboBox67:setField("cha_");
    obj.comboBox67:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox67.grid.role = "col";
    obj.comboBox67.grid.width = 2;
    obj.comboBox67:setHorzTextAlign("center");
    obj.comboBox67:setName("comboBox67");
    obj.comboBox67:setHeight(25);

    obj.edit383 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit383:setParent(obj.layout199);
    obj.edit383:setTransparent(true);
    obj.edit383:setField("valAtr_");
    obj.edit383.grid.role = "col";
    obj.edit383.grid.width = 2;
    obj.edit383:setHorzTextAlign("center");
    obj.edit383:setName("edit383");
    obj.edit383:setHeight(25);

    obj.edit384 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit384:setParent(obj.layout199);
    obj.edit384:setTransparent(true);
    obj.edit384:setField("nivel_");
    obj.edit384.grid.role = "col";
    obj.edit384.grid.width = 2;
    obj.edit384:setHorzTextAlign("center");
    obj.edit384:setName("edit384");
    obj.edit384:setHeight(25);

    obj.edit385 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit385:setParent(obj.layout199);
    obj.edit385:setTransparent(true);
    obj.edit385:setField("outro_");
    obj.edit385.grid.role = "col";
    obj.edit385.grid.width = 1;
    obj.edit385:setHorzTextAlign("center");
    obj.edit385:setName("edit385");
    obj.edit385:setHeight(25);

    obj.button87 = GUI.fromHandle(_obj_newObject("button"));
    obj.button87:setParent(obj.layout199);
    obj.button87.grid.role = "col";
    obj.button87.grid.width = 1;
    obj.button87:setText("🎲");
    obj.button87:setName("button87");

    obj.horzLine106 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine106:setParent(obj.layout199);
    obj.horzLine106.grid.role = "row";
    obj.horzLine106:setName("horzLine106");
    obj.horzLine106:setStrokeColor("grey");

    obj.layout200 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout200:setParent(obj.scrollBox7);
    obj.layout200.grid.role = "row";
    obj.layout200.grid.width = 12;
    obj.layout200.grid["auto-height"] = true;
    obj.layout200:setName("layout200");

    obj.edit386 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit386:setParent(obj.layout200);
    obj.edit386:setTransparent(true);
    obj.edit386:setField("");
    obj.edit386.grid.role = "col";
    obj.edit386.grid.width = 4;
    obj.edit386:setHorzTextAlign("leading");
    obj.edit386:setName("edit386");
    obj.edit386:setHeight(25);

    obj.comboBox68 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox68:setParent(obj.layout200);
    obj.comboBox68:setTransparent(true);
    obj.comboBox68:setField("cha_");
    obj.comboBox68:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox68.grid.role = "col";
    obj.comboBox68.grid.width = 2;
    obj.comboBox68:setHorzTextAlign("center");
    obj.comboBox68:setName("comboBox68");
    obj.comboBox68:setHeight(25);

    obj.edit387 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit387:setParent(obj.layout200);
    obj.edit387:setTransparent(true);
    obj.edit387:setField("valAtr_");
    obj.edit387.grid.role = "col";
    obj.edit387.grid.width = 2;
    obj.edit387:setHorzTextAlign("center");
    obj.edit387:setName("edit387");
    obj.edit387:setHeight(25);

    obj.edit388 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit388:setParent(obj.layout200);
    obj.edit388:setTransparent(true);
    obj.edit388:setField("nivel_");
    obj.edit388.grid.role = "col";
    obj.edit388.grid.width = 2;
    obj.edit388:setHorzTextAlign("center");
    obj.edit388:setName("edit388");
    obj.edit388:setHeight(25);

    obj.edit389 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit389:setParent(obj.layout200);
    obj.edit389:setTransparent(true);
    obj.edit389:setField("outro_");
    obj.edit389.grid.role = "col";
    obj.edit389.grid.width = 1;
    obj.edit389:setHorzTextAlign("center");
    obj.edit389:setName("edit389");
    obj.edit389:setHeight(25);

    obj.button88 = GUI.fromHandle(_obj_newObject("button"));
    obj.button88:setParent(obj.layout200);
    obj.button88.grid.role = "col";
    obj.button88.grid.width = 1;
    obj.button88:setText("🎲");
    obj.button88:setName("button88");

    obj.horzLine107 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine107:setParent(obj.layout200);
    obj.horzLine107.grid.role = "row";
    obj.horzLine107:setName("horzLine107");
    obj.horzLine107:setStrokeColor("grey");

    obj.layout201 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout201:setParent(obj.scrollBox7);
    obj.layout201.grid.role = "row";
    obj.layout201.grid.width = 12;
    obj.layout201.grid["auto-height"] = true;
    obj.layout201:setName("layout201");

    obj.edit390 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit390:setParent(obj.layout201);
    obj.edit390:setTransparent(true);
    obj.edit390:setField("");
    obj.edit390.grid.role = "col";
    obj.edit390.grid.width = 4;
    obj.edit390:setHorzTextAlign("leading");
    obj.edit390:setName("edit390");
    obj.edit390:setHeight(25);

    obj.comboBox69 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox69:setParent(obj.layout201);
    obj.comboBox69:setTransparent(true);
    obj.comboBox69:setField("cha_");
    obj.comboBox69:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox69.grid.role = "col";
    obj.comboBox69.grid.width = 2;
    obj.comboBox69:setHorzTextAlign("center");
    obj.comboBox69:setName("comboBox69");
    obj.comboBox69:setHeight(25);

    obj.edit391 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit391:setParent(obj.layout201);
    obj.edit391:setTransparent(true);
    obj.edit391:setField("valAtr_");
    obj.edit391.grid.role = "col";
    obj.edit391.grid.width = 2;
    obj.edit391:setHorzTextAlign("center");
    obj.edit391:setName("edit391");
    obj.edit391:setHeight(25);

    obj.edit392 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit392:setParent(obj.layout201);
    obj.edit392:setTransparent(true);
    obj.edit392:setField("nivel_");
    obj.edit392.grid.role = "col";
    obj.edit392.grid.width = 2;
    obj.edit392:setHorzTextAlign("center");
    obj.edit392:setName("edit392");
    obj.edit392:setHeight(25);

    obj.edit393 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit393:setParent(obj.layout201);
    obj.edit393:setTransparent(true);
    obj.edit393:setField("outro_");
    obj.edit393.grid.role = "col";
    obj.edit393.grid.width = 1;
    obj.edit393:setHorzTextAlign("center");
    obj.edit393:setName("edit393");
    obj.edit393:setHeight(25);

    obj.button89 = GUI.fromHandle(_obj_newObject("button"));
    obj.button89:setParent(obj.layout201);
    obj.button89.grid.role = "col";
    obj.button89.grid.width = 1;
    obj.button89:setText("🎲");
    obj.button89:setName("button89");

    obj.horzLine108 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine108:setParent(obj.layout201);
    obj.horzLine108.grid.role = "row";
    obj.horzLine108:setName("horzLine108");
    obj.horzLine108:setStrokeColor("grey");

    obj.layout202 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout202:setParent(obj.scrollBox7);
    obj.layout202.grid.role = "row";
    obj.layout202.grid.width = 12;
    obj.layout202.grid["auto-height"] = true;
    obj.layout202:setName("layout202");

    obj.edit394 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit394:setParent(obj.layout202);
    obj.edit394:setTransparent(true);
    obj.edit394:setField("");
    obj.edit394.grid.role = "col";
    obj.edit394.grid.width = 4;
    obj.edit394:setHorzTextAlign("leading");
    obj.edit394:setName("edit394");
    obj.edit394:setHeight(25);

    obj.comboBox70 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox70:setParent(obj.layout202);
    obj.comboBox70:setTransparent(true);
    obj.comboBox70:setField("cha_");
    obj.comboBox70:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox70.grid.role = "col";
    obj.comboBox70.grid.width = 2;
    obj.comboBox70:setHorzTextAlign("center");
    obj.comboBox70:setName("comboBox70");
    obj.comboBox70:setHeight(25);

    obj.edit395 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit395:setParent(obj.layout202);
    obj.edit395:setTransparent(true);
    obj.edit395:setField("valAtr_");
    obj.edit395.grid.role = "col";
    obj.edit395.grid.width = 2;
    obj.edit395:setHorzTextAlign("center");
    obj.edit395:setName("edit395");
    obj.edit395:setHeight(25);

    obj.edit396 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit396:setParent(obj.layout202);
    obj.edit396:setTransparent(true);
    obj.edit396:setField("nivel_");
    obj.edit396.grid.role = "col";
    obj.edit396.grid.width = 2;
    obj.edit396:setHorzTextAlign("center");
    obj.edit396:setName("edit396");
    obj.edit396:setHeight(25);

    obj.edit397 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit397:setParent(obj.layout202);
    obj.edit397:setTransparent(true);
    obj.edit397:setField("outro_");
    obj.edit397.grid.role = "col";
    obj.edit397.grid.width = 1;
    obj.edit397:setHorzTextAlign("center");
    obj.edit397:setName("edit397");
    obj.edit397:setHeight(25);

    obj.button90 = GUI.fromHandle(_obj_newObject("button"));
    obj.button90:setParent(obj.layout202);
    obj.button90.grid.role = "col";
    obj.button90.grid.width = 1;
    obj.button90:setText("🎲");
    obj.button90:setName("button90");

    obj.horzLine109 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine109:setParent(obj.layout202);
    obj.horzLine109.grid.role = "row";
    obj.horzLine109:setName("horzLine109");
    obj.horzLine109:setStrokeColor("grey");

    obj.layout203 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout203:setParent(obj.scrollBox7);
    obj.layout203.grid.role = "row";
    obj.layout203.grid.width = 12;
    obj.layout203.grid["auto-height"] = true;
    obj.layout203:setName("layout203");

    obj.edit398 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit398:setParent(obj.layout203);
    obj.edit398:setTransparent(true);
    obj.edit398:setField("");
    obj.edit398.grid.role = "col";
    obj.edit398.grid.width = 4;
    obj.edit398:setHorzTextAlign("leading");
    obj.edit398:setName("edit398");
    obj.edit398:setHeight(25);

    obj.comboBox71 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox71:setParent(obj.layout203);
    obj.comboBox71:setTransparent(true);
    obj.comboBox71:setField("cha_");
    obj.comboBox71:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox71.grid.role = "col";
    obj.comboBox71.grid.width = 2;
    obj.comboBox71:setHorzTextAlign("center");
    obj.comboBox71:setName("comboBox71");
    obj.comboBox71:setHeight(25);

    obj.edit399 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit399:setParent(obj.layout203);
    obj.edit399:setTransparent(true);
    obj.edit399:setField("valAtr_");
    obj.edit399.grid.role = "col";
    obj.edit399.grid.width = 2;
    obj.edit399:setHorzTextAlign("center");
    obj.edit399:setName("edit399");
    obj.edit399:setHeight(25);

    obj.edit400 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit400:setParent(obj.layout203);
    obj.edit400:setTransparent(true);
    obj.edit400:setField("nivel_");
    obj.edit400.grid.role = "col";
    obj.edit400.grid.width = 2;
    obj.edit400:setHorzTextAlign("center");
    obj.edit400:setName("edit400");
    obj.edit400:setHeight(25);

    obj.edit401 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit401:setParent(obj.layout203);
    obj.edit401:setTransparent(true);
    obj.edit401:setField("outro_");
    obj.edit401.grid.role = "col";
    obj.edit401.grid.width = 1;
    obj.edit401:setHorzTextAlign("center");
    obj.edit401:setName("edit401");
    obj.edit401:setHeight(25);

    obj.button91 = GUI.fromHandle(_obj_newObject("button"));
    obj.button91:setParent(obj.layout203);
    obj.button91.grid.role = "col";
    obj.button91.grid.width = 1;
    obj.button91:setText("🎲");
    obj.button91:setName("button91");

    obj.horzLine110 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine110:setParent(obj.layout203);
    obj.horzLine110.grid.role = "row";
    obj.horzLine110:setName("horzLine110");
    obj.horzLine110:setStrokeColor("grey");

    obj.layout204 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout204:setParent(obj.scrollBox7);
    obj.layout204.grid.role = "row";
    obj.layout204.grid.width = 12;
    obj.layout204.grid["auto-height"] = true;
    obj.layout204:setName("layout204");

    obj.edit402 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit402:setParent(obj.layout204);
    obj.edit402:setTransparent(true);
    obj.edit402:setField("");
    obj.edit402.grid.role = "col";
    obj.edit402.grid.width = 4;
    obj.edit402:setHorzTextAlign("leading");
    obj.edit402:setName("edit402");
    obj.edit402:setHeight(25);

    obj.comboBox72 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox72:setParent(obj.layout204);
    obj.comboBox72:setTransparent(true);
    obj.comboBox72:setField("cha_");
    obj.comboBox72:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox72.grid.role = "col";
    obj.comboBox72.grid.width = 2;
    obj.comboBox72:setHorzTextAlign("center");
    obj.comboBox72:setName("comboBox72");
    obj.comboBox72:setHeight(25);

    obj.edit403 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit403:setParent(obj.layout204);
    obj.edit403:setTransparent(true);
    obj.edit403:setField("valAtr_");
    obj.edit403.grid.role = "col";
    obj.edit403.grid.width = 2;
    obj.edit403:setHorzTextAlign("center");
    obj.edit403:setName("edit403");
    obj.edit403:setHeight(25);

    obj.edit404 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit404:setParent(obj.layout204);
    obj.edit404:setTransparent(true);
    obj.edit404:setField("nivel_");
    obj.edit404.grid.role = "col";
    obj.edit404.grid.width = 2;
    obj.edit404:setHorzTextAlign("center");
    obj.edit404:setName("edit404");
    obj.edit404:setHeight(25);

    obj.edit405 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit405:setParent(obj.layout204);
    obj.edit405:setTransparent(true);
    obj.edit405:setField("outro_");
    obj.edit405.grid.role = "col";
    obj.edit405.grid.width = 1;
    obj.edit405:setHorzTextAlign("center");
    obj.edit405:setName("edit405");
    obj.edit405:setHeight(25);

    obj.button92 = GUI.fromHandle(_obj_newObject("button"));
    obj.button92:setParent(obj.layout204);
    obj.button92.grid.role = "col";
    obj.button92.grid.width = 1;
    obj.button92:setText("🎲");
    obj.button92:setName("button92");

    obj.horzLine111 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine111:setParent(obj.layout204);
    obj.horzLine111.grid.role = "row";
    obj.horzLine111:setName("horzLine111");
    obj.horzLine111:setStrokeColor("grey");

    obj.layout205 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout205:setParent(obj.scrollBox7);
    obj.layout205.grid.role = "row";
    obj.layout205.grid.width = 12;
    obj.layout205.grid["auto-height"] = true;
    obj.layout205:setName("layout205");

    obj.edit406 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit406:setParent(obj.layout205);
    obj.edit406:setTransparent(true);
    obj.edit406:setField("");
    obj.edit406.grid.role = "col";
    obj.edit406.grid.width = 4;
    obj.edit406:setHorzTextAlign("leading");
    obj.edit406:setName("edit406");
    obj.edit406:setHeight(25);

    obj.comboBox73 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox73:setParent(obj.layout205);
    obj.comboBox73:setTransparent(true);
    obj.comboBox73:setField("cha_");
    obj.comboBox73:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox73.grid.role = "col";
    obj.comboBox73.grid.width = 2;
    obj.comboBox73:setHorzTextAlign("center");
    obj.comboBox73:setName("comboBox73");
    obj.comboBox73:setHeight(25);

    obj.edit407 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit407:setParent(obj.layout205);
    obj.edit407:setTransparent(true);
    obj.edit407:setField("valAtr_");
    obj.edit407.grid.role = "col";
    obj.edit407.grid.width = 2;
    obj.edit407:setHorzTextAlign("center");
    obj.edit407:setName("edit407");
    obj.edit407:setHeight(25);

    obj.edit408 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit408:setParent(obj.layout205);
    obj.edit408:setTransparent(true);
    obj.edit408:setField("nivel_");
    obj.edit408.grid.role = "col";
    obj.edit408.grid.width = 2;
    obj.edit408:setHorzTextAlign("center");
    obj.edit408:setName("edit408");
    obj.edit408:setHeight(25);

    obj.edit409 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit409:setParent(obj.layout205);
    obj.edit409:setTransparent(true);
    obj.edit409:setField("outro_");
    obj.edit409.grid.role = "col";
    obj.edit409.grid.width = 1;
    obj.edit409:setHorzTextAlign("center");
    obj.edit409:setName("edit409");
    obj.edit409:setHeight(25);

    obj.button93 = GUI.fromHandle(_obj_newObject("button"));
    obj.button93:setParent(obj.layout205);
    obj.button93.grid.role = "col";
    obj.button93.grid.width = 1;
    obj.button93:setText("🎲");
    obj.button93:setName("button93");

    obj.horzLine112 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine112:setParent(obj.layout205);
    obj.horzLine112.grid.role = "row";
    obj.horzLine112:setName("horzLine112");
    obj.horzLine112:setStrokeColor("grey");

    obj.layout206 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout206:setParent(obj.scrollBox7);
    obj.layout206.grid.role = "row";
    obj.layout206.grid.width = 12;
    obj.layout206.grid["auto-height"] = true;
    obj.layout206:setName("layout206");

    obj.edit410 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit410:setParent(obj.layout206);
    obj.edit410:setTransparent(true);
    obj.edit410:setField("");
    obj.edit410.grid.role = "col";
    obj.edit410.grid.width = 4;
    obj.edit410:setHorzTextAlign("leading");
    obj.edit410:setName("edit410");
    obj.edit410:setHeight(25);

    obj.comboBox74 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox74:setParent(obj.layout206);
    obj.comboBox74:setTransparent(true);
    obj.comboBox74:setField("cha_");
    obj.comboBox74:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox74.grid.role = "col";
    obj.comboBox74.grid.width = 2;
    obj.comboBox74:setHorzTextAlign("center");
    obj.comboBox74:setName("comboBox74");
    obj.comboBox74:setHeight(25);

    obj.edit411 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit411:setParent(obj.layout206);
    obj.edit411:setTransparent(true);
    obj.edit411:setField("valAtr_");
    obj.edit411.grid.role = "col";
    obj.edit411.grid.width = 2;
    obj.edit411:setHorzTextAlign("center");
    obj.edit411:setName("edit411");
    obj.edit411:setHeight(25);

    obj.edit412 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit412:setParent(obj.layout206);
    obj.edit412:setTransparent(true);
    obj.edit412:setField("nivel_");
    obj.edit412.grid.role = "col";
    obj.edit412.grid.width = 2;
    obj.edit412:setHorzTextAlign("center");
    obj.edit412:setName("edit412");
    obj.edit412:setHeight(25);

    obj.edit413 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit413:setParent(obj.layout206);
    obj.edit413:setTransparent(true);
    obj.edit413:setField("outro_");
    obj.edit413.grid.role = "col";
    obj.edit413.grid.width = 1;
    obj.edit413:setHorzTextAlign("center");
    obj.edit413:setName("edit413");
    obj.edit413:setHeight(25);

    obj.button94 = GUI.fromHandle(_obj_newObject("button"));
    obj.button94:setParent(obj.layout206);
    obj.button94.grid.role = "col";
    obj.button94.grid.width = 1;
    obj.button94:setText("🎲");
    obj.button94:setName("button94");

    obj.horzLine113 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine113:setParent(obj.layout206);
    obj.horzLine113.grid.role = "row";
    obj.horzLine113:setName("horzLine113");
    obj.horzLine113:setStrokeColor("grey");

    obj.layout207 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout207:setParent(obj.scrollBox7);
    obj.layout207.grid.role = "row";
    obj.layout207.grid.width = 12;
    obj.layout207.grid["auto-height"] = true;
    obj.layout207:setName("layout207");

    obj.edit414 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit414:setParent(obj.layout207);
    obj.edit414:setTransparent(true);
    obj.edit414:setField("");
    obj.edit414.grid.role = "col";
    obj.edit414.grid.width = 4;
    obj.edit414:setHorzTextAlign("leading");
    obj.edit414:setName("edit414");
    obj.edit414:setHeight(25);

    obj.comboBox75 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox75:setParent(obj.layout207);
    obj.comboBox75:setTransparent(true);
    obj.comboBox75:setField("cha_");
    obj.comboBox75:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox75.grid.role = "col";
    obj.comboBox75.grid.width = 2;
    obj.comboBox75:setHorzTextAlign("center");
    obj.comboBox75:setName("comboBox75");
    obj.comboBox75:setHeight(25);

    obj.edit415 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit415:setParent(obj.layout207);
    obj.edit415:setTransparent(true);
    obj.edit415:setField("valAtr_");
    obj.edit415.grid.role = "col";
    obj.edit415.grid.width = 2;
    obj.edit415:setHorzTextAlign("center");
    obj.edit415:setName("edit415");
    obj.edit415:setHeight(25);

    obj.edit416 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit416:setParent(obj.layout207);
    obj.edit416:setTransparent(true);
    obj.edit416:setField("nivel_");
    obj.edit416.grid.role = "col";
    obj.edit416.grid.width = 2;
    obj.edit416:setHorzTextAlign("center");
    obj.edit416:setName("edit416");
    obj.edit416:setHeight(25);

    obj.edit417 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit417:setParent(obj.layout207);
    obj.edit417:setTransparent(true);
    obj.edit417:setField("outro_");
    obj.edit417.grid.role = "col";
    obj.edit417.grid.width = 1;
    obj.edit417:setHorzTextAlign("center");
    obj.edit417:setName("edit417");
    obj.edit417:setHeight(25);

    obj.button95 = GUI.fromHandle(_obj_newObject("button"));
    obj.button95:setParent(obj.layout207);
    obj.button95.grid.role = "col";
    obj.button95.grid.width = 1;
    obj.button95:setText("🎲");
    obj.button95:setName("button95");

    obj.horzLine114 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine114:setParent(obj.layout207);
    obj.horzLine114.grid.role = "row";
    obj.horzLine114:setName("horzLine114");
    obj.horzLine114:setStrokeColor("grey");

    obj.layout208 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout208:setParent(obj.scrollBox7);
    obj.layout208.grid.role = "row";
    obj.layout208.grid.width = 12;
    obj.layout208.grid["auto-height"] = true;
    obj.layout208:setName("layout208");

    obj.edit418 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit418:setParent(obj.layout208);
    obj.edit418:setTransparent(true);
    obj.edit418:setField("");
    obj.edit418.grid.role = "col";
    obj.edit418.grid.width = 4;
    obj.edit418:setHorzTextAlign("leading");
    obj.edit418:setName("edit418");
    obj.edit418:setHeight(25);

    obj.comboBox76 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox76:setParent(obj.layout208);
    obj.comboBox76:setTransparent(true);
    obj.comboBox76:setField("cha_");
    obj.comboBox76:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox76.grid.role = "col";
    obj.comboBox76.grid.width = 2;
    obj.comboBox76:setHorzTextAlign("center");
    obj.comboBox76:setName("comboBox76");
    obj.comboBox76:setHeight(25);

    obj.edit419 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit419:setParent(obj.layout208);
    obj.edit419:setTransparent(true);
    obj.edit419:setField("valAtr_");
    obj.edit419.grid.role = "col";
    obj.edit419.grid.width = 2;
    obj.edit419:setHorzTextAlign("center");
    obj.edit419:setName("edit419");
    obj.edit419:setHeight(25);

    obj.edit420 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit420:setParent(obj.layout208);
    obj.edit420:setTransparent(true);
    obj.edit420:setField("nivel_");
    obj.edit420.grid.role = "col";
    obj.edit420.grid.width = 2;
    obj.edit420:setHorzTextAlign("center");
    obj.edit420:setName("edit420");
    obj.edit420:setHeight(25);

    obj.edit421 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit421:setParent(obj.layout208);
    obj.edit421:setTransparent(true);
    obj.edit421:setField("outro_");
    obj.edit421.grid.role = "col";
    obj.edit421.grid.width = 1;
    obj.edit421:setHorzTextAlign("center");
    obj.edit421:setName("edit421");
    obj.edit421:setHeight(25);

    obj.button96 = GUI.fromHandle(_obj_newObject("button"));
    obj.button96:setParent(obj.layout208);
    obj.button96.grid.role = "col";
    obj.button96.grid.width = 1;
    obj.button96:setText("🎲");
    obj.button96:setName("button96");

    obj.horzLine115 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine115:setParent(obj.layout208);
    obj.horzLine115.grid.role = "row";
    obj.horzLine115:setName("horzLine115");
    obj.horzLine115:setStrokeColor("grey");

    obj.layout209 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout209:setParent(obj.scrollBox7);
    obj.layout209.grid.role = "row";
    obj.layout209.grid.width = 12;
    obj.layout209.grid["auto-height"] = true;
    obj.layout209:setName("layout209");

    obj.edit422 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit422:setParent(obj.layout209);
    obj.edit422:setTransparent(true);
    obj.edit422:setField("");
    obj.edit422.grid.role = "col";
    obj.edit422.grid.width = 4;
    obj.edit422:setHorzTextAlign("leading");
    obj.edit422:setName("edit422");
    obj.edit422:setHeight(25);

    obj.comboBox77 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox77:setParent(obj.layout209);
    obj.comboBox77:setTransparent(true);
    obj.comboBox77:setField("cha_");
    obj.comboBox77:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox77.grid.role = "col";
    obj.comboBox77.grid.width = 2;
    obj.comboBox77:setHorzTextAlign("center");
    obj.comboBox77:setName("comboBox77");
    obj.comboBox77:setHeight(25);

    obj.edit423 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit423:setParent(obj.layout209);
    obj.edit423:setTransparent(true);
    obj.edit423:setField("valAtr_");
    obj.edit423.grid.role = "col";
    obj.edit423.grid.width = 2;
    obj.edit423:setHorzTextAlign("center");
    obj.edit423:setName("edit423");
    obj.edit423:setHeight(25);

    obj.edit424 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit424:setParent(obj.layout209);
    obj.edit424:setTransparent(true);
    obj.edit424:setField("nivel_");
    obj.edit424.grid.role = "col";
    obj.edit424.grid.width = 2;
    obj.edit424:setHorzTextAlign("center");
    obj.edit424:setName("edit424");
    obj.edit424:setHeight(25);

    obj.edit425 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit425:setParent(obj.layout209);
    obj.edit425:setTransparent(true);
    obj.edit425:setField("outro_");
    obj.edit425.grid.role = "col";
    obj.edit425.grid.width = 1;
    obj.edit425:setHorzTextAlign("center");
    obj.edit425:setName("edit425");
    obj.edit425:setHeight(25);

    obj.button97 = GUI.fromHandle(_obj_newObject("button"));
    obj.button97:setParent(obj.layout209);
    obj.button97.grid.role = "col";
    obj.button97.grid.width = 1;
    obj.button97:setText("🎲");
    obj.button97:setName("button97");

    obj.horzLine116 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine116:setParent(obj.layout209);
    obj.horzLine116.grid.role = "row";
    obj.horzLine116:setName("horzLine116");
    obj.horzLine116:setStrokeColor("grey");

    obj.layout210 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout210:setParent(obj.scrollBox7);
    obj.layout210.grid.role = "row";
    obj.layout210.grid.width = 12;
    obj.layout210.grid["auto-height"] = true;
    obj.layout210:setName("layout210");

    obj.edit426 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit426:setParent(obj.layout210);
    obj.edit426:setTransparent(true);
    obj.edit426:setField("");
    obj.edit426.grid.role = "col";
    obj.edit426.grid.width = 4;
    obj.edit426:setHorzTextAlign("leading");
    obj.edit426:setName("edit426");
    obj.edit426:setHeight(25);

    obj.comboBox78 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox78:setParent(obj.layout210);
    obj.comboBox78:setTransparent(true);
    obj.comboBox78:setField("cha_");
    obj.comboBox78:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox78.grid.role = "col";
    obj.comboBox78.grid.width = 2;
    obj.comboBox78:setHorzTextAlign("center");
    obj.comboBox78:setName("comboBox78");
    obj.comboBox78:setHeight(25);

    obj.edit427 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit427:setParent(obj.layout210);
    obj.edit427:setTransparent(true);
    obj.edit427:setField("valAtr_");
    obj.edit427.grid.role = "col";
    obj.edit427.grid.width = 2;
    obj.edit427:setHorzTextAlign("center");
    obj.edit427:setName("edit427");
    obj.edit427:setHeight(25);

    obj.edit428 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit428:setParent(obj.layout210);
    obj.edit428:setTransparent(true);
    obj.edit428:setField("nivel_");
    obj.edit428.grid.role = "col";
    obj.edit428.grid.width = 2;
    obj.edit428:setHorzTextAlign("center");
    obj.edit428:setName("edit428");
    obj.edit428:setHeight(25);

    obj.edit429 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit429:setParent(obj.layout210);
    obj.edit429:setTransparent(true);
    obj.edit429:setField("outro_");
    obj.edit429.grid.role = "col";
    obj.edit429.grid.width = 1;
    obj.edit429:setHorzTextAlign("center");
    obj.edit429:setName("edit429");
    obj.edit429:setHeight(25);

    obj.button98 = GUI.fromHandle(_obj_newObject("button"));
    obj.button98:setParent(obj.layout210);
    obj.button98.grid.role = "col";
    obj.button98.grid.width = 1;
    obj.button98:setText("🎲");
    obj.button98:setName("button98");

    obj.horzLine117 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine117:setParent(obj.layout210);
    obj.horzLine117.grid.role = "row";
    obj.horzLine117:setName("horzLine117");
    obj.horzLine117:setStrokeColor("grey");

    obj.layout211 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout211:setParent(obj.scrollBox7);
    obj.layout211.grid.role = "row";
    obj.layout211.grid.width = 12;
    obj.layout211.grid["auto-height"] = true;
    obj.layout211:setName("layout211");

    obj.edit430 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit430:setParent(obj.layout211);
    obj.edit430:setTransparent(true);
    obj.edit430:setField("");
    obj.edit430.grid.role = "col";
    obj.edit430.grid.width = 4;
    obj.edit430:setHorzTextAlign("leading");
    obj.edit430:setName("edit430");
    obj.edit430:setHeight(25);

    obj.comboBox79 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox79:setParent(obj.layout211);
    obj.comboBox79:setTransparent(true);
    obj.comboBox79:setField("cha_");
    obj.comboBox79:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox79.grid.role = "col";
    obj.comboBox79.grid.width = 2;
    obj.comboBox79:setHorzTextAlign("center");
    obj.comboBox79:setName("comboBox79");
    obj.comboBox79:setHeight(25);

    obj.edit431 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit431:setParent(obj.layout211);
    obj.edit431:setTransparent(true);
    obj.edit431:setField("valAtr_");
    obj.edit431.grid.role = "col";
    obj.edit431.grid.width = 2;
    obj.edit431:setHorzTextAlign("center");
    obj.edit431:setName("edit431");
    obj.edit431:setHeight(25);

    obj.edit432 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit432:setParent(obj.layout211);
    obj.edit432:setTransparent(true);
    obj.edit432:setField("nivel_");
    obj.edit432.grid.role = "col";
    obj.edit432.grid.width = 2;
    obj.edit432:setHorzTextAlign("center");
    obj.edit432:setName("edit432");
    obj.edit432:setHeight(25);

    obj.edit433 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit433:setParent(obj.layout211);
    obj.edit433:setTransparent(true);
    obj.edit433:setField("outro_");
    obj.edit433.grid.role = "col";
    obj.edit433.grid.width = 1;
    obj.edit433:setHorzTextAlign("center");
    obj.edit433:setName("edit433");
    obj.edit433:setHeight(25);

    obj.button99 = GUI.fromHandle(_obj_newObject("button"));
    obj.button99:setParent(obj.layout211);
    obj.button99.grid.role = "col";
    obj.button99.grid.width = 1;
    obj.button99:setText("🎲");
    obj.button99:setName("button99");

    obj.horzLine118 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine118:setParent(obj.layout211);
    obj.horzLine118.grid.role = "row";
    obj.horzLine118:setName("horzLine118");
    obj.horzLine118:setStrokeColor("grey");

    obj.layout212 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout212:setParent(obj.scrollBox7);
    obj.layout212.grid.role = "row";
    obj.layout212.grid.width = 12;
    obj.layout212.grid["auto-height"] = true;
    obj.layout212:setName("layout212");

    obj.edit434 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit434:setParent(obj.layout212);
    obj.edit434:setTransparent(true);
    obj.edit434:setField("");
    obj.edit434.grid.role = "col";
    obj.edit434.grid.width = 4;
    obj.edit434:setHorzTextAlign("leading");
    obj.edit434:setName("edit434");
    obj.edit434:setHeight(25);

    obj.comboBox80 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox80:setParent(obj.layout212);
    obj.comboBox80:setTransparent(true);
    obj.comboBox80:setField("cha_");
    obj.comboBox80:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox80.grid.role = "col";
    obj.comboBox80.grid.width = 2;
    obj.comboBox80:setHorzTextAlign("center");
    obj.comboBox80:setName("comboBox80");
    obj.comboBox80:setHeight(25);

    obj.edit435 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit435:setParent(obj.layout212);
    obj.edit435:setTransparent(true);
    obj.edit435:setField("valAtr_");
    obj.edit435.grid.role = "col";
    obj.edit435.grid.width = 2;
    obj.edit435:setHorzTextAlign("center");
    obj.edit435:setName("edit435");
    obj.edit435:setHeight(25);

    obj.edit436 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit436:setParent(obj.layout212);
    obj.edit436:setTransparent(true);
    obj.edit436:setField("nivel_");
    obj.edit436.grid.role = "col";
    obj.edit436.grid.width = 2;
    obj.edit436:setHorzTextAlign("center");
    obj.edit436:setName("edit436");
    obj.edit436:setHeight(25);

    obj.edit437 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit437:setParent(obj.layout212);
    obj.edit437:setTransparent(true);
    obj.edit437:setField("outro_");
    obj.edit437.grid.role = "col";
    obj.edit437.grid.width = 1;
    obj.edit437:setHorzTextAlign("center");
    obj.edit437:setName("edit437");
    obj.edit437:setHeight(25);

    obj.button100 = GUI.fromHandle(_obj_newObject("button"));
    obj.button100:setParent(obj.layout212);
    obj.button100.grid.role = "col";
    obj.button100.grid.width = 1;
    obj.button100:setText("🎲");
    obj.button100:setName("button100");

    obj.horzLine119 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine119:setParent(obj.layout212);
    obj.horzLine119.grid.role = "row";
    obj.horzLine119:setName("horzLine119");
    obj.horzLine119:setStrokeColor("grey");

    obj.layout213 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout213:setParent(obj.scrollBox7);
    obj.layout213.grid.role = "row";
    obj.layout213.grid.width = 12;
    obj.layout213.grid["auto-height"] = true;
    obj.layout213:setName("layout213");

    obj.edit438 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit438:setParent(obj.layout213);
    obj.edit438:setTransparent(true);
    obj.edit438:setField("");
    obj.edit438.grid.role = "col";
    obj.edit438.grid.width = 4;
    obj.edit438:setHorzTextAlign("leading");
    obj.edit438:setName("edit438");
    obj.edit438:setHeight(25);

    obj.comboBox81 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox81:setParent(obj.layout213);
    obj.comboBox81:setTransparent(true);
    obj.comboBox81:setField("cha_");
    obj.comboBox81:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox81.grid.role = "col";
    obj.comboBox81.grid.width = 2;
    obj.comboBox81:setHorzTextAlign("center");
    obj.comboBox81:setName("comboBox81");
    obj.comboBox81:setHeight(25);

    obj.edit439 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit439:setParent(obj.layout213);
    obj.edit439:setTransparent(true);
    obj.edit439:setField("valAtr_");
    obj.edit439.grid.role = "col";
    obj.edit439.grid.width = 2;
    obj.edit439:setHorzTextAlign("center");
    obj.edit439:setName("edit439");
    obj.edit439:setHeight(25);

    obj.edit440 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit440:setParent(obj.layout213);
    obj.edit440:setTransparent(true);
    obj.edit440:setField("nivel_");
    obj.edit440.grid.role = "col";
    obj.edit440.grid.width = 2;
    obj.edit440:setHorzTextAlign("center");
    obj.edit440:setName("edit440");
    obj.edit440:setHeight(25);

    obj.edit441 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit441:setParent(obj.layout213);
    obj.edit441:setTransparent(true);
    obj.edit441:setField("outro_");
    obj.edit441.grid.role = "col";
    obj.edit441.grid.width = 1;
    obj.edit441:setHorzTextAlign("center");
    obj.edit441:setName("edit441");
    obj.edit441:setHeight(25);

    obj.button101 = GUI.fromHandle(_obj_newObject("button"));
    obj.button101:setParent(obj.layout213);
    obj.button101.grid.role = "col";
    obj.button101.grid.width = 1;
    obj.button101:setText("🎲");
    obj.button101:setName("button101");

    obj.horzLine120 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine120:setParent(obj.layout213);
    obj.horzLine120.grid.role = "row";
    obj.horzLine120:setName("horzLine120");
    obj.horzLine120:setStrokeColor("grey");

    obj.layout214 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout214:setParent(obj.scrollBox7);
    obj.layout214.grid.role = "row";
    obj.layout214.grid.width = 12;
    obj.layout214.grid["auto-height"] = true;
    obj.layout214:setName("layout214");

    obj.edit442 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit442:setParent(obj.layout214);
    obj.edit442:setTransparent(true);
    obj.edit442:setField("");
    obj.edit442.grid.role = "col";
    obj.edit442.grid.width = 4;
    obj.edit442:setHorzTextAlign("leading");
    obj.edit442:setName("edit442");
    obj.edit442:setHeight(25);

    obj.comboBox82 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox82:setParent(obj.layout214);
    obj.comboBox82:setTransparent(true);
    obj.comboBox82:setField("cha_");
    obj.comboBox82:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox82.grid.role = "col";
    obj.comboBox82.grid.width = 2;
    obj.comboBox82:setHorzTextAlign("center");
    obj.comboBox82:setName("comboBox82");
    obj.comboBox82:setHeight(25);

    obj.edit443 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit443:setParent(obj.layout214);
    obj.edit443:setTransparent(true);
    obj.edit443:setField("valAtr_");
    obj.edit443.grid.role = "col";
    obj.edit443.grid.width = 2;
    obj.edit443:setHorzTextAlign("center");
    obj.edit443:setName("edit443");
    obj.edit443:setHeight(25);

    obj.edit444 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit444:setParent(obj.layout214);
    obj.edit444:setTransparent(true);
    obj.edit444:setField("nivel_");
    obj.edit444.grid.role = "col";
    obj.edit444.grid.width = 2;
    obj.edit444:setHorzTextAlign("center");
    obj.edit444:setName("edit444");
    obj.edit444:setHeight(25);

    obj.edit445 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit445:setParent(obj.layout214);
    obj.edit445:setTransparent(true);
    obj.edit445:setField("outro_");
    obj.edit445.grid.role = "col";
    obj.edit445.grid.width = 1;
    obj.edit445:setHorzTextAlign("center");
    obj.edit445:setName("edit445");
    obj.edit445:setHeight(25);

    obj.button102 = GUI.fromHandle(_obj_newObject("button"));
    obj.button102:setParent(obj.layout214);
    obj.button102.grid.role = "col";
    obj.button102.grid.width = 1;
    obj.button102:setText("🎲");
    obj.button102:setName("button102");

    obj.horzLine121 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine121:setParent(obj.layout214);
    obj.horzLine121.grid.role = "row";
    obj.horzLine121:setName("horzLine121");
    obj.horzLine121:setStrokeColor("grey");

    obj.layout215 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout215:setParent(obj.scrollBox7);
    obj.layout215.grid.role = "row";
    obj.layout215.grid.width = 12;
    obj.layout215.grid["auto-height"] = true;
    obj.layout215:setName("layout215");

    obj.edit446 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit446:setParent(obj.layout215);
    obj.edit446:setTransparent(true);
    obj.edit446:setField("");
    obj.edit446.grid.role = "col";
    obj.edit446.grid.width = 4;
    obj.edit446:setHorzTextAlign("leading");
    obj.edit446:setName("edit446");
    obj.edit446:setHeight(25);

    obj.comboBox83 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox83:setParent(obj.layout215);
    obj.comboBox83:setTransparent(true);
    obj.comboBox83:setField("cha_");
    obj.comboBox83:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox83.grid.role = "col";
    obj.comboBox83.grid.width = 2;
    obj.comboBox83:setHorzTextAlign("center");
    obj.comboBox83:setName("comboBox83");
    obj.comboBox83:setHeight(25);

    obj.edit447 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit447:setParent(obj.layout215);
    obj.edit447:setTransparent(true);
    obj.edit447:setField("valAtr_");
    obj.edit447.grid.role = "col";
    obj.edit447.grid.width = 2;
    obj.edit447:setHorzTextAlign("center");
    obj.edit447:setName("edit447");
    obj.edit447:setHeight(25);

    obj.edit448 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit448:setParent(obj.layout215);
    obj.edit448:setTransparent(true);
    obj.edit448:setField("nivel_");
    obj.edit448.grid.role = "col";
    obj.edit448.grid.width = 2;
    obj.edit448:setHorzTextAlign("center");
    obj.edit448:setName("edit448");
    obj.edit448:setHeight(25);

    obj.edit449 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit449:setParent(obj.layout215);
    obj.edit449:setTransparent(true);
    obj.edit449:setField("outro_");
    obj.edit449.grid.role = "col";
    obj.edit449.grid.width = 1;
    obj.edit449:setHorzTextAlign("center");
    obj.edit449:setName("edit449");
    obj.edit449:setHeight(25);

    obj.button103 = GUI.fromHandle(_obj_newObject("button"));
    obj.button103:setParent(obj.layout215);
    obj.button103.grid.role = "col";
    obj.button103.grid.width = 1;
    obj.button103:setText("🎲");
    obj.button103:setName("button103");

    obj.horzLine122 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine122:setParent(obj.layout215);
    obj.horzLine122.grid.role = "row";
    obj.horzLine122:setName("horzLine122");
    obj.horzLine122:setStrokeColor("grey");

    obj.layout216 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout216:setParent(obj.scrollBox7);
    obj.layout216.grid.role = "row";
    obj.layout216.grid.width = 12;
    obj.layout216.grid["auto-height"] = true;
    obj.layout216:setName("layout216");

    obj.edit450 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit450:setParent(obj.layout216);
    obj.edit450:setTransparent(true);
    obj.edit450:setField("");
    obj.edit450.grid.role = "col";
    obj.edit450.grid.width = 4;
    obj.edit450:setHorzTextAlign("leading");
    obj.edit450:setName("edit450");
    obj.edit450:setHeight(25);

    obj.comboBox84 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox84:setParent(obj.layout216);
    obj.comboBox84:setTransparent(true);
    obj.comboBox84:setField("cha_");
    obj.comboBox84:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox84.grid.role = "col";
    obj.comboBox84.grid.width = 2;
    obj.comboBox84:setHorzTextAlign("center");
    obj.comboBox84:setName("comboBox84");
    obj.comboBox84:setHeight(25);

    obj.edit451 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit451:setParent(obj.layout216);
    obj.edit451:setTransparent(true);
    obj.edit451:setField("valAtr_");
    obj.edit451.grid.role = "col";
    obj.edit451.grid.width = 2;
    obj.edit451:setHorzTextAlign("center");
    obj.edit451:setName("edit451");
    obj.edit451:setHeight(25);

    obj.edit452 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit452:setParent(obj.layout216);
    obj.edit452:setTransparent(true);
    obj.edit452:setField("nivel_");
    obj.edit452.grid.role = "col";
    obj.edit452.grid.width = 2;
    obj.edit452:setHorzTextAlign("center");
    obj.edit452:setName("edit452");
    obj.edit452:setHeight(25);

    obj.edit453 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit453:setParent(obj.layout216);
    obj.edit453:setTransparent(true);
    obj.edit453:setField("outro_");
    obj.edit453.grid.role = "col";
    obj.edit453.grid.width = 1;
    obj.edit453:setHorzTextAlign("center");
    obj.edit453:setName("edit453");
    obj.edit453:setHeight(25);

    obj.button104 = GUI.fromHandle(_obj_newObject("button"));
    obj.button104:setParent(obj.layout216);
    obj.button104.grid.role = "col";
    obj.button104.grid.width = 1;
    obj.button104:setText("🎲");
    obj.button104:setName("button104");

    obj.horzLine123 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine123:setParent(obj.layout216);
    obj.horzLine123.grid.role = "row";
    obj.horzLine123:setName("horzLine123");
    obj.horzLine123:setStrokeColor("grey");

    obj.layout217 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout217:setParent(obj.scrollBox7);
    obj.layout217.grid.role = "row";
    obj.layout217.grid.width = 12;
    obj.layout217.grid["auto-height"] = true;
    obj.layout217:setName("layout217");

    obj.edit454 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit454:setParent(obj.layout217);
    obj.edit454:setTransparent(true);
    obj.edit454:setField("");
    obj.edit454.grid.role = "col";
    obj.edit454.grid.width = 4;
    obj.edit454:setHorzTextAlign("leading");
    obj.edit454:setName("edit454");
    obj.edit454:setHeight(25);

    obj.comboBox85 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox85:setParent(obj.layout217);
    obj.comboBox85:setTransparent(true);
    obj.comboBox85:setField("cha_");
    obj.comboBox85:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox85.grid.role = "col";
    obj.comboBox85.grid.width = 2;
    obj.comboBox85:setHorzTextAlign("center");
    obj.comboBox85:setName("comboBox85");
    obj.comboBox85:setHeight(25);

    obj.edit455 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit455:setParent(obj.layout217);
    obj.edit455:setTransparent(true);
    obj.edit455:setField("valAtr_");
    obj.edit455.grid.role = "col";
    obj.edit455.grid.width = 2;
    obj.edit455:setHorzTextAlign("center");
    obj.edit455:setName("edit455");
    obj.edit455:setHeight(25);

    obj.edit456 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit456:setParent(obj.layout217);
    obj.edit456:setTransparent(true);
    obj.edit456:setField("nivel_");
    obj.edit456.grid.role = "col";
    obj.edit456.grid.width = 2;
    obj.edit456:setHorzTextAlign("center");
    obj.edit456:setName("edit456");
    obj.edit456:setHeight(25);

    obj.edit457 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit457:setParent(obj.layout217);
    obj.edit457:setTransparent(true);
    obj.edit457:setField("outro_");
    obj.edit457.grid.role = "col";
    obj.edit457.grid.width = 1;
    obj.edit457:setHorzTextAlign("center");
    obj.edit457:setName("edit457");
    obj.edit457:setHeight(25);

    obj.button105 = GUI.fromHandle(_obj_newObject("button"));
    obj.button105:setParent(obj.layout217);
    obj.button105.grid.role = "col";
    obj.button105.grid.width = 1;
    obj.button105:setText("🎲");
    obj.button105:setName("button105");

    obj.horzLine124 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine124:setParent(obj.layout217);
    obj.horzLine124.grid.role = "row";
    obj.horzLine124:setName("horzLine124");
    obj.horzLine124:setStrokeColor("grey");

    obj.layout218 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout218:setParent(obj.scrollBox7);
    obj.layout218.grid.role = "row";
    obj.layout218.grid.width = 12;
    obj.layout218.grid["auto-height"] = true;
    obj.layout218:setName("layout218");

    obj.edit458 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit458:setParent(obj.layout218);
    obj.edit458:setTransparent(true);
    obj.edit458:setField("");
    obj.edit458.grid.role = "col";
    obj.edit458.grid.width = 4;
    obj.edit458:setHorzTextAlign("leading");
    obj.edit458:setName("edit458");
    obj.edit458:setHeight(25);

    obj.comboBox86 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox86:setParent(obj.layout218);
    obj.comboBox86:setTransparent(true);
    obj.comboBox86:setField("cha_");
    obj.comboBox86:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox86.grid.role = "col";
    obj.comboBox86.grid.width = 2;
    obj.comboBox86:setHorzTextAlign("center");
    obj.comboBox86:setName("comboBox86");
    obj.comboBox86:setHeight(25);

    obj.edit459 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit459:setParent(obj.layout218);
    obj.edit459:setTransparent(true);
    obj.edit459:setField("valAtr_");
    obj.edit459.grid.role = "col";
    obj.edit459.grid.width = 2;
    obj.edit459:setHorzTextAlign("center");
    obj.edit459:setName("edit459");
    obj.edit459:setHeight(25);

    obj.edit460 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit460:setParent(obj.layout218);
    obj.edit460:setTransparent(true);
    obj.edit460:setField("nivel_");
    obj.edit460.grid.role = "col";
    obj.edit460.grid.width = 2;
    obj.edit460:setHorzTextAlign("center");
    obj.edit460:setName("edit460");
    obj.edit460:setHeight(25);

    obj.edit461 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit461:setParent(obj.layout218);
    obj.edit461:setTransparent(true);
    obj.edit461:setField("outro_");
    obj.edit461.grid.role = "col";
    obj.edit461.grid.width = 1;
    obj.edit461:setHorzTextAlign("center");
    obj.edit461:setName("edit461");
    obj.edit461:setHeight(25);

    obj.button106 = GUI.fromHandle(_obj_newObject("button"));
    obj.button106:setParent(obj.layout218);
    obj.button106.grid.role = "col";
    obj.button106.grid.width = 1;
    obj.button106:setText("🎲");
    obj.button106:setName("button106");

    obj.horzLine125 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine125:setParent(obj.layout218);
    obj.horzLine125.grid.role = "row";
    obj.horzLine125:setName("horzLine125");
    obj.horzLine125:setStrokeColor("grey");

    obj.layout219 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout219:setParent(obj.scrollBox7);
    obj.layout219.grid.role = "row";
    obj.layout219.grid.width = 12;
    obj.layout219.grid["auto-height"] = true;
    obj.layout219:setName("layout219");

    obj.edit462 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit462:setParent(obj.layout219);
    obj.edit462:setTransparent(true);
    obj.edit462:setField("");
    obj.edit462.grid.role = "col";
    obj.edit462.grid.width = 4;
    obj.edit462:setHorzTextAlign("leading");
    obj.edit462:setName("edit462");
    obj.edit462:setHeight(25);

    obj.comboBox87 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox87:setParent(obj.layout219);
    obj.comboBox87:setTransparent(true);
    obj.comboBox87:setField("cha_");
    obj.comboBox87:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox87.grid.role = "col";
    obj.comboBox87.grid.width = 2;
    obj.comboBox87:setHorzTextAlign("center");
    obj.comboBox87:setName("comboBox87");
    obj.comboBox87:setHeight(25);

    obj.edit463 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit463:setParent(obj.layout219);
    obj.edit463:setTransparent(true);
    obj.edit463:setField("valAtr_");
    obj.edit463.grid.role = "col";
    obj.edit463.grid.width = 2;
    obj.edit463:setHorzTextAlign("center");
    obj.edit463:setName("edit463");
    obj.edit463:setHeight(25);

    obj.edit464 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit464:setParent(obj.layout219);
    obj.edit464:setTransparent(true);
    obj.edit464:setField("nivel_");
    obj.edit464.grid.role = "col";
    obj.edit464.grid.width = 2;
    obj.edit464:setHorzTextAlign("center");
    obj.edit464:setName("edit464");
    obj.edit464:setHeight(25);

    obj.edit465 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit465:setParent(obj.layout219);
    obj.edit465:setTransparent(true);
    obj.edit465:setField("outro_");
    obj.edit465.grid.role = "col";
    obj.edit465.grid.width = 1;
    obj.edit465:setHorzTextAlign("center");
    obj.edit465:setName("edit465");
    obj.edit465:setHeight(25);

    obj.button107 = GUI.fromHandle(_obj_newObject("button"));
    obj.button107:setParent(obj.layout219);
    obj.button107.grid.role = "col";
    obj.button107.grid.width = 1;
    obj.button107:setText("🎲");
    obj.button107:setName("button107");

    obj.horzLine126 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine126:setParent(obj.layout219);
    obj.horzLine126.grid.role = "row";
    obj.horzLine126:setName("horzLine126");
    obj.horzLine126:setStrokeColor("grey");

    obj.layout220 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout220:setParent(obj.scrollBox7);
    obj.layout220.grid.role = "row";
    obj.layout220.grid.width = 12;
    obj.layout220.grid["auto-height"] = true;
    obj.layout220:setName("layout220");

    obj.edit466 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit466:setParent(obj.layout220);
    obj.edit466:setTransparent(true);
    obj.edit466:setField("");
    obj.edit466.grid.role = "col";
    obj.edit466.grid.width = 4;
    obj.edit466:setHorzTextAlign("leading");
    obj.edit466:setName("edit466");
    obj.edit466:setHeight(25);

    obj.comboBox88 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox88:setParent(obj.layout220);
    obj.comboBox88:setTransparent(true);
    obj.comboBox88:setField("cha_");
    obj.comboBox88:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox88.grid.role = "col";
    obj.comboBox88.grid.width = 2;
    obj.comboBox88:setHorzTextAlign("center");
    obj.comboBox88:setName("comboBox88");
    obj.comboBox88:setHeight(25);

    obj.edit467 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit467:setParent(obj.layout220);
    obj.edit467:setTransparent(true);
    obj.edit467:setField("valAtr_");
    obj.edit467.grid.role = "col";
    obj.edit467.grid.width = 2;
    obj.edit467:setHorzTextAlign("center");
    obj.edit467:setName("edit467");
    obj.edit467:setHeight(25);

    obj.edit468 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit468:setParent(obj.layout220);
    obj.edit468:setTransparent(true);
    obj.edit468:setField("nivel_");
    obj.edit468.grid.role = "col";
    obj.edit468.grid.width = 2;
    obj.edit468:setHorzTextAlign("center");
    obj.edit468:setName("edit468");
    obj.edit468:setHeight(25);

    obj.edit469 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit469:setParent(obj.layout220);
    obj.edit469:setTransparent(true);
    obj.edit469:setField("outro_");
    obj.edit469.grid.role = "col";
    obj.edit469.grid.width = 1;
    obj.edit469:setHorzTextAlign("center");
    obj.edit469:setName("edit469");
    obj.edit469:setHeight(25);

    obj.button108 = GUI.fromHandle(_obj_newObject("button"));
    obj.button108:setParent(obj.layout220);
    obj.button108.grid.role = "col";
    obj.button108.grid.width = 1;
    obj.button108:setText("🎲");
    obj.button108:setName("button108");

    obj.horzLine127 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine127:setParent(obj.layout220);
    obj.horzLine127.grid.role = "row";
    obj.horzLine127:setName("horzLine127");
    obj.horzLine127:setStrokeColor("grey");

    obj.layout221 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout221:setParent(obj.scrollBox7);
    obj.layout221.grid.role = "row";
    obj.layout221.grid.width = 12;
    obj.layout221.grid["auto-height"] = true;
    obj.layout221:setName("layout221");

    obj.edit470 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit470:setParent(obj.layout221);
    obj.edit470:setTransparent(true);
    obj.edit470:setField("");
    obj.edit470.grid.role = "col";
    obj.edit470.grid.width = 4;
    obj.edit470:setHorzTextAlign("leading");
    obj.edit470:setName("edit470");
    obj.edit470:setHeight(25);

    obj.comboBox89 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox89:setParent(obj.layout221);
    obj.comboBox89:setTransparent(true);
    obj.comboBox89:setField("cha_");
    obj.comboBox89:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox89.grid.role = "col";
    obj.comboBox89.grid.width = 2;
    obj.comboBox89:setHorzTextAlign("center");
    obj.comboBox89:setName("comboBox89");
    obj.comboBox89:setHeight(25);

    obj.edit471 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit471:setParent(obj.layout221);
    obj.edit471:setTransparent(true);
    obj.edit471:setField("valAtr_");
    obj.edit471.grid.role = "col";
    obj.edit471.grid.width = 2;
    obj.edit471:setHorzTextAlign("center");
    obj.edit471:setName("edit471");
    obj.edit471:setHeight(25);

    obj.edit472 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit472:setParent(obj.layout221);
    obj.edit472:setTransparent(true);
    obj.edit472:setField("nivel_");
    obj.edit472.grid.role = "col";
    obj.edit472.grid.width = 2;
    obj.edit472:setHorzTextAlign("center");
    obj.edit472:setName("edit472");
    obj.edit472:setHeight(25);

    obj.edit473 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit473:setParent(obj.layout221);
    obj.edit473:setTransparent(true);
    obj.edit473:setField("outro_");
    obj.edit473.grid.role = "col";
    obj.edit473.grid.width = 1;
    obj.edit473:setHorzTextAlign("center");
    obj.edit473:setName("edit473");
    obj.edit473:setHeight(25);

    obj.button109 = GUI.fromHandle(_obj_newObject("button"));
    obj.button109:setParent(obj.layout221);
    obj.button109.grid.role = "col";
    obj.button109.grid.width = 1;
    obj.button109:setText("🎲");
    obj.button109:setName("button109");

    obj.horzLine128 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine128:setParent(obj.layout221);
    obj.horzLine128.grid.role = "row";
    obj.horzLine128:setName("horzLine128");
    obj.horzLine128:setStrokeColor("grey");

    obj.layout222 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout222:setParent(obj.scrollBox7);
    obj.layout222.grid.role = "row";
    obj.layout222.grid.width = 12;
    obj.layout222.grid["auto-height"] = true;
    obj.layout222:setName("layout222");

    obj.edit474 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit474:setParent(obj.layout222);
    obj.edit474:setTransparent(true);
    obj.edit474:setField("");
    obj.edit474.grid.role = "col";
    obj.edit474.grid.width = 4;
    obj.edit474:setHorzTextAlign("leading");
    obj.edit474:setName("edit474");
    obj.edit474:setHeight(25);

    obj.comboBox90 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox90:setParent(obj.layout222);
    obj.comboBox90:setTransparent(true);
    obj.comboBox90:setField("cha_");
    obj.comboBox90:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox90.grid.role = "col";
    obj.comboBox90.grid.width = 2;
    obj.comboBox90:setHorzTextAlign("center");
    obj.comboBox90:setName("comboBox90");
    obj.comboBox90:setHeight(25);

    obj.edit475 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit475:setParent(obj.layout222);
    obj.edit475:setTransparent(true);
    obj.edit475:setField("valAtr_");
    obj.edit475.grid.role = "col";
    obj.edit475.grid.width = 2;
    obj.edit475:setHorzTextAlign("center");
    obj.edit475:setName("edit475");
    obj.edit475:setHeight(25);

    obj.edit476 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit476:setParent(obj.layout222);
    obj.edit476:setTransparent(true);
    obj.edit476:setField("nivel_");
    obj.edit476.grid.role = "col";
    obj.edit476.grid.width = 2;
    obj.edit476:setHorzTextAlign("center");
    obj.edit476:setName("edit476");
    obj.edit476:setHeight(25);

    obj.edit477 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit477:setParent(obj.layout222);
    obj.edit477:setTransparent(true);
    obj.edit477:setField("outro_");
    obj.edit477.grid.role = "col";
    obj.edit477.grid.width = 1;
    obj.edit477:setHorzTextAlign("center");
    obj.edit477:setName("edit477");
    obj.edit477:setHeight(25);

    obj.button110 = GUI.fromHandle(_obj_newObject("button"));
    obj.button110:setParent(obj.layout222);
    obj.button110.grid.role = "col";
    obj.button110.grid.width = 1;
    obj.button110:setText("🎲");
    obj.button110:setName("button110");

    obj.horzLine129 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine129:setParent(obj.layout222);
    obj.horzLine129.grid.role = "row";
    obj.horzLine129:setName("horzLine129");
    obj.horzLine129:setStrokeColor("grey");

    obj.layout223 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout223:setParent(obj.scrollBox7);
    obj.layout223.grid.role = "row";
    obj.layout223.grid.width = 12;
    obj.layout223.grid["auto-height"] = true;
    obj.layout223:setName("layout223");

    obj.edit478 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit478:setParent(obj.layout223);
    obj.edit478:setTransparent(true);
    obj.edit478:setField("");
    obj.edit478.grid.role = "col";
    obj.edit478.grid.width = 4;
    obj.edit478:setHorzTextAlign("leading");
    obj.edit478:setName("edit478");
    obj.edit478:setHeight(25);

    obj.comboBox91 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox91:setParent(obj.layout223);
    obj.comboBox91:setTransparent(true);
    obj.comboBox91:setField("cha_");
    obj.comboBox91:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox91.grid.role = "col";
    obj.comboBox91.grid.width = 2;
    obj.comboBox91:setHorzTextAlign("center");
    obj.comboBox91:setName("comboBox91");
    obj.comboBox91:setHeight(25);

    obj.edit479 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit479:setParent(obj.layout223);
    obj.edit479:setTransparent(true);
    obj.edit479:setField("valAtr_");
    obj.edit479.grid.role = "col";
    obj.edit479.grid.width = 2;
    obj.edit479:setHorzTextAlign("center");
    obj.edit479:setName("edit479");
    obj.edit479:setHeight(25);

    obj.edit480 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit480:setParent(obj.layout223);
    obj.edit480:setTransparent(true);
    obj.edit480:setField("nivel_");
    obj.edit480.grid.role = "col";
    obj.edit480.grid.width = 2;
    obj.edit480:setHorzTextAlign("center");
    obj.edit480:setName("edit480");
    obj.edit480:setHeight(25);

    obj.edit481 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit481:setParent(obj.layout223);
    obj.edit481:setTransparent(true);
    obj.edit481:setField("outro_");
    obj.edit481.grid.role = "col";
    obj.edit481.grid.width = 1;
    obj.edit481:setHorzTextAlign("center");
    obj.edit481:setName("edit481");
    obj.edit481:setHeight(25);

    obj.button111 = GUI.fromHandle(_obj_newObject("button"));
    obj.button111:setParent(obj.layout223);
    obj.button111.grid.role = "col";
    obj.button111.grid.width = 1;
    obj.button111:setText("🎲");
    obj.button111:setName("button111");

    obj.horzLine130 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine130:setParent(obj.layout223);
    obj.horzLine130.grid.role = "row";
    obj.horzLine130:setName("horzLine130");
    obj.horzLine130:setStrokeColor("grey");

    obj.layout224 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout224:setParent(obj.scrollBox7);
    obj.layout224.grid.role = "row";
    obj.layout224.grid.width = 12;
    obj.layout224.grid["auto-height"] = true;
    obj.layout224:setName("layout224");

    obj.edit482 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit482:setParent(obj.layout224);
    obj.edit482:setTransparent(true);
    obj.edit482:setField("");
    obj.edit482.grid.role = "col";
    obj.edit482.grid.width = 4;
    obj.edit482:setHorzTextAlign("leading");
    obj.edit482:setName("edit482");
    obj.edit482:setHeight(25);

    obj.comboBox92 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox92:setParent(obj.layout224);
    obj.comboBox92:setTransparent(true);
    obj.comboBox92:setField("cha_");
    obj.comboBox92:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox92.grid.role = "col";
    obj.comboBox92.grid.width = 2;
    obj.comboBox92:setHorzTextAlign("center");
    obj.comboBox92:setName("comboBox92");
    obj.comboBox92:setHeight(25);

    obj.edit483 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit483:setParent(obj.layout224);
    obj.edit483:setTransparent(true);
    obj.edit483:setField("valAtr_");
    obj.edit483.grid.role = "col";
    obj.edit483.grid.width = 2;
    obj.edit483:setHorzTextAlign("center");
    obj.edit483:setName("edit483");
    obj.edit483:setHeight(25);

    obj.edit484 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit484:setParent(obj.layout224);
    obj.edit484:setTransparent(true);
    obj.edit484:setField("nivel_");
    obj.edit484.grid.role = "col";
    obj.edit484.grid.width = 2;
    obj.edit484:setHorzTextAlign("center");
    obj.edit484:setName("edit484");
    obj.edit484:setHeight(25);

    obj.edit485 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit485:setParent(obj.layout224);
    obj.edit485:setTransparent(true);
    obj.edit485:setField("outro_");
    obj.edit485.grid.role = "col";
    obj.edit485.grid.width = 1;
    obj.edit485:setHorzTextAlign("center");
    obj.edit485:setName("edit485");
    obj.edit485:setHeight(25);

    obj.button112 = GUI.fromHandle(_obj_newObject("button"));
    obj.button112:setParent(obj.layout224);
    obj.button112.grid.role = "col";
    obj.button112.grid.width = 1;
    obj.button112:setText("🎲");
    obj.button112:setName("button112");

    obj.horzLine131 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine131:setParent(obj.layout224);
    obj.horzLine131.grid.role = "row";
    obj.horzLine131:setName("horzLine131");
    obj.horzLine131:setStrokeColor("grey");

    obj.layout225 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout225:setParent(obj.scrollBox7);
    obj.layout225.grid.role = "row";
    obj.layout225.grid.width = 12;
    obj.layout225.grid["auto-height"] = true;
    obj.layout225:setName("layout225");

    obj.edit486 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit486:setParent(obj.layout225);
    obj.edit486:setTransparent(true);
    obj.edit486:setField("");
    obj.edit486.grid.role = "col";
    obj.edit486.grid.width = 4;
    obj.edit486:setHorzTextAlign("leading");
    obj.edit486:setName("edit486");
    obj.edit486:setHeight(25);

    obj.comboBox93 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox93:setParent(obj.layout225);
    obj.comboBox93:setTransparent(true);
    obj.comboBox93:setField("cha_");
    obj.comboBox93:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox93.grid.role = "col";
    obj.comboBox93.grid.width = 2;
    obj.comboBox93:setHorzTextAlign("center");
    obj.comboBox93:setName("comboBox93");
    obj.comboBox93:setHeight(25);

    obj.edit487 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit487:setParent(obj.layout225);
    obj.edit487:setTransparent(true);
    obj.edit487:setField("valAtr_");
    obj.edit487.grid.role = "col";
    obj.edit487.grid.width = 2;
    obj.edit487:setHorzTextAlign("center");
    obj.edit487:setName("edit487");
    obj.edit487:setHeight(25);

    obj.edit488 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit488:setParent(obj.layout225);
    obj.edit488:setTransparent(true);
    obj.edit488:setField("nivel_");
    obj.edit488.grid.role = "col";
    obj.edit488.grid.width = 2;
    obj.edit488:setHorzTextAlign("center");
    obj.edit488:setName("edit488");
    obj.edit488:setHeight(25);

    obj.edit489 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit489:setParent(obj.layout225);
    obj.edit489:setTransparent(true);
    obj.edit489:setField("outro_");
    obj.edit489.grid.role = "col";
    obj.edit489.grid.width = 1;
    obj.edit489:setHorzTextAlign("center");
    obj.edit489:setName("edit489");
    obj.edit489:setHeight(25);

    obj.button113 = GUI.fromHandle(_obj_newObject("button"));
    obj.button113:setParent(obj.layout225);
    obj.button113.grid.role = "col";
    obj.button113.grid.width = 1;
    obj.button113:setText("🎲");
    obj.button113:setName("button113");

    obj.horzLine132 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine132:setParent(obj.layout225);
    obj.horzLine132.grid.role = "row";
    obj.horzLine132:setName("horzLine132");
    obj.horzLine132:setStrokeColor("grey");

    obj.layout226 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout226:setParent(obj.scrollBox7);
    obj.layout226.grid.role = "row";
    obj.layout226.grid.width = 12;
    obj.layout226.grid["auto-height"] = true;
    obj.layout226:setName("layout226");

    obj.edit490 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit490:setParent(obj.layout226);
    obj.edit490:setTransparent(true);
    obj.edit490:setField("");
    obj.edit490.grid.role = "col";
    obj.edit490.grid.width = 4;
    obj.edit490:setHorzTextAlign("leading");
    obj.edit490:setName("edit490");
    obj.edit490:setHeight(25);

    obj.comboBox94 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox94:setParent(obj.layout226);
    obj.comboBox94:setTransparent(true);
    obj.comboBox94:setField("cha_");
    obj.comboBox94:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox94.grid.role = "col";
    obj.comboBox94.grid.width = 2;
    obj.comboBox94:setHorzTextAlign("center");
    obj.comboBox94:setName("comboBox94");
    obj.comboBox94:setHeight(25);

    obj.edit491 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit491:setParent(obj.layout226);
    obj.edit491:setTransparent(true);
    obj.edit491:setField("valAtr_");
    obj.edit491.grid.role = "col";
    obj.edit491.grid.width = 2;
    obj.edit491:setHorzTextAlign("center");
    obj.edit491:setName("edit491");
    obj.edit491:setHeight(25);

    obj.edit492 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit492:setParent(obj.layout226);
    obj.edit492:setTransparent(true);
    obj.edit492:setField("nivel_");
    obj.edit492.grid.role = "col";
    obj.edit492.grid.width = 2;
    obj.edit492:setHorzTextAlign("center");
    obj.edit492:setName("edit492");
    obj.edit492:setHeight(25);

    obj.edit493 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit493:setParent(obj.layout226);
    obj.edit493:setTransparent(true);
    obj.edit493:setField("outro_");
    obj.edit493.grid.role = "col";
    obj.edit493.grid.width = 1;
    obj.edit493:setHorzTextAlign("center");
    obj.edit493:setName("edit493");
    obj.edit493:setHeight(25);

    obj.button114 = GUI.fromHandle(_obj_newObject("button"));
    obj.button114:setParent(obj.layout226);
    obj.button114.grid.role = "col";
    obj.button114.grid.width = 1;
    obj.button114:setText("🎲");
    obj.button114:setName("button114");

    obj.horzLine133 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine133:setParent(obj.layout226);
    obj.horzLine133.grid.role = "row";
    obj.horzLine133:setName("horzLine133");
    obj.horzLine133:setStrokeColor("grey");

    obj.layout227 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout227:setParent(obj.scrollBox7);
    obj.layout227.grid.role = "row";
    obj.layout227.grid.width = 12;
    obj.layout227.grid["auto-height"] = true;
    obj.layout227:setName("layout227");

    obj.edit494 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit494:setParent(obj.layout227);
    obj.edit494:setTransparent(true);
    obj.edit494:setField("");
    obj.edit494.grid.role = "col";
    obj.edit494.grid.width = 4;
    obj.edit494:setHorzTextAlign("leading");
    obj.edit494:setName("edit494");
    obj.edit494:setHeight(25);

    obj.comboBox95 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox95:setParent(obj.layout227);
    obj.comboBox95:setTransparent(true);
    obj.comboBox95:setField("cha_");
    obj.comboBox95:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox95.grid.role = "col";
    obj.comboBox95.grid.width = 2;
    obj.comboBox95:setHorzTextAlign("center");
    obj.comboBox95:setName("comboBox95");
    obj.comboBox95:setHeight(25);

    obj.edit495 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit495:setParent(obj.layout227);
    obj.edit495:setTransparent(true);
    obj.edit495:setField("valAtr_");
    obj.edit495.grid.role = "col";
    obj.edit495.grid.width = 2;
    obj.edit495:setHorzTextAlign("center");
    obj.edit495:setName("edit495");
    obj.edit495:setHeight(25);

    obj.edit496 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit496:setParent(obj.layout227);
    obj.edit496:setTransparent(true);
    obj.edit496:setField("nivel_");
    obj.edit496.grid.role = "col";
    obj.edit496.grid.width = 2;
    obj.edit496:setHorzTextAlign("center");
    obj.edit496:setName("edit496");
    obj.edit496:setHeight(25);

    obj.edit497 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit497:setParent(obj.layout227);
    obj.edit497:setTransparent(true);
    obj.edit497:setField("outro_");
    obj.edit497.grid.role = "col";
    obj.edit497.grid.width = 1;
    obj.edit497:setHorzTextAlign("center");
    obj.edit497:setName("edit497");
    obj.edit497:setHeight(25);

    obj.button115 = GUI.fromHandle(_obj_newObject("button"));
    obj.button115:setParent(obj.layout227);
    obj.button115.grid.role = "col";
    obj.button115.grid.width = 1;
    obj.button115:setText("🎲");
    obj.button115:setName("button115");

    obj.horzLine134 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine134:setParent(obj.layout227);
    obj.horzLine134.grid.role = "row";
    obj.horzLine134:setName("horzLine134");
    obj.horzLine134:setStrokeColor("grey");

    obj.layout228 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout228:setParent(obj.scrollBox7);
    obj.layout228.grid.role = "row";
    obj.layout228.grid.width = 12;
    obj.layout228.grid["auto-height"] = true;
    obj.layout228:setName("layout228");

    obj.edit498 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit498:setParent(obj.layout228);
    obj.edit498:setTransparent(true);
    obj.edit498:setField("");
    obj.edit498.grid.role = "col";
    obj.edit498.grid.width = 4;
    obj.edit498:setHorzTextAlign("leading");
    obj.edit498:setName("edit498");
    obj.edit498:setHeight(25);

    obj.comboBox96 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox96:setParent(obj.layout228);
    obj.comboBox96:setTransparent(true);
    obj.comboBox96:setField("cha_");
    obj.comboBox96:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox96.grid.role = "col";
    obj.comboBox96.grid.width = 2;
    obj.comboBox96:setHorzTextAlign("center");
    obj.comboBox96:setName("comboBox96");
    obj.comboBox96:setHeight(25);

    obj.edit499 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit499:setParent(obj.layout228);
    obj.edit499:setTransparent(true);
    obj.edit499:setField("valAtr_");
    obj.edit499.grid.role = "col";
    obj.edit499.grid.width = 2;
    obj.edit499:setHorzTextAlign("center");
    obj.edit499:setName("edit499");
    obj.edit499:setHeight(25);

    obj.edit500 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit500:setParent(obj.layout228);
    obj.edit500:setTransparent(true);
    obj.edit500:setField("nivel_");
    obj.edit500.grid.role = "col";
    obj.edit500.grid.width = 2;
    obj.edit500:setHorzTextAlign("center");
    obj.edit500:setName("edit500");
    obj.edit500:setHeight(25);

    obj.edit501 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit501:setParent(obj.layout228);
    obj.edit501:setTransparent(true);
    obj.edit501:setField("outro_");
    obj.edit501.grid.role = "col";
    obj.edit501.grid.width = 1;
    obj.edit501:setHorzTextAlign("center");
    obj.edit501:setName("edit501");
    obj.edit501:setHeight(25);

    obj.button116 = GUI.fromHandle(_obj_newObject("button"));
    obj.button116:setParent(obj.layout228);
    obj.button116.grid.role = "col";
    obj.button116.grid.width = 1;
    obj.button116:setText("🎲");
    obj.button116:setName("button116");

    obj.horzLine135 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine135:setParent(obj.layout228);
    obj.horzLine135.grid.role = "row";
    obj.horzLine135:setName("horzLine135");
    obj.horzLine135:setStrokeColor("grey");

    obj.layout229 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout229:setParent(obj.scrollBox7);
    obj.layout229.grid.role = "row";
    obj.layout229.grid.width = 12;
    obj.layout229.grid["auto-height"] = true;
    obj.layout229:setName("layout229");

    obj.edit502 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit502:setParent(obj.layout229);
    obj.edit502:setTransparent(true);
    obj.edit502:setField("");
    obj.edit502.grid.role = "col";
    obj.edit502.grid.width = 4;
    obj.edit502:setHorzTextAlign("leading");
    obj.edit502:setName("edit502");
    obj.edit502:setHeight(25);

    obj.comboBox97 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox97:setParent(obj.layout229);
    obj.comboBox97:setTransparent(true);
    obj.comboBox97:setField("cha_");
    obj.comboBox97:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox97.grid.role = "col";
    obj.comboBox97.grid.width = 2;
    obj.comboBox97:setHorzTextAlign("center");
    obj.comboBox97:setName("comboBox97");
    obj.comboBox97:setHeight(25);

    obj.edit503 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit503:setParent(obj.layout229);
    obj.edit503:setTransparent(true);
    obj.edit503:setField("valAtr_");
    obj.edit503.grid.role = "col";
    obj.edit503.grid.width = 2;
    obj.edit503:setHorzTextAlign("center");
    obj.edit503:setName("edit503");
    obj.edit503:setHeight(25);

    obj.edit504 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit504:setParent(obj.layout229);
    obj.edit504:setTransparent(true);
    obj.edit504:setField("nivel_");
    obj.edit504.grid.role = "col";
    obj.edit504.grid.width = 2;
    obj.edit504:setHorzTextAlign("center");
    obj.edit504:setName("edit504");
    obj.edit504:setHeight(25);

    obj.edit505 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit505:setParent(obj.layout229);
    obj.edit505:setTransparent(true);
    obj.edit505:setField("outro_");
    obj.edit505.grid.role = "col";
    obj.edit505.grid.width = 1;
    obj.edit505:setHorzTextAlign("center");
    obj.edit505:setName("edit505");
    obj.edit505:setHeight(25);

    obj.button117 = GUI.fromHandle(_obj_newObject("button"));
    obj.button117:setParent(obj.layout229);
    obj.button117.grid.role = "col";
    obj.button117.grid.width = 1;
    obj.button117:setText("🎲");
    obj.button117:setName("button117");

    obj.horzLine136 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine136:setParent(obj.layout229);
    obj.horzLine136.grid.role = "row";
    obj.horzLine136:setName("horzLine136");
    obj.horzLine136:setStrokeColor("grey");

    obj.layout230 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout230:setParent(obj.scrollBox7);
    obj.layout230.grid.role = "row";
    obj.layout230.grid.width = 12;
    obj.layout230.grid["auto-height"] = true;
    obj.layout230:setName("layout230");

    obj.edit506 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit506:setParent(obj.layout230);
    obj.edit506:setTransparent(true);
    obj.edit506:setField("");
    obj.edit506.grid.role = "col";
    obj.edit506.grid.width = 4;
    obj.edit506:setHorzTextAlign("leading");
    obj.edit506:setName("edit506");
    obj.edit506:setHeight(25);

    obj.comboBox98 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox98:setParent(obj.layout230);
    obj.comboBox98:setTransparent(true);
    obj.comboBox98:setField("cha_");
    obj.comboBox98:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox98.grid.role = "col";
    obj.comboBox98.grid.width = 2;
    obj.comboBox98:setHorzTextAlign("center");
    obj.comboBox98:setName("comboBox98");
    obj.comboBox98:setHeight(25);

    obj.edit507 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit507:setParent(obj.layout230);
    obj.edit507:setTransparent(true);
    obj.edit507:setField("valAtr_");
    obj.edit507.grid.role = "col";
    obj.edit507.grid.width = 2;
    obj.edit507:setHorzTextAlign("center");
    obj.edit507:setName("edit507");
    obj.edit507:setHeight(25);

    obj.edit508 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit508:setParent(obj.layout230);
    obj.edit508:setTransparent(true);
    obj.edit508:setField("nivel_");
    obj.edit508.grid.role = "col";
    obj.edit508.grid.width = 2;
    obj.edit508:setHorzTextAlign("center");
    obj.edit508:setName("edit508");
    obj.edit508:setHeight(25);

    obj.edit509 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit509:setParent(obj.layout230);
    obj.edit509:setTransparent(true);
    obj.edit509:setField("outro_");
    obj.edit509.grid.role = "col";
    obj.edit509.grid.width = 1;
    obj.edit509:setHorzTextAlign("center");
    obj.edit509:setName("edit509");
    obj.edit509:setHeight(25);

    obj.button118 = GUI.fromHandle(_obj_newObject("button"));
    obj.button118:setParent(obj.layout230);
    obj.button118.grid.role = "col";
    obj.button118.grid.width = 1;
    obj.button118:setText("🎲");
    obj.button118:setName("button118");

    obj.horzLine137 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine137:setParent(obj.layout230);
    obj.horzLine137.grid.role = "row";
    obj.horzLine137:setName("horzLine137");
    obj.horzLine137:setStrokeColor("grey");

    obj.layout231 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout231:setParent(obj.scrollBox7);
    obj.layout231.grid.role = "row";
    obj.layout231.grid.width = 12;
    obj.layout231.grid["auto-height"] = true;
    obj.layout231:setName("layout231");

    obj.edit510 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit510:setParent(obj.layout231);
    obj.edit510:setTransparent(true);
    obj.edit510:setField("");
    obj.edit510.grid.role = "col";
    obj.edit510.grid.width = 4;
    obj.edit510:setHorzTextAlign("leading");
    obj.edit510:setName("edit510");
    obj.edit510:setHeight(25);

    obj.comboBox99 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox99:setParent(obj.layout231);
    obj.comboBox99:setTransparent(true);
    obj.comboBox99:setField("cha_");
    obj.comboBox99:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox99.grid.role = "col";
    obj.comboBox99.grid.width = 2;
    obj.comboBox99:setHorzTextAlign("center");
    obj.comboBox99:setName("comboBox99");
    obj.comboBox99:setHeight(25);

    obj.edit511 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit511:setParent(obj.layout231);
    obj.edit511:setTransparent(true);
    obj.edit511:setField("valAtr_");
    obj.edit511.grid.role = "col";
    obj.edit511.grid.width = 2;
    obj.edit511:setHorzTextAlign("center");
    obj.edit511:setName("edit511");
    obj.edit511:setHeight(25);

    obj.edit512 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit512:setParent(obj.layout231);
    obj.edit512:setTransparent(true);
    obj.edit512:setField("nivel_");
    obj.edit512.grid.role = "col";
    obj.edit512.grid.width = 2;
    obj.edit512:setHorzTextAlign("center");
    obj.edit512:setName("edit512");
    obj.edit512:setHeight(25);

    obj.edit513 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit513:setParent(obj.layout231);
    obj.edit513:setTransparent(true);
    obj.edit513:setField("outro_");
    obj.edit513.grid.role = "col";
    obj.edit513.grid.width = 1;
    obj.edit513:setHorzTextAlign("center");
    obj.edit513:setName("edit513");
    obj.edit513:setHeight(25);

    obj.button119 = GUI.fromHandle(_obj_newObject("button"));
    obj.button119:setParent(obj.layout231);
    obj.button119.grid.role = "col";
    obj.button119.grid.width = 1;
    obj.button119:setText("🎲");
    obj.button119:setName("button119");

    obj.horzLine138 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine138:setParent(obj.layout231);
    obj.horzLine138.grid.role = "row";
    obj.horzLine138:setName("horzLine138");
    obj.horzLine138:setStrokeColor("grey");

    obj.layout232 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout232:setParent(obj.scrollBox7);
    obj.layout232.grid.role = "row";
    obj.layout232.grid.width = 12;
    obj.layout232.grid["auto-height"] = true;
    obj.layout232:setName("layout232");

    obj.edit514 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit514:setParent(obj.layout232);
    obj.edit514:setTransparent(true);
    obj.edit514:setField("");
    obj.edit514.grid.role = "col";
    obj.edit514.grid.width = 4;
    obj.edit514:setHorzTextAlign("leading");
    obj.edit514:setName("edit514");
    obj.edit514:setHeight(25);

    obj.comboBox100 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox100:setParent(obj.layout232);
    obj.comboBox100:setTransparent(true);
    obj.comboBox100:setField("cha_");
    obj.comboBox100:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox100.grid.role = "col";
    obj.comboBox100.grid.width = 2;
    obj.comboBox100:setHorzTextAlign("center");
    obj.comboBox100:setName("comboBox100");
    obj.comboBox100:setHeight(25);

    obj.edit515 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit515:setParent(obj.layout232);
    obj.edit515:setTransparent(true);
    obj.edit515:setField("valAtr_");
    obj.edit515.grid.role = "col";
    obj.edit515.grid.width = 2;
    obj.edit515:setHorzTextAlign("center");
    obj.edit515:setName("edit515");
    obj.edit515:setHeight(25);

    obj.edit516 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit516:setParent(obj.layout232);
    obj.edit516:setTransparent(true);
    obj.edit516:setField("nivel_");
    obj.edit516.grid.role = "col";
    obj.edit516.grid.width = 2;
    obj.edit516:setHorzTextAlign("center");
    obj.edit516:setName("edit516");
    obj.edit516:setHeight(25);

    obj.edit517 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit517:setParent(obj.layout232);
    obj.edit517:setTransparent(true);
    obj.edit517:setField("outro_");
    obj.edit517.grid.role = "col";
    obj.edit517.grid.width = 1;
    obj.edit517:setHorzTextAlign("center");
    obj.edit517:setName("edit517");
    obj.edit517:setHeight(25);

    obj.button120 = GUI.fromHandle(_obj_newObject("button"));
    obj.button120:setParent(obj.layout232);
    obj.button120.grid.role = "col";
    obj.button120.grid.width = 1;
    obj.button120:setText("🎲");
    obj.button120:setName("button120");

    obj.horzLine139 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine139:setParent(obj.layout232);
    obj.horzLine139.grid.role = "row";
    obj.horzLine139:setName("horzLine139");
    obj.horzLine139:setStrokeColor("grey");

    obj.layout233 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout233:setParent(obj.scrollBox7);
    obj.layout233.grid.role = "row";
    obj.layout233.grid.width = 12;
    obj.layout233.grid["auto-height"] = true;
    obj.layout233:setName("layout233");

    obj.edit518 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit518:setParent(obj.layout233);
    obj.edit518:setTransparent(true);
    obj.edit518:setField("");
    obj.edit518.grid.role = "col";
    obj.edit518.grid.width = 4;
    obj.edit518:setHorzTextAlign("leading");
    obj.edit518:setName("edit518");
    obj.edit518:setHeight(25);

    obj.comboBox101 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox101:setParent(obj.layout233);
    obj.comboBox101:setTransparent(true);
    obj.comboBox101:setField("cha_");
    obj.comboBox101:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox101.grid.role = "col";
    obj.comboBox101.grid.width = 2;
    obj.comboBox101:setHorzTextAlign("center");
    obj.comboBox101:setName("comboBox101");
    obj.comboBox101:setHeight(25);

    obj.edit519 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit519:setParent(obj.layout233);
    obj.edit519:setTransparent(true);
    obj.edit519:setField("valAtr_");
    obj.edit519.grid.role = "col";
    obj.edit519.grid.width = 2;
    obj.edit519:setHorzTextAlign("center");
    obj.edit519:setName("edit519");
    obj.edit519:setHeight(25);

    obj.edit520 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit520:setParent(obj.layout233);
    obj.edit520:setTransparent(true);
    obj.edit520:setField("nivel_");
    obj.edit520.grid.role = "col";
    obj.edit520.grid.width = 2;
    obj.edit520:setHorzTextAlign("center");
    obj.edit520:setName("edit520");
    obj.edit520:setHeight(25);

    obj.edit521 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit521:setParent(obj.layout233);
    obj.edit521:setTransparent(true);
    obj.edit521:setField("outro_");
    obj.edit521.grid.role = "col";
    obj.edit521.grid.width = 1;
    obj.edit521:setHorzTextAlign("center");
    obj.edit521:setName("edit521");
    obj.edit521:setHeight(25);

    obj.button121 = GUI.fromHandle(_obj_newObject("button"));
    obj.button121:setParent(obj.layout233);
    obj.button121.grid.role = "col";
    obj.button121.grid.width = 1;
    obj.button121:setText("🎲");
    obj.button121:setName("button121");

    obj.horzLine140 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine140:setParent(obj.layout233);
    obj.horzLine140.grid.role = "row";
    obj.horzLine140:setName("horzLine140");
    obj.horzLine140:setStrokeColor("grey");

    obj.layout234 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout234:setParent(obj.scrollBox7);
    obj.layout234.grid.role = "row";
    obj.layout234.grid.width = 12;
    obj.layout234.grid["auto-height"] = true;
    obj.layout234:setName("layout234");

    obj.edit522 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit522:setParent(obj.layout234);
    obj.edit522:setTransparent(true);
    obj.edit522:setField("");
    obj.edit522.grid.role = "col";
    obj.edit522.grid.width = 4;
    obj.edit522:setHorzTextAlign("leading");
    obj.edit522:setName("edit522");
    obj.edit522:setHeight(25);

    obj.comboBox102 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox102:setParent(obj.layout234);
    obj.comboBox102:setTransparent(true);
    obj.comboBox102:setField("cha_");
    obj.comboBox102:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox102.grid.role = "col";
    obj.comboBox102.grid.width = 2;
    obj.comboBox102:setHorzTextAlign("center");
    obj.comboBox102:setName("comboBox102");
    obj.comboBox102:setHeight(25);

    obj.edit523 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit523:setParent(obj.layout234);
    obj.edit523:setTransparent(true);
    obj.edit523:setField("valAtr_");
    obj.edit523.grid.role = "col";
    obj.edit523.grid.width = 2;
    obj.edit523:setHorzTextAlign("center");
    obj.edit523:setName("edit523");
    obj.edit523:setHeight(25);

    obj.edit524 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit524:setParent(obj.layout234);
    obj.edit524:setTransparent(true);
    obj.edit524:setField("nivel_");
    obj.edit524.grid.role = "col";
    obj.edit524.grid.width = 2;
    obj.edit524:setHorzTextAlign("center");
    obj.edit524:setName("edit524");
    obj.edit524:setHeight(25);

    obj.edit525 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit525:setParent(obj.layout234);
    obj.edit525:setTransparent(true);
    obj.edit525:setField("outro_");
    obj.edit525.grid.role = "col";
    obj.edit525.grid.width = 1;
    obj.edit525:setHorzTextAlign("center");
    obj.edit525:setName("edit525");
    obj.edit525:setHeight(25);

    obj.button122 = GUI.fromHandle(_obj_newObject("button"));
    obj.button122:setParent(obj.layout234);
    obj.button122.grid.role = "col";
    obj.button122.grid.width = 1;
    obj.button122:setText("🎲");
    obj.button122:setName("button122");

    obj.horzLine141 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine141:setParent(obj.layout234);
    obj.horzLine141.grid.role = "row";
    obj.horzLine141:setName("horzLine141");
    obj.horzLine141:setStrokeColor("grey");

    obj.layout235 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout235:setParent(obj.scrollBox7);
    obj.layout235.grid.role = "row";
    obj.layout235.grid.width = 12;
    obj.layout235.grid["auto-height"] = true;
    obj.layout235:setName("layout235");

    obj.edit526 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit526:setParent(obj.layout235);
    obj.edit526:setTransparent(true);
    obj.edit526:setField("");
    obj.edit526.grid.role = "col";
    obj.edit526.grid.width = 4;
    obj.edit526:setHorzTextAlign("leading");
    obj.edit526:setName("edit526");
    obj.edit526:setHeight(25);

    obj.comboBox103 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox103:setParent(obj.layout235);
    obj.comboBox103:setTransparent(true);
    obj.comboBox103:setField("cha_");
    obj.comboBox103:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox103.grid.role = "col";
    obj.comboBox103.grid.width = 2;
    obj.comboBox103:setHorzTextAlign("center");
    obj.comboBox103:setName("comboBox103");
    obj.comboBox103:setHeight(25);

    obj.edit527 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit527:setParent(obj.layout235);
    obj.edit527:setTransparent(true);
    obj.edit527:setField("valAtr_");
    obj.edit527.grid.role = "col";
    obj.edit527.grid.width = 2;
    obj.edit527:setHorzTextAlign("center");
    obj.edit527:setName("edit527");
    obj.edit527:setHeight(25);

    obj.edit528 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit528:setParent(obj.layout235);
    obj.edit528:setTransparent(true);
    obj.edit528:setField("nivel_");
    obj.edit528.grid.role = "col";
    obj.edit528.grid.width = 2;
    obj.edit528:setHorzTextAlign("center");
    obj.edit528:setName("edit528");
    obj.edit528:setHeight(25);

    obj.edit529 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit529:setParent(obj.layout235);
    obj.edit529:setTransparent(true);
    obj.edit529:setField("outro_");
    obj.edit529.grid.role = "col";
    obj.edit529.grid.width = 1;
    obj.edit529:setHorzTextAlign("center");
    obj.edit529:setName("edit529");
    obj.edit529:setHeight(25);

    obj.button123 = GUI.fromHandle(_obj_newObject("button"));
    obj.button123:setParent(obj.layout235);
    obj.button123.grid.role = "col";
    obj.button123.grid.width = 1;
    obj.button123:setText("🎲");
    obj.button123:setName("button123");

    obj.horzLine142 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine142:setParent(obj.layout235);
    obj.horzLine142.grid.role = "row";
    obj.horzLine142:setName("horzLine142");
    obj.horzLine142:setStrokeColor("grey");

    obj.layout236 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout236:setParent(obj.scrollBox7);
    obj.layout236.grid.role = "row";
    obj.layout236.grid.width = 12;
    obj.layout236.grid["auto-height"] = true;
    obj.layout236:setName("layout236");

    obj.edit530 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit530:setParent(obj.layout236);
    obj.edit530:setTransparent(true);
    obj.edit530:setField("");
    obj.edit530.grid.role = "col";
    obj.edit530.grid.width = 4;
    obj.edit530:setHorzTextAlign("leading");
    obj.edit530:setName("edit530");
    obj.edit530:setHeight(25);

    obj.comboBox104 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox104:setParent(obj.layout236);
    obj.comboBox104:setTransparent(true);
    obj.comboBox104:setField("cha_");
    obj.comboBox104:setItems({"FIS", "VEL", "FOR", "AGI", "DES", "MAE", "INT", "ARC", "PER"});
    obj.comboBox104.grid.role = "col";
    obj.comboBox104.grid.width = 2;
    obj.comboBox104:setHorzTextAlign("center");
    obj.comboBox104:setName("comboBox104");
    obj.comboBox104:setHeight(25);

    obj.edit531 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit531:setParent(obj.layout236);
    obj.edit531:setTransparent(true);
    obj.edit531:setField("valAtr_");
    obj.edit531.grid.role = "col";
    obj.edit531.grid.width = 2;
    obj.edit531:setHorzTextAlign("center");
    obj.edit531:setName("edit531");
    obj.edit531:setHeight(25);

    obj.edit532 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit532:setParent(obj.layout236);
    obj.edit532:setTransparent(true);
    obj.edit532:setField("nivel_");
    obj.edit532.grid.role = "col";
    obj.edit532.grid.width = 2;
    obj.edit532:setHorzTextAlign("center");
    obj.edit532:setName("edit532");
    obj.edit532:setHeight(25);

    obj.edit533 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit533:setParent(obj.layout236);
    obj.edit533:setTransparent(true);
    obj.edit533:setField("outro_");
    obj.edit533.grid.role = "col";
    obj.edit533.grid.width = 1;
    obj.edit533:setHorzTextAlign("center");
    obj.edit533:setName("edit533");
    obj.edit533:setHeight(25);

    obj.button124 = GUI.fromHandle(_obj_newObject("button"));
    obj.button124:setParent(obj.layout236);
    obj.button124.grid.role = "col";
    obj.button124.grid.width = 1;
    obj.button124:setText("🎲");
    obj.button124:setName("button124");

    obj.horzLine143 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine143:setParent(obj.layout236);
    obj.horzLine143.grid.role = "row";
    obj.horzLine143:setName("horzLine143");
    obj.horzLine143:setStrokeColor("grey");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Gigante-a-Vapor");
    obj.tab4:setName("tab4");

    obj.GiganteAVapor = GUI.fromHandle(_obj_newObject("form"));
    obj.GiganteAVapor:setParent(obj.tab4);
    obj.GiganteAVapor:setName("GiganteAVapor");
    obj.GiganteAVapor:setAlign("client");
    obj.GiganteAVapor:setTheme("dark");
    obj.GiganteAVapor.grid["padding-top"] = 8;
    obj.GiganteAVapor.grid["cnt-line-spacing"] = 4;

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.GiganteAVapor);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.layout237 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout237:setParent(obj.scrollBox8);
    obj.layout237.grid.role = "col";
    obj.layout237.grid.width = 12;
    obj.layout237.grid["horz-align"] = "center";
    obj.layout237.grid["cnt-gutter"] = 10;
    obj.layout237.grid["min-height"] = 800;
    obj.layout237.grid["padding-top"] = 30;
    obj.layout237:setName("layout237");

    obj.layout238 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout238:setParent(obj.layout237);
    obj.layout238.grid.role = "col";
    obj.layout238.grid.width = 3;
    obj.layout238.grid["auto-height"] = true;
    obj.layout238.grid["cnt-horz-align"] = "center";
    obj.layout238:setName("layout238");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout238);
    obj.rectangle90.grid.role = "col";
    obj.rectangle90.grid.width = 12;
    obj.rectangle90.grid["min-height"] = 100;
    obj.rectangle90.grid["auto-height"] = true;
    obj.rectangle90.grid["padding-bottom"] = 50;
    obj.rectangle90:setName("rectangle90");
    lfm_setPropAsString(obj.rectangle90, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle90:setCornerType("round");
    obj.rectangle90:setXradius(15);
    obj.rectangle90:setYradius(15);
    obj.rectangle90:setStrokeColor("#343434");
    obj.rectangle90:setStrokeSize(2);
    obj.rectangle90:setColor("#1f1e1e");
    obj.rectangle90.grid["padding-top"] = 5;
    obj.rectangle90.grid["padding-left"] = 8;
    obj.rectangle90.grid["padding-right"] = 8;

    obj.layout239 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout239:setParent(obj.rectangle90);
    obj.layout239.grid.role = "col";
    obj.layout239.grid.width = 12;
    obj.layout239:setName("layout239");

    obj.edit534 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit534:setParent(obj.layout239);
    obj.edit534:setField("info_NOME DO GIGANTE");
    obj.edit534.grid.role = "col";
    obj.edit534.grid.width = 12;
    obj.edit534:setTransparent(true);
    obj.edit534:setName("edit534");
    obj.edit534:setHeight(25);

    obj.horzLine144 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine144:setParent(obj.layout239);
    obj.horzLine144:setStrokeColor("gray");
    obj.horzLine144.grid.role = "col";
    obj.horzLine144.grid.width = 12;
    obj.horzLine144:setName("horzLine144");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout239);
    obj.label127:setText("NOME DO GIGANTE");
    obj.label127.grid.role = "col";
    obj.label127.grid.width = 12;
    obj.label127:setHorzTextAlign("leading");
    obj.label127:setName("label127");
    obj.label127:setFontColor("#b5b5b5");
    obj.label127:setHeight(25);

    obj.layout240 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout240:setParent(obj.rectangle90);
    obj.layout240.grid.role = "col";
    obj.layout240.grid.width = 6;
    obj.layout240:setName("layout240");

    obj.edit535 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit535:setParent(obj.layout240);
    obj.edit535:setField("info_CHASSI");
    obj.edit535.grid.role = "col";
    obj.edit535.grid.width = 12;
    obj.edit535:setTransparent(true);
    obj.edit535:setName("edit535");
    obj.edit535:setHeight(25);

    obj.horzLine145 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine145:setParent(obj.layout240);
    obj.horzLine145:setStrokeColor("gray");
    obj.horzLine145.grid.role = "col";
    obj.horzLine145.grid.width = 12;
    obj.horzLine145:setName("horzLine145");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout240);
    obj.label128:setText("CHASSI");
    obj.label128.grid.role = "col";
    obj.label128.grid.width = 12;
    obj.label128:setHorzTextAlign("leading");
    obj.label128:setName("label128");
    obj.label128:setFontColor("#b5b5b5");
    obj.label128:setHeight(25);

    obj.layout241 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout241:setParent(obj.rectangle90);
    obj.layout241.grid.role = "col";
    obj.layout241.grid.width = 6;
    obj.layout241:setName("layout241");

    obj.edit536 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit536:setParent(obj.layout241);
    obj.edit536:setField("info_CLASSE DO CHASSI");
    obj.edit536.grid.role = "col";
    obj.edit536.grid.width = 12;
    obj.edit536:setTransparent(true);
    obj.edit536:setName("edit536");
    obj.edit536:setHeight(25);

    obj.horzLine146 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine146:setParent(obj.layout241);
    obj.horzLine146:setStrokeColor("gray");
    obj.horzLine146.grid.role = "col";
    obj.horzLine146.grid.width = 12;
    obj.horzLine146:setName("horzLine146");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout241);
    obj.label129:setText("CLASSE DO CHASSI");
    obj.label129.grid.role = "col";
    obj.label129.grid.width = 12;
    obj.label129:setHorzTextAlign("leading");
    obj.label129:setName("label129");
    obj.label129:setFontColor("#b5b5b5");
    obj.label129:setHeight(25);

    obj.layout242 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout242:setParent(obj.rectangle90);
    obj.layout242.grid.role = "col";
    obj.layout242.grid.width = 3;
    obj.layout242:setName("layout242");

    obj.edit537 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit537:setParent(obj.layout242);
    obj.edit537:setField("info_ALTURA");
    obj.edit537.grid.role = "col";
    obj.edit537.grid.width = 12;
    obj.edit537:setTransparent(true);
    obj.edit537:setName("edit537");
    obj.edit537:setHeight(25);

    obj.horzLine147 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine147:setParent(obj.layout242);
    obj.horzLine147:setStrokeColor("gray");
    obj.horzLine147.grid.role = "col";
    obj.horzLine147.grid.width = 12;
    obj.horzLine147:setName("horzLine147");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout242);
    obj.label130:setText("ALTURA");
    obj.label130.grid.role = "col";
    obj.label130.grid.width = 12;
    obj.label130:setHorzTextAlign("leading");
    obj.label130:setName("label130");
    obj.label130:setFontColor("#b5b5b5");
    obj.label130:setHeight(25);

    obj.layout243 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout243:setParent(obj.rectangle90);
    obj.layout243.grid.role = "col";
    obj.layout243.grid.width = 3;
    obj.layout243:setName("layout243");

    obj.edit538 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit538:setParent(obj.layout243);
    obj.edit538:setField("info_PESO");
    obj.edit538.grid.role = "col";
    obj.edit538.grid.width = 12;
    obj.edit538:setTransparent(true);
    obj.edit538:setName("edit538");
    obj.edit538:setHeight(25);

    obj.horzLine148 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine148:setParent(obj.layout243);
    obj.horzLine148:setStrokeColor("gray");
    obj.horzLine148.grid.role = "col";
    obj.horzLine148.grid.width = 12;
    obj.horzLine148:setName("horzLine148");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout243);
    obj.label131:setText("PESO");
    obj.label131.grid.role = "col";
    obj.label131.grid.width = 12;
    obj.label131:setHorzTextAlign("leading");
    obj.label131:setName("label131");
    obj.label131:setFontColor("#b5b5b5");
    obj.label131:setHeight(25);

    obj.layout244 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout244:setParent(obj.rectangle90);
    obj.layout244.grid.role = "col";
    obj.layout244.grid.width = 3;
    obj.layout244:setName("layout244");

    obj.edit539 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit539:setParent(obj.layout244);
    obj.edit539:setField("info_MAX.COMB");
    obj.edit539.grid.role = "col";
    obj.edit539.grid.width = 12;
    obj.edit539:setTransparent(true);
    obj.edit539:setName("edit539");
    obj.edit539:setHeight(25);

    obj.horzLine149 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine149:setParent(obj.layout244);
    obj.horzLine149:setStrokeColor("gray");
    obj.horzLine149.grid.role = "col";
    obj.horzLine149.grid.width = 12;
    obj.horzLine149:setName("horzLine149");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout244);
    obj.label132:setText("MAX.COMB");
    obj.label132.grid.role = "col";
    obj.label132.grid.width = 12;
    obj.label132:setHorzTextAlign("leading");
    obj.label132:setName("label132");
    obj.label132:setFontColor("#b5b5b5");
    obj.label132:setHeight(25);

    obj.layout245 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout245:setParent(obj.rectangle90);
    obj.layout245.grid.role = "col";
    obj.layout245.grid.width = 3;
    obj.layout245:setName("layout245");

    obj.edit540 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit540:setParent(obj.layout245);
    obj.edit540:setField("info_GASTO.COMB");
    obj.edit540.grid.role = "col";
    obj.edit540.grid.width = 12;
    obj.edit540:setTransparent(true);
    obj.edit540:setName("edit540");
    obj.edit540:setHeight(25);

    obj.horzLine150 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine150:setParent(obj.layout245);
    obj.horzLine150:setStrokeColor("gray");
    obj.horzLine150.grid.role = "col";
    obj.horzLine150.grid.width = 12;
    obj.horzLine150:setName("horzLine150");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout245);
    obj.label133:setText("GASTO.COMB");
    obj.label133.grid.role = "col";
    obj.label133.grid.width = 12;
    obj.label133:setHorzTextAlign("leading");
    obj.label133:setName("label133");
    obj.label133:setFontColor("#b5b5b5");
    obj.label133:setHeight(25);

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout238);
    obj.rectangle91.grid.role = "col";
    obj.rectangle91.grid.width = 12;
    obj.rectangle91.grid["min-height"] = 100;
    obj.rectangle91.grid["auto-height"] = true;
    obj.rectangle91:setName("rectangle91");
    lfm_setPropAsString(obj.rectangle91, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle91:setCornerType("round");
    obj.rectangle91:setXradius(15);
    obj.rectangle91:setYradius(15);
    obj.rectangle91:setStrokeColor("#343434");
    obj.rectangle91:setStrokeSize(2);
    obj.rectangle91:setColor("#1f1e1e");
    obj.rectangle91.grid["padding-top"] = 5;
    obj.rectangle91.grid["padding-left"] = 8;
    obj.rectangle91.grid["padding-right"] = 8;
    obj.rectangle91.grid["padding-bottom"] = 5;

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.rectangle91);
    obj.rectangle92:setColor("grey");
    obj.rectangle92:setXradius(0);
    obj.rectangle92:setYradius(0);
    obj.rectangle92.grid.role = "col";
    obj.rectangle92.grid.width = 12;
    obj.rectangle92.grid["cnt-vert-align"] = "center";
    obj.rectangle92.grid["max-height"] = 23;
    obj.rectangle92.grid["margin-bottom"] = 5;
    obj.rectangle92.grid["margin-top"] = -5;
    obj.rectangle92.grid["margin-left"] = -5;
    obj.rectangle92.grid["margin-right"] = -5;
    obj.rectangle92:setName("rectangle92");
    lfm_setPropAsString(obj.rectangle92, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle92:setCornerType("round");
    obj.rectangle92:setStrokeColor("#343434");
    obj.rectangle92:setStrokeSize(2);
    obj.rectangle92.grid["padding-top"] = 5;
    obj.rectangle92.grid["padding-left"] = 8;
    obj.rectangle92.grid["padding-right"] = 8;
    obj.rectangle92.grid["padding-bottom"] = 5;

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.rectangle92);
    obj.label134:setText("ATRIBUTOS");
    obj.label134:setHorzTextAlign("leading");
    obj.label134:setFontSize(15);
    lfm_setPropAsString(obj.label134, "fontStyle", "bold");
    obj.label134.grid.role = "col";
    obj.label134:setFontColor("black");
    obj.label134.grid["dyn-width-txt"] = true;
    obj.label134:setName("label134");
    obj.label134:setHeight(25);

    obj.layout246 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout246:setParent(obj.rectangle91);
    obj.layout246.grid.role = "col";
    obj.layout246.grid.width = 3;
    obj.layout246.grid["auto-height"] = true;
    obj.layout246.grid["cnt-horz-align"] = "middle";
    obj.layout246.grid["cnt-vert-align"] = "bottom";
    obj.layout246:setName("layout246");

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout246);
    lfm_setPropAsString(obj.rectangle93, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle93.grid.role = "col";
    obj.rectangle93.grid.width = 12;
    obj.rectangle93.grid["auto-height"] = true;
    obj.rectangle93.grid["min-width"] = 30;
    obj.rectangle93:setName("rectangle93");
    obj.rectangle93:setCornerType("round");
    obj.rectangle93:setXradius(15);
    obj.rectangle93:setYradius(15);
    obj.rectangle93:setStrokeColor("#343434");
    obj.rectangle93:setStrokeSize(2);
    obj.rectangle93:setColor("#1f1e1e");
    obj.rectangle93.grid["padding-top"] = 5;
    obj.rectangle93.grid["padding-left"] = 8;
    obj.rectangle93.grid["padding-right"] = 8;
    obj.rectangle93.grid["padding-bottom"] = 5;

    obj.edit541 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit541:setParent(obj.rectangle93);
    obj.edit541:setField("cam_Fis or 0");
    obj.edit541:setHorzTextAlign("center");
    obj.edit541:setVertTextAlign("center");
    obj.edit541:setTransparent(true);
    obj.edit541.grid.role = "col";
    obj.edit541.grid.width = 12;
    obj.edit541:setFontSize(20);
    obj.edit541:setName("edit541");
    obj.edit541:setHeight(25);

    obj.button125 = GUI.fromHandle(_obj_newObject("button"));
    obj.button125:setParent(obj.layout246);
    obj.button125:setText("Fis");
    obj.button125:setHorzTextAlign("center");
    obj.button125.grid.role = "col";
    obj.button125.grid.width = 12;
    obj.button125:setFontSize(15);
    obj.button125:setName("button125");

    obj.layout247 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout247:setParent(obj.rectangle91);
    obj.layout247.grid.role = "col";
    obj.layout247.grid.width = 3;
    obj.layout247.grid["auto-height"] = true;
    obj.layout247.grid["cnt-horz-align"] = "middle";
    obj.layout247.grid["cnt-vert-align"] = "bottom";
    obj.layout247:setName("layout247");

    obj.rectangle94 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout247);
    lfm_setPropAsString(obj.rectangle94, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle94.grid.role = "col";
    obj.rectangle94.grid.width = 12;
    obj.rectangle94.grid["auto-height"] = true;
    obj.rectangle94.grid["min-width"] = 30;
    obj.rectangle94:setName("rectangle94");
    obj.rectangle94:setCornerType("round");
    obj.rectangle94:setXradius(15);
    obj.rectangle94:setYradius(15);
    obj.rectangle94:setStrokeColor("#343434");
    obj.rectangle94:setStrokeSize(2);
    obj.rectangle94:setColor("#1f1e1e");
    obj.rectangle94.grid["padding-top"] = 5;
    obj.rectangle94.grid["padding-left"] = 8;
    obj.rectangle94.grid["padding-right"] = 8;
    obj.rectangle94.grid["padding-bottom"] = 5;

    obj.edit542 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit542:setParent(obj.rectangle94);
    obj.edit542:setField("cam_Vel or 0");
    obj.edit542:setHorzTextAlign("center");
    obj.edit542:setVertTextAlign("center");
    obj.edit542:setTransparent(true);
    obj.edit542.grid.role = "col";
    obj.edit542.grid.width = 12;
    obj.edit542:setFontSize(20);
    obj.edit542:setName("edit542");
    obj.edit542:setHeight(25);

    obj.button126 = GUI.fromHandle(_obj_newObject("button"));
    obj.button126:setParent(obj.layout247);
    obj.button126:setText("Vel");
    obj.button126:setHorzTextAlign("center");
    obj.button126.grid.role = "col";
    obj.button126.grid.width = 12;
    obj.button126:setFontSize(15);
    obj.button126:setName("button126");

    obj.layout248 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout248:setParent(obj.rectangle91);
    obj.layout248.grid.role = "col";
    obj.layout248.grid.width = 3;
    obj.layout248.grid["auto-height"] = true;
    obj.layout248.grid["cnt-horz-align"] = "middle";
    obj.layout248.grid["cnt-vert-align"] = "bottom";
    obj.layout248:setName("layout248");

    obj.rectangle95 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout248);
    lfm_setPropAsString(obj.rectangle95, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle95.grid.role = "col";
    obj.rectangle95.grid.width = 12;
    obj.rectangle95.grid["auto-height"] = true;
    obj.rectangle95.grid["min-width"] = 30;
    obj.rectangle95:setName("rectangle95");
    obj.rectangle95:setCornerType("round");
    obj.rectangle95:setXradius(15);
    obj.rectangle95:setYradius(15);
    obj.rectangle95:setStrokeColor("#343434");
    obj.rectangle95:setStrokeSize(2);
    obj.rectangle95:setColor("#1f1e1e");
    obj.rectangle95.grid["padding-top"] = 5;
    obj.rectangle95.grid["padding-left"] = 8;
    obj.rectangle95.grid["padding-right"] = 8;
    obj.rectangle95.grid["padding-bottom"] = 5;

    obj.edit543 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit543:setParent(obj.rectangle95);
    obj.edit543:setField("cam_For or 0");
    obj.edit543:setHorzTextAlign("center");
    obj.edit543:setVertTextAlign("center");
    obj.edit543:setTransparent(true);
    obj.edit543.grid.role = "col";
    obj.edit543.grid.width = 12;
    obj.edit543:setFontSize(20);
    obj.edit543:setName("edit543");
    obj.edit543:setHeight(25);

    obj.button127 = GUI.fromHandle(_obj_newObject("button"));
    obj.button127:setParent(obj.layout248);
    obj.button127:setText("For");
    obj.button127:setHorzTextAlign("center");
    obj.button127.grid.role = "col";
    obj.button127.grid.width = 12;
    obj.button127:setFontSize(15);
    obj.button127:setName("button127");

    obj.layout249 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout249:setParent(obj.rectangle91);
    obj.layout249.grid.role = "col";
    obj.layout249.grid.width = 3;
    obj.layout249.grid["auto-height"] = true;
    obj.layout249.grid["cnt-horz-align"] = "middle";
    obj.layout249.grid["cnt-vert-align"] = "bottom";
    obj.layout249:setName("layout249");

    obj.rectangle96 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout249);
    lfm_setPropAsString(obj.rectangle96, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle96.grid.role = "col";
    obj.rectangle96.grid.width = 12;
    obj.rectangle96.grid["auto-height"] = true;
    obj.rectangle96.grid["min-width"] = 30;
    obj.rectangle96:setName("rectangle96");
    obj.rectangle96:setCornerType("round");
    obj.rectangle96:setXradius(15);
    obj.rectangle96:setYradius(15);
    obj.rectangle96:setStrokeColor("#343434");
    obj.rectangle96:setStrokeSize(2);
    obj.rectangle96:setColor("#1f1e1e");
    obj.rectangle96.grid["padding-top"] = 5;
    obj.rectangle96.grid["padding-left"] = 8;
    obj.rectangle96.grid["padding-right"] = 8;
    obj.rectangle96.grid["padding-bottom"] = 5;

    obj.edit544 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit544:setParent(obj.rectangle96);
    obj.edit544:setField("cam_Agi or 0");
    obj.edit544:setHorzTextAlign("center");
    obj.edit544:setVertTextAlign("center");
    obj.edit544:setTransparent(true);
    obj.edit544.grid.role = "col";
    obj.edit544.grid.width = 12;
    obj.edit544:setFontSize(20);
    obj.edit544:setName("edit544");
    obj.edit544:setHeight(25);

    obj.button128 = GUI.fromHandle(_obj_newObject("button"));
    obj.button128:setParent(obj.layout249);
    obj.button128:setText("Agi");
    obj.button128:setHorzTextAlign("center");
    obj.button128.grid.role = "col";
    obj.button128.grid.width = 12;
    obj.button128:setFontSize(15);
    obj.button128:setName("button128");

    obj.layout250 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout250:setParent(obj.rectangle91);
    obj.layout250.grid.role = "col";
    obj.layout250.grid.width = 3;
    obj.layout250.grid["auto-height"] = true;
    obj.layout250.grid["cnt-horz-align"] = "middle";
    obj.layout250.grid["cnt-vert-align"] = "bottom";
    obj.layout250:setName("layout250");

    obj.rectangle97 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout250);
    lfm_setPropAsString(obj.rectangle97, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle97.grid.role = "col";
    obj.rectangle97.grid.width = 12;
    obj.rectangle97.grid["auto-height"] = true;
    obj.rectangle97.grid["min-width"] = 30;
    obj.rectangle97:setName("rectangle97");
    obj.rectangle97:setCornerType("round");
    obj.rectangle97:setXradius(15);
    obj.rectangle97:setYradius(15);
    obj.rectangle97:setStrokeColor("#343434");
    obj.rectangle97:setStrokeSize(2);
    obj.rectangle97:setColor("#1f1e1e");
    obj.rectangle97.grid["padding-top"] = 5;
    obj.rectangle97.grid["padding-left"] = 8;
    obj.rectangle97.grid["padding-right"] = 8;
    obj.rectangle97.grid["padding-bottom"] = 5;

    obj.edit545 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit545:setParent(obj.rectangle97);
    obj.edit545:setField("cam_Des or 0");
    obj.edit545:setHorzTextAlign("center");
    obj.edit545:setVertTextAlign("center");
    obj.edit545:setTransparent(true);
    obj.edit545.grid.role = "col";
    obj.edit545.grid.width = 12;
    obj.edit545:setFontSize(20);
    obj.edit545:setName("edit545");
    obj.edit545:setHeight(25);

    obj.button129 = GUI.fromHandle(_obj_newObject("button"));
    obj.button129:setParent(obj.layout250);
    obj.button129:setText("Des");
    obj.button129:setHorzTextAlign("center");
    obj.button129.grid.role = "col";
    obj.button129.grid.width = 12;
    obj.button129:setFontSize(15);
    obj.button129:setName("button129");

    obj.layout251 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout251:setParent(obj.rectangle91);
    obj.layout251.grid.role = "col";
    obj.layout251.grid.width = 3;
    obj.layout251.grid["auto-height"] = true;
    obj.layout251.grid["cnt-horz-align"] = "middle";
    obj.layout251.grid["cnt-vert-align"] = "bottom";
    obj.layout251:setName("layout251");

    obj.rectangle98 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout251);
    lfm_setPropAsString(obj.rectangle98, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle98.grid.role = "col";
    obj.rectangle98.grid.width = 12;
    obj.rectangle98.grid["auto-height"] = true;
    obj.rectangle98.grid["min-width"] = 30;
    obj.rectangle98:setName("rectangle98");
    obj.rectangle98:setCornerType("round");
    obj.rectangle98:setXradius(15);
    obj.rectangle98:setYradius(15);
    obj.rectangle98:setStrokeColor("#343434");
    obj.rectangle98:setStrokeSize(2);
    obj.rectangle98:setColor("#1f1e1e");
    obj.rectangle98.grid["padding-top"] = 5;
    obj.rectangle98.grid["padding-left"] = 8;
    obj.rectangle98.grid["padding-right"] = 8;
    obj.rectangle98.grid["padding-bottom"] = 5;

    obj.edit546 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit546:setParent(obj.rectangle98);
    obj.edit546:setField("cam_Mae or 0");
    obj.edit546:setHorzTextAlign("center");
    obj.edit546:setVertTextAlign("center");
    obj.edit546:setTransparent(true);
    obj.edit546.grid.role = "col";
    obj.edit546.grid.width = 12;
    obj.edit546:setFontSize(20);
    obj.edit546:setName("edit546");
    obj.edit546:setHeight(25);

    obj.button130 = GUI.fromHandle(_obj_newObject("button"));
    obj.button130:setParent(obj.layout251);
    obj.button130:setText("Mae");
    obj.button130:setHorzTextAlign("center");
    obj.button130.grid.role = "col";
    obj.button130.grid.width = 12;
    obj.button130:setFontSize(15);
    obj.button130:setName("button130");

    obj.layout252 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout252:setParent(obj.rectangle91);
    obj.layout252.grid.role = "col";
    obj.layout252.grid.width = 3;
    obj.layout252.grid["auto-height"] = true;
    obj.layout252.grid["cnt-horz-align"] = "middle";
    obj.layout252.grid["cnt-vert-align"] = "bottom";
    obj.layout252:setName("layout252");

    obj.rectangle99 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout252);
    lfm_setPropAsString(obj.rectangle99, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle99.grid.role = "col";
    obj.rectangle99.grid.width = 12;
    obj.rectangle99.grid["auto-height"] = true;
    obj.rectangle99.grid["min-width"] = 30;
    obj.rectangle99:setName("rectangle99");
    obj.rectangle99:setCornerType("round");
    obj.rectangle99:setXradius(15);
    obj.rectangle99:setYradius(15);
    obj.rectangle99:setStrokeColor("#343434");
    obj.rectangle99:setStrokeSize(2);
    obj.rectangle99:setColor("#1f1e1e");
    obj.rectangle99.grid["padding-top"] = 5;
    obj.rectangle99.grid["padding-left"] = 8;
    obj.rectangle99.grid["padding-right"] = 8;
    obj.rectangle99.grid["padding-bottom"] = 5;

    obj.edit547 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit547:setParent(obj.rectangle99);
    obj.edit547:setField("cam_Int or 0");
    obj.edit547:setHorzTextAlign("center");
    obj.edit547:setVertTextAlign("center");
    obj.edit547:setTransparent(true);
    obj.edit547.grid.role = "col";
    obj.edit547.grid.width = 12;
    obj.edit547:setFontSize(20);
    obj.edit547:setName("edit547");
    obj.edit547:setHeight(25);

    obj.button131 = GUI.fromHandle(_obj_newObject("button"));
    obj.button131:setParent(obj.layout252);
    obj.button131:setText("Int");
    obj.button131:setHorzTextAlign("center");
    obj.button131.grid.role = "col";
    obj.button131.grid.width = 12;
    obj.button131:setFontSize(15);
    obj.button131:setName("button131");

    obj.layout253 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout253:setParent(obj.rectangle91);
    obj.layout253.grid.role = "col";
    obj.layout253.grid.width = 3;
    obj.layout253.grid["auto-height"] = true;
    obj.layout253.grid["cnt-horz-align"] = "middle";
    obj.layout253.grid["cnt-vert-align"] = "bottom";
    obj.layout253:setName("layout253");

    obj.rectangle100 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout253);
    lfm_setPropAsString(obj.rectangle100, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle100.grid.role = "col";
    obj.rectangle100.grid.width = 12;
    obj.rectangle100.grid["auto-height"] = true;
    obj.rectangle100.grid["min-width"] = 30;
    obj.rectangle100:setName("rectangle100");
    obj.rectangle100:setCornerType("round");
    obj.rectangle100:setXradius(15);
    obj.rectangle100:setYradius(15);
    obj.rectangle100:setStrokeColor("#343434");
    obj.rectangle100:setStrokeSize(2);
    obj.rectangle100:setColor("#1f1e1e");
    obj.rectangle100.grid["padding-top"] = 5;
    obj.rectangle100.grid["padding-left"] = 8;
    obj.rectangle100.grid["padding-right"] = 8;
    obj.rectangle100.grid["padding-bottom"] = 5;

    obj.edit548 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit548:setParent(obj.rectangle100);
    obj.edit548:setField("cam_Per or 0");
    obj.edit548:setHorzTextAlign("center");
    obj.edit548:setVertTextAlign("center");
    obj.edit548:setTransparent(true);
    obj.edit548.grid.role = "col";
    obj.edit548.grid.width = 12;
    obj.edit548:setFontSize(20);
    obj.edit548:setName("edit548");
    obj.edit548:setHeight(25);

    obj.button132 = GUI.fromHandle(_obj_newObject("button"));
    obj.button132:setParent(obj.layout253);
    obj.button132:setText("Per");
    obj.button132:setHorzTextAlign("center");
    obj.button132.grid.role = "col";
    obj.button132.grid.width = 12;
    obj.button132:setFontSize(15);
    obj.button132:setName("button132");

    obj.rectangle101 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.layout238);
    obj.rectangle101.grid.role = "col";
    obj.rectangle101.grid.width = 8;
    obj.rectangle101.grid["min-height"] = 100;
    obj.rectangle101.grid["auto-height"] = true;
    obj.rectangle101.grid["padding-bottom"] = 20;
    obj.rectangle101:setName("rectangle101");
    lfm_setPropAsString(obj.rectangle101, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle101:setCornerType("round");
    obj.rectangle101:setXradius(15);
    obj.rectangle101:setYradius(15);
    obj.rectangle101:setStrokeColor("#343434");
    obj.rectangle101:setStrokeSize(2);
    obj.rectangle101:setColor("#1f1e1e");
    obj.rectangle101.grid["padding-top"] = 5;
    obj.rectangle101.grid["padding-left"] = 8;
    obj.rectangle101.grid["padding-right"] = 8;

    obj.rectangle102 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.rectangle101);
    obj.rectangle102:setColor("grey");
    obj.rectangle102:setXradius(0);
    obj.rectangle102:setYradius(0);
    obj.rectangle102.grid.role = "col";
    obj.rectangle102.grid.width = 12;
    obj.rectangle102.grid["cnt-vert-align"] = "center";
    obj.rectangle102.grid["max-height"] = 23;
    obj.rectangle102.grid["margin-bottom"] = 5;
    obj.rectangle102.grid["margin-top"] = -5;
    obj.rectangle102.grid["margin-left"] = -5;
    obj.rectangle102.grid["margin-right"] = -5;
    obj.rectangle102:setName("rectangle102");
    lfm_setPropAsString(obj.rectangle102, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle102:setCornerType("round");
    obj.rectangle102:setStrokeColor("#343434");
    obj.rectangle102:setStrokeSize(2);
    obj.rectangle102.grid["padding-top"] = 5;
    obj.rectangle102.grid["padding-left"] = 8;
    obj.rectangle102.grid["padding-right"] = 8;
    obj.rectangle102.grid["padding-bottom"] = 5;

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.rectangle102);
    obj.label135:setText("TABELA DE DANO");
    obj.label135:setHorzTextAlign("leading");
    obj.label135:setFontSize(15);
    lfm_setPropAsString(obj.label135, "fontStyle", "bold");
    obj.label135.grid.role = "col";
    obj.label135:setFontColor("black");
    obj.label135.grid["dyn-width-txt"] = true;
    obj.label135:setName("label135");
    obj.label135:setHeight(25);

    obj.layout254 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout254:setParent(obj.rectangle101);
    obj.layout254.grid.role = "col";
    obj.layout254.grid.width = 12;
    obj.layout254.grid["cnt-gutter"] = 2;
    obj.layout254.grid["auto-height"] = true;
    obj.layout254.grid["padding-left"] = 20;
    obj.layout254.grid["padding-right"] = 20;
    obj.layout254.grid["cnt-horz-align"] = "center";
    obj.layout254:setName("layout254");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout254);
    obj.label136.grid.role = "col";
    obj.label136.grid.width = 2;
    obj.label136:setText("1");
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");
    obj.label136:setFontColor("#b5b5b5");
    obj.label136:setHeight(25);

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout254);
    obj.label137.grid.role = "col";
    obj.label137.grid.width = 2;
    obj.label137:setText("2");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");
    obj.label137:setFontColor("#b5b5b5");
    obj.label137:setHeight(25);

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout254);
    obj.label138.grid.role = "col";
    obj.label138.grid.width = 2;
    obj.label138:setText("3");
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");
    obj.label138:setFontColor("#b5b5b5");
    obj.label138:setHeight(25);

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout254);
    obj.label139.grid.role = "col";
    obj.label139.grid.width = 2;
    obj.label139:setText("4");
    obj.label139:setHorzTextAlign("center");
    obj.label139:setName("label139");
    obj.label139:setFontColor("#b5b5b5");
    obj.label139:setHeight(25);

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout254);
    obj.label140.grid.role = "col";
    obj.label140.grid.width = 2;
    obj.label140:setText("5");
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");
    obj.label140:setFontColor("#b5b5b5");
    obj.label140:setHeight(25);

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout254);
    obj.label141.grid.role = "col";
    obj.label141.grid.width = 2;
    obj.label141:setText("6");
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");
    obj.label141:setFontColor("#b5b5b5");
    obj.label141:setHeight(25);

    obj.checkBox31 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout254);
    obj.checkBox31.grid.role = "col";
    obj.checkBox31.grid.width = 2;
    obj.checkBox31:setName("checkBox31");
    obj.checkBox31:setScale(1.2);
    obj.checkBox31.grid["vert-align"] = "middle";

    obj.checkBox32 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout254);
    obj.checkBox32.grid.role = "col";
    obj.checkBox32.grid.width = 2;
    obj.checkBox32:setName("checkBox32");
    obj.checkBox32:setScale(1.2);
    obj.checkBox32.grid["vert-align"] = "middle";

    obj.checkBox33 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout254);
    obj.checkBox33.grid.role = "col";
    obj.checkBox33.grid.width = 2;
    obj.checkBox33:setName("checkBox33");
    obj.checkBox33:setScale(1.2);
    obj.checkBox33.grid["vert-align"] = "middle";

    obj.checkBox34 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout254);
    obj.checkBox34.grid.role = "col";
    obj.checkBox34.grid.width = 2;
    obj.checkBox34:setName("checkBox34");
    obj.checkBox34:setScale(1.2);
    obj.checkBox34.grid["vert-align"] = "middle";

    obj.checkBox35 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout254);
    obj.checkBox35.grid.role = "col";
    obj.checkBox35.grid.width = 2;
    obj.checkBox35:setName("checkBox35");
    obj.checkBox35:setScale(1.2);
    obj.checkBox35.grid["vert-align"] = "middle";

    obj.checkBox36 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout254);
    obj.checkBox36.grid.role = "col";
    obj.checkBox36.grid.width = 2;
    obj.checkBox36:setName("checkBox36");
    obj.checkBox36:setScale(1.2);
    obj.checkBox36.grid["vert-align"] = "middle";

    obj.checkBox37 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout254);
    obj.checkBox37.grid.role = "col";
    obj.checkBox37.grid.width = 2;
    obj.checkBox37:setName("checkBox37");
    obj.checkBox37:setScale(1.2);
    obj.checkBox37.grid["vert-align"] = "middle";

    obj.checkBox38 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout254);
    obj.checkBox38.grid.role = "col";
    obj.checkBox38.grid.width = 2;
    obj.checkBox38:setName("checkBox38");
    obj.checkBox38:setScale(1.2);
    obj.checkBox38.grid["vert-align"] = "middle";

    obj.checkBox39 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout254);
    obj.checkBox39.grid.role = "col";
    obj.checkBox39.grid.width = 2;
    obj.checkBox39:setName("checkBox39");
    obj.checkBox39:setScale(1.2);
    obj.checkBox39.grid["vert-align"] = "middle";

    obj.checkBox40 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout254);
    obj.checkBox40.grid.role = "col";
    obj.checkBox40.grid.width = 2;
    obj.checkBox40:setName("checkBox40");
    obj.checkBox40:setScale(1.2);
    obj.checkBox40.grid["vert-align"] = "middle";

    obj.checkBox41 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout254);
    obj.checkBox41.grid.role = "col";
    obj.checkBox41.grid.width = 2;
    obj.checkBox41:setName("checkBox41");
    obj.checkBox41:setScale(1.2);
    obj.checkBox41.grid["vert-align"] = "middle";

    obj.checkBox42 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout254);
    obj.checkBox42.grid.role = "col";
    obj.checkBox42.grid.width = 2;
    obj.checkBox42:setName("checkBox42");
    obj.checkBox42:setScale(1.2);
    obj.checkBox42.grid["vert-align"] = "middle";

    obj.checkBox43 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout254);
    obj.checkBox43.grid.role = "col";
    obj.checkBox43.grid.width = 2;
    obj.checkBox43:setName("checkBox43");
    obj.checkBox43:setScale(1.2);
    obj.checkBox43.grid["vert-align"] = "middle";

    obj.checkBox44 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout254);
    obj.checkBox44.grid.role = "col";
    obj.checkBox44.grid.width = 2;
    obj.checkBox44:setName("checkBox44");
    obj.checkBox44:setScale(1.2);
    obj.checkBox44.grid["vert-align"] = "middle";

    obj.checkBox45 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout254);
    obj.checkBox45.grid.role = "col";
    obj.checkBox45.grid.width = 2;
    obj.checkBox45:setName("checkBox45");
    obj.checkBox45:setScale(1.2);
    obj.checkBox45.grid["vert-align"] = "middle";

    obj.checkBox46 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout254);
    obj.checkBox46.grid.role = "col";
    obj.checkBox46.grid.width = 2;
    obj.checkBox46:setName("checkBox46");
    obj.checkBox46:setScale(1.2);
    obj.checkBox46.grid["vert-align"] = "middle";

    obj.checkBox47 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout254);
    obj.checkBox47.grid.role = "col";
    obj.checkBox47.grid.width = 2;
    obj.checkBox47:setName("checkBox47");
    obj.checkBox47:setScale(1.2);
    obj.checkBox47.grid["vert-align"] = "middle";

    obj.checkBox48 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout254);
    obj.checkBox48.grid.role = "col";
    obj.checkBox48.grid.width = 2;
    obj.checkBox48:setName("checkBox48");
    obj.checkBox48:setScale(1.2);
    obj.checkBox48.grid["vert-align"] = "middle";

    obj.checkBox49 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout254);
    obj.checkBox49.grid.role = "col";
    obj.checkBox49.grid.width = 2;
    obj.checkBox49:setName("checkBox49");
    obj.checkBox49:setScale(1.2);
    obj.checkBox49.grid["vert-align"] = "middle";

    obj.checkBox50 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout254);
    obj.checkBox50.grid.role = "col";
    obj.checkBox50.grid.width = 2;
    obj.checkBox50:setName("checkBox50");
    obj.checkBox50:setScale(1.2);
    obj.checkBox50.grid["vert-align"] = "middle";

    obj.checkBox51 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox51:setParent(obj.layout254);
    obj.checkBox51.grid.role = "col";
    obj.checkBox51.grid.width = 2;
    obj.checkBox51:setName("checkBox51");
    obj.checkBox51:setScale(1.2);
    obj.checkBox51.grid["vert-align"] = "middle";

    obj.checkBox52 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox52:setParent(obj.layout254);
    obj.checkBox52.grid.role = "col";
    obj.checkBox52.grid.width = 2;
    obj.checkBox52:setName("checkBox52");
    obj.checkBox52:setScale(1.2);
    obj.checkBox52.grid["vert-align"] = "middle";

    obj.checkBox53 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox53:setParent(obj.layout254);
    obj.checkBox53.grid.role = "col";
    obj.checkBox53.grid.width = 2;
    obj.checkBox53:setName("checkBox53");
    obj.checkBox53:setScale(1.2);
    obj.checkBox53.grid["vert-align"] = "middle";

    obj.checkBox54 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox54:setParent(obj.layout254);
    obj.checkBox54.grid.role = "col";
    obj.checkBox54.grid.width = 2;
    obj.checkBox54:setName("checkBox54");
    obj.checkBox54:setScale(1.2);
    obj.checkBox54.grid["vert-align"] = "middle";

    obj.checkBox55 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox55:setParent(obj.layout254);
    obj.checkBox55.grid.role = "col";
    obj.checkBox55.grid.width = 2;
    obj.checkBox55:setName("checkBox55");
    obj.checkBox55:setScale(1.2);
    obj.checkBox55.grid["vert-align"] = "middle";

    obj.checkBox56 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox56:setParent(obj.layout254);
    obj.checkBox56.grid.role = "col";
    obj.checkBox56.grid.width = 2;
    obj.checkBox56:setName("checkBox56");
    obj.checkBox56:setScale(1.2);
    obj.checkBox56.grid["vert-align"] = "middle";

    obj.checkBox57 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox57:setParent(obj.layout254);
    obj.checkBox57.grid.role = "col";
    obj.checkBox57.grid.width = 2;
    obj.checkBox57:setName("checkBox57");
    obj.checkBox57:setScale(1.2);
    obj.checkBox57.grid["vert-align"] = "middle";

    obj.checkBox58 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox58:setParent(obj.layout254);
    obj.checkBox58.grid.role = "col";
    obj.checkBox58.grid.width = 2;
    obj.checkBox58:setName("checkBox58");
    obj.checkBox58:setScale(1.2);
    obj.checkBox58.grid["vert-align"] = "middle";

    obj.checkBox59 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox59:setParent(obj.layout254);
    obj.checkBox59.grid.role = "col";
    obj.checkBox59.grid.width = 2;
    obj.checkBox59:setName("checkBox59");
    obj.checkBox59:setScale(1.2);
    obj.checkBox59.grid["vert-align"] = "middle";

    obj.checkBox60 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox60:setParent(obj.layout254);
    obj.checkBox60.grid.role = "col";
    obj.checkBox60.grid.width = 2;
    obj.checkBox60:setName("checkBox60");
    obj.checkBox60:setScale(1.2);
    obj.checkBox60.grid["vert-align"] = "middle";

    obj.checkBox61 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox61:setParent(obj.layout254);
    obj.checkBox61.grid.role = "col";
    obj.checkBox61.grid.width = 2;
    obj.checkBox61:setName("checkBox61");
    obj.checkBox61:setScale(1.2);
    obj.checkBox61.grid["vert-align"] = "middle";

    obj.checkBox62 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox62:setParent(obj.layout254);
    obj.checkBox62.grid.role = "col";
    obj.checkBox62.grid.width = 2;
    obj.checkBox62:setName("checkBox62");
    obj.checkBox62:setScale(1.2);
    obj.checkBox62.grid["vert-align"] = "middle";

    obj.checkBox63 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox63:setParent(obj.layout254);
    obj.checkBox63.grid.role = "col";
    obj.checkBox63.grid.width = 2;
    obj.checkBox63:setName("checkBox63");
    obj.checkBox63:setScale(1.2);
    obj.checkBox63.grid["vert-align"] = "middle";

    obj.checkBox64 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox64:setParent(obj.layout254);
    obj.checkBox64.grid.role = "col";
    obj.checkBox64.grid.width = 2;
    obj.checkBox64:setName("checkBox64");
    obj.checkBox64:setScale(1.2);
    obj.checkBox64.grid["vert-align"] = "middle";

    obj.checkBox65 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox65:setParent(obj.layout254);
    obj.checkBox65.grid.role = "col";
    obj.checkBox65.grid.width = 2;
    obj.checkBox65:setName("checkBox65");
    obj.checkBox65:setScale(1.2);
    obj.checkBox65.grid["vert-align"] = "middle";

    obj.checkBox66 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox66:setParent(obj.layout254);
    obj.checkBox66.grid.role = "col";
    obj.checkBox66.grid.width = 2;
    obj.checkBox66:setName("checkBox66");
    obj.checkBox66:setScale(1.2);
    obj.checkBox66.grid["vert-align"] = "middle";

    obj.layout255 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout255:setParent(obj.layout237);
    obj.layout255.grid.role = "col";
    obj.layout255.grid.width = 4;
    obj.layout255.grid["auto-height"] = true;
    obj.layout255:setName("layout255");

    obj.rectangle103 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.layout255);
    obj.rectangle103.grid.role = "col";
    obj.rectangle103.grid.width = 12;
    obj.rectangle103.grid["min-height"] = 100;
    obj.rectangle103.grid["auto-height"] = true;
    obj.rectangle103:setName("rectangle103");
    lfm_setPropAsString(obj.rectangle103, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle103:setCornerType("round");
    obj.rectangle103:setXradius(15);
    obj.rectangle103:setYradius(15);
    obj.rectangle103:setStrokeColor("#343434");
    obj.rectangle103:setStrokeSize(2);
    obj.rectangle103:setColor("#1f1e1e");
    obj.rectangle103.grid["padding-top"] = 5;
    obj.rectangle103.grid["padding-left"] = 8;
    obj.rectangle103.grid["padding-right"] = 8;
    obj.rectangle103.grid["padding-bottom"] = 5;

    obj.rectangle104 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.rectangle103);
    obj.rectangle104:setColor("grey");
    obj.rectangle104:setXradius(0);
    obj.rectangle104:setYradius(0);
    obj.rectangle104.grid.role = "col";
    obj.rectangle104.grid.width = 12;
    obj.rectangle104.grid["cnt-vert-align"] = "center";
    obj.rectangle104.grid["max-height"] = 23;
    obj.rectangle104.grid["margin-bottom"] = 5;
    obj.rectangle104.grid["margin-top"] = -5;
    obj.rectangle104.grid["margin-left"] = -5;
    obj.rectangle104.grid["margin-right"] = -5;
    obj.rectangle104:setName("rectangle104");
    lfm_setPropAsString(obj.rectangle104, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle104:setCornerType("round");
    obj.rectangle104:setStrokeColor("#343434");
    obj.rectangle104:setStrokeSize(2);
    obj.rectangle104.grid["padding-top"] = 5;
    obj.rectangle104.grid["padding-left"] = 8;
    obj.rectangle104.grid["padding-right"] = 8;
    obj.rectangle104.grid["padding-bottom"] = 5;

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.rectangle104);
    obj.label142:setText("CORPO-A-CORPO");
    obj.label142:setHorzTextAlign("leading");
    obj.label142:setFontSize(15);
    lfm_setPropAsString(obj.label142, "fontStyle", "bold");
    obj.label142.grid.role = "col";
    obj.label142:setFontColor("black");
    obj.label142.grid["dyn-width-txt"] = true;
    obj.label142:setName("label142");
    obj.label142:setHeight(25);

    obj.layout256 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout256:setParent(obj.rectangle103);
    obj.layout256.grid.role = "col";
    obj.layout256.grid.width = 12;
    obj.layout256.grid["auto-height"] = true;
    obj.layout256.grid["padding-bottom"] = 5;
    obj.layout256:setName("layout256");

    obj.button133 = GUI.fromHandle(_obj_newObject("button"));
    obj.button133:setParent(obj.layout256);
    obj.button133:setText("⚔️");
    obj.button133.grid.role = "col";
    obj.button133.grid.width = 1;
    obj.button133.grid["min-height"] = 20;
    obj.button133:setFontSize(20);
    obj.button133:setName("button133");

    obj.layout257 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout257:setParent(obj.layout256);
    obj.layout257.grid.role = "col";
    obj.layout257.grid.width = 3;
    obj.layout257:setName("layout257");

    obj.edit549 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit549:setParent(obj.layout257);
    obj.edit549:setField("info_Arma1");
    obj.edit549.grid.role = "col";
    obj.edit549.grid.width = 12;
    obj.edit549:setTransparent(true);
    obj.edit549:setName("edit549");
    obj.edit549:setHeight(25);

    obj.horzLine151 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine151:setParent(obj.layout257);
    obj.horzLine151:setStrokeColor("gray");
    obj.horzLine151.grid.role = "col";
    obj.horzLine151.grid.width = 12;
    obj.horzLine151:setName("horzLine151");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout257);
    obj.label143:setText("Arma1");
    obj.label143.grid.role = "col";
    obj.label143.grid.width = 12;
    obj.label143:setHorzTextAlign("leading");
    obj.label143:setName("label143");
    obj.label143:setFontColor("#b5b5b5");
    obj.label143:setHeight(25);

    obj.layout258 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout258:setParent(obj.layout256);
    obj.layout258.grid.role = "col";
    obj.layout258.grid.width = 3;
    obj.layout258:setName("layout258");

    obj.edit550 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit550:setParent(obj.layout258);
    obj.edit550:setField("info_Notas1");
    obj.edit550.grid.role = "col";
    obj.edit550.grid.width = 12;
    obj.edit550:setTransparent(true);
    obj.edit550:setName("edit550");
    obj.edit550:setHeight(25);

    obj.horzLine152 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine152:setParent(obj.layout258);
    obj.horzLine152:setStrokeColor("gray");
    obj.horzLine152.grid.role = "col";
    obj.horzLine152.grid.width = 12;
    obj.horzLine152:setName("horzLine152");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout258);
    obj.label144:setText("Notas1");
    obj.label144.grid.role = "col";
    obj.label144.grid.width = 12;
    obj.label144:setHorzTextAlign("leading");
    obj.label144:setName("label144");
    obj.label144:setFontColor("#b5b5b5");
    obj.label144:setHeight(25);

    obj.layout259 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout259:setParent(obj.layout256);
    obj.layout259.grid.role = "col";
    obj.layout259.grid.width = 2;
    obj.layout259.grid["auto-height"] = true;
    obj.layout259.grid["cnt-horz-align"] = "middle";
    obj.layout259.grid["min-width"] = 35;
    obj.layout259:setName("layout259");

    obj.rectangle105 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.layout259);
    lfm_setPropAsString(obj.rectangle105, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle105.grid.role = "col";
    obj.rectangle105.grid.width = 12;
    obj.rectangle105.grid["auto-height"] = true;
    obj.rectangle105:setXradius(10);
    obj.rectangle105:setYradius(10);
    obj.rectangle105:setCornerType("bevel");
    obj.rectangle105.grid["min-height"] = 30;
    obj.rectangle105.grid["margin-bottom"] = 0;
    obj.rectangle105:setName("rectangle105");
    obj.rectangle105:setStrokeColor("#343434");
    obj.rectangle105:setStrokeSize(2);
    obj.rectangle105:setColor("#1f1e1e");
    obj.rectangle105.grid["padding-top"] = 5;
    obj.rectangle105.grid["padding-left"] = 8;
    obj.rectangle105.grid["padding-right"] = 8;
    obj.rectangle105.grid["padding-bottom"] = 5;

    obj.edit551 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit551:setParent(obj.rectangle105);
    obj.edit551:setField("cam_ACO");
    obj.edit551:setTransparent(true);
    obj.edit551:setHorzTextAlign("center");
    obj.edit551:setVertTextAlign("center");
    obj.edit551.grid.role = "col";
    obj.edit551.grid.width = 12;
    obj.edit551:setFontSize(15);
    obj.edit551:setName("edit551");
    obj.edit551:setHeight(25);

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout259);
    obj.label145:setText("ACO");
    obj.label145:setVertTextAlign("trailing");
    obj.label145:setHorzTextAlign("center");
    obj.label145.grid.role = "col";
    obj.label145.grid.width = 12;
    obj.label145:setFontSize(10);
    obj.label145:setTextTrimming("none");
    obj.label145:setWordWrap(true);
    obj.label145:setName("label145");
    obj.label145:setFontColor("#b5b5b5");
    obj.label145:setHeight(25);

    obj.layout260 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout260:setParent(obj.layout256);
    obj.layout260.grid.role = "col";
    obj.layout260.grid.width = 2;
    obj.layout260.grid["auto-height"] = true;
    obj.layout260.grid["cnt-horz-align"] = "middle";
    obj.layout260.grid["min-width"] = 35;
    obj.layout260:setName("layout260");

    obj.rectangle106 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle106:setParent(obj.layout260);
    lfm_setPropAsString(obj.rectangle106, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle106.grid.role = "col";
    obj.rectangle106.grid.width = 12;
    obj.rectangle106.grid["auto-height"] = true;
    obj.rectangle106:setXradius(10);
    obj.rectangle106:setYradius(10);
    obj.rectangle106:setCornerType("bevel");
    obj.rectangle106.grid["min-height"] = 30;
    obj.rectangle106.grid["margin-bottom"] = 0;
    obj.rectangle106:setName("rectangle106");
    obj.rectangle106:setStrokeColor("#343434");
    obj.rectangle106:setStrokeSize(2);
    obj.rectangle106:setColor("#1f1e1e");
    obj.rectangle106.grid["padding-top"] = 5;
    obj.rectangle106.grid["padding-left"] = 8;
    obj.rectangle106.grid["padding-right"] = 8;
    obj.rectangle106.grid["padding-bottom"] = 5;

    obj.edit552 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit552:setParent(obj.rectangle106);
    obj.edit552:setField("cam_POD+FOR");
    obj.edit552:setTransparent(true);
    obj.edit552:setHorzTextAlign("center");
    obj.edit552:setVertTextAlign("center");
    obj.edit552.grid.role = "col";
    obj.edit552.grid.width = 12;
    obj.edit552:setFontSize(15);
    obj.edit552:setName("edit552");
    obj.edit552:setHeight(25);

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout260);
    obj.label146:setText("POD+FOR");
    obj.label146:setVertTextAlign("trailing");
    obj.label146:setHorzTextAlign("center");
    obj.label146.grid.role = "col";
    obj.label146.grid.width = 12;
    obj.label146:setFontSize(10);
    obj.label146:setTextTrimming("none");
    obj.label146:setWordWrap(true);
    obj.label146:setName("label146");
    obj.label146:setFontColor("#b5b5b5");
    obj.label146:setHeight(25);

    obj.layout261 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout261:setParent(obj.rectangle103);
    obj.layout261.grid.role = "col";
    obj.layout261.grid.width = 12;
    obj.layout261.grid["auto-height"] = true;
    obj.layout261.grid["padding-bottom"] = 5;
    obj.layout261:setName("layout261");

    obj.button134 = GUI.fromHandle(_obj_newObject("button"));
    obj.button134:setParent(obj.layout261);
    obj.button134:setText("⚔️");
    obj.button134.grid.role = "col";
    obj.button134.grid.width = 1;
    obj.button134.grid["min-height"] = 20;
    obj.button134:setFontSize(20);
    obj.button134:setName("button134");

    obj.layout262 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout262:setParent(obj.layout261);
    obj.layout262.grid.role = "col";
    obj.layout262.grid.width = 3;
    obj.layout262:setName("layout262");

    obj.edit553 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit553:setParent(obj.layout262);
    obj.edit553:setField("info_Arma1");
    obj.edit553.grid.role = "col";
    obj.edit553.grid.width = 12;
    obj.edit553:setTransparent(true);
    obj.edit553:setName("edit553");
    obj.edit553:setHeight(25);

    obj.horzLine153 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine153:setParent(obj.layout262);
    obj.horzLine153:setStrokeColor("gray");
    obj.horzLine153.grid.role = "col";
    obj.horzLine153.grid.width = 12;
    obj.horzLine153:setName("horzLine153");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout262);
    obj.label147:setText("Arma1");
    obj.label147.grid.role = "col";
    obj.label147.grid.width = 12;
    obj.label147:setHorzTextAlign("leading");
    obj.label147:setName("label147");
    obj.label147:setFontColor("#b5b5b5");
    obj.label147:setHeight(25);

    obj.layout263 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout263:setParent(obj.layout261);
    obj.layout263.grid.role = "col";
    obj.layout263.grid.width = 3;
    obj.layout263:setName("layout263");

    obj.edit554 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit554:setParent(obj.layout263);
    obj.edit554:setField("info_Notas1");
    obj.edit554.grid.role = "col";
    obj.edit554.grid.width = 12;
    obj.edit554:setTransparent(true);
    obj.edit554:setName("edit554");
    obj.edit554:setHeight(25);

    obj.horzLine154 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine154:setParent(obj.layout263);
    obj.horzLine154:setStrokeColor("gray");
    obj.horzLine154.grid.role = "col";
    obj.horzLine154.grid.width = 12;
    obj.horzLine154:setName("horzLine154");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout263);
    obj.label148:setText("Notas1");
    obj.label148.grid.role = "col";
    obj.label148.grid.width = 12;
    obj.label148:setHorzTextAlign("leading");
    obj.label148:setName("label148");
    obj.label148:setFontColor("#b5b5b5");
    obj.label148:setHeight(25);

    obj.layout264 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout264:setParent(obj.layout261);
    obj.layout264.grid.role = "col";
    obj.layout264.grid.width = 2;
    obj.layout264.grid["auto-height"] = true;
    obj.layout264.grid["cnt-horz-align"] = "middle";
    obj.layout264.grid["min-width"] = 35;
    obj.layout264:setName("layout264");

    obj.rectangle107 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle107:setParent(obj.layout264);
    lfm_setPropAsString(obj.rectangle107, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle107.grid.role = "col";
    obj.rectangle107.grid.width = 12;
    obj.rectangle107.grid["auto-height"] = true;
    obj.rectangle107:setXradius(10);
    obj.rectangle107:setYradius(10);
    obj.rectangle107:setCornerType("bevel");
    obj.rectangle107.grid["min-height"] = 30;
    obj.rectangle107.grid["margin-bottom"] = 0;
    obj.rectangle107:setName("rectangle107");
    obj.rectangle107:setStrokeColor("#343434");
    obj.rectangle107:setStrokeSize(2);
    obj.rectangle107:setColor("#1f1e1e");
    obj.rectangle107.grid["padding-top"] = 5;
    obj.rectangle107.grid["padding-left"] = 8;
    obj.rectangle107.grid["padding-right"] = 8;
    obj.rectangle107.grid["padding-bottom"] = 5;

    obj.edit555 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit555:setParent(obj.rectangle107);
    obj.edit555:setField("cam_ACO");
    obj.edit555:setTransparent(true);
    obj.edit555:setHorzTextAlign("center");
    obj.edit555:setVertTextAlign("center");
    obj.edit555.grid.role = "col";
    obj.edit555.grid.width = 12;
    obj.edit555:setFontSize(15);
    obj.edit555:setName("edit555");
    obj.edit555:setHeight(25);

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout264);
    obj.label149:setText("ACO");
    obj.label149:setVertTextAlign("trailing");
    obj.label149:setHorzTextAlign("center");
    obj.label149.grid.role = "col";
    obj.label149.grid.width = 12;
    obj.label149:setFontSize(10);
    obj.label149:setTextTrimming("none");
    obj.label149:setWordWrap(true);
    obj.label149:setName("label149");
    obj.label149:setFontColor("#b5b5b5");
    obj.label149:setHeight(25);

    obj.layout265 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout265:setParent(obj.layout261);
    obj.layout265.grid.role = "col";
    obj.layout265.grid.width = 2;
    obj.layout265.grid["auto-height"] = true;
    obj.layout265.grid["cnt-horz-align"] = "middle";
    obj.layout265.grid["min-width"] = 35;
    obj.layout265:setName("layout265");

    obj.rectangle108 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle108:setParent(obj.layout265);
    lfm_setPropAsString(obj.rectangle108, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle108.grid.role = "col";
    obj.rectangle108.grid.width = 12;
    obj.rectangle108.grid["auto-height"] = true;
    obj.rectangle108:setXradius(10);
    obj.rectangle108:setYradius(10);
    obj.rectangle108:setCornerType("bevel");
    obj.rectangle108.grid["min-height"] = 30;
    obj.rectangle108.grid["margin-bottom"] = 0;
    obj.rectangle108:setName("rectangle108");
    obj.rectangle108:setStrokeColor("#343434");
    obj.rectangle108:setStrokeSize(2);
    obj.rectangle108:setColor("#1f1e1e");
    obj.rectangle108.grid["padding-top"] = 5;
    obj.rectangle108.grid["padding-left"] = 8;
    obj.rectangle108.grid["padding-right"] = 8;
    obj.rectangle108.grid["padding-bottom"] = 5;

    obj.edit556 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit556:setParent(obj.rectangle108);
    obj.edit556:setField("cam_POD+FOR");
    obj.edit556:setTransparent(true);
    obj.edit556:setHorzTextAlign("center");
    obj.edit556:setVertTextAlign("center");
    obj.edit556.grid.role = "col";
    obj.edit556.grid.width = 12;
    obj.edit556:setFontSize(15);
    obj.edit556:setName("edit556");
    obj.edit556:setHeight(25);

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout265);
    obj.label150:setText("POD+FOR");
    obj.label150:setVertTextAlign("trailing");
    obj.label150:setHorzTextAlign("center");
    obj.label150.grid.role = "col";
    obj.label150.grid.width = 12;
    obj.label150:setFontSize(10);
    obj.label150:setTextTrimming("none");
    obj.label150:setWordWrap(true);
    obj.label150:setName("label150");
    obj.label150:setFontColor("#b5b5b5");
    obj.label150:setHeight(25);

    obj.rectangle109 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle109:setParent(obj.layout255);
    obj.rectangle109.grid.role = "col";
    obj.rectangle109.grid.width = 12;
    obj.rectangle109.grid["min-height"] = 100;
    obj.rectangle109.grid["auto-height"] = true;
    obj.rectangle109:setName("rectangle109");
    lfm_setPropAsString(obj.rectangle109, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle109:setCornerType("round");
    obj.rectangle109:setXradius(15);
    obj.rectangle109:setYradius(15);
    obj.rectangle109:setStrokeColor("#343434");
    obj.rectangle109:setStrokeSize(2);
    obj.rectangle109:setColor("#1f1e1e");
    obj.rectangle109.grid["padding-top"] = 5;
    obj.rectangle109.grid["padding-left"] = 8;
    obj.rectangle109.grid["padding-right"] = 8;
    obj.rectangle109.grid["padding-bottom"] = 5;

    obj.rectangle110 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle110:setParent(obj.rectangle109);
    obj.rectangle110:setColor("grey");
    obj.rectangle110:setXradius(0);
    obj.rectangle110:setYradius(0);
    obj.rectangle110.grid.role = "col";
    obj.rectangle110.grid.width = 12;
    obj.rectangle110.grid["cnt-vert-align"] = "center";
    obj.rectangle110.grid["max-height"] = 23;
    obj.rectangle110.grid["margin-bottom"] = 5;
    obj.rectangle110.grid["margin-top"] = -5;
    obj.rectangle110.grid["margin-left"] = -5;
    obj.rectangle110.grid["margin-right"] = -5;
    obj.rectangle110:setName("rectangle110");
    lfm_setPropAsString(obj.rectangle110, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle110:setCornerType("round");
    obj.rectangle110:setStrokeColor("#343434");
    obj.rectangle110:setStrokeSize(2);
    obj.rectangle110.grid["padding-top"] = 5;
    obj.rectangle110.grid["padding-left"] = 8;
    obj.rectangle110.grid["padding-right"] = 8;
    obj.rectangle110.grid["padding-bottom"] = 5;

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.rectangle110);
    obj.label151:setText("ATAQUE A DISTANCIA");
    obj.label151:setHorzTextAlign("leading");
    obj.label151:setFontSize(15);
    lfm_setPropAsString(obj.label151, "fontStyle", "bold");
    obj.label151.grid.role = "col";
    obj.label151:setFontColor("black");
    obj.label151.grid["dyn-width-txt"] = true;
    obj.label151:setName("label151");
    obj.label151:setHeight(25);

    obj.layout266 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout266:setParent(obj.rectangle109);
    obj.layout266.grid.role = "col";
    obj.layout266.grid.width = 12;
    obj.layout266.grid["auto-height"] = true;
    obj.layout266.grid["padding-bottom"] = 5;
    obj.layout266:setName("layout266");

    obj.button135 = GUI.fromHandle(_obj_newObject("button"));
    obj.button135:setParent(obj.layout266);
    obj.button135:setText("🏹");
    obj.button135.grid.role = "col";
    obj.button135.grid.width = 1;
    obj.button135.grid["min-height"] = 20;
    obj.button135:setFontSize(20);
    obj.button135:setName("button135");

    obj.layout267 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout267:setParent(obj.layout266);
    obj.layout267.grid.role = "col";
    obj.layout267.grid.width = 3;
    obj.layout267:setName("layout267");

    obj.edit557 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit557:setParent(obj.layout267);
    obj.edit557:setField("info_Arma1");
    obj.edit557.grid.role = "col";
    obj.edit557.grid.width = 12;
    obj.edit557:setTransparent(true);
    obj.edit557:setName("edit557");
    obj.edit557:setHeight(25);

    obj.horzLine155 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine155:setParent(obj.layout267);
    obj.horzLine155:setStrokeColor("gray");
    obj.horzLine155.grid.role = "col";
    obj.horzLine155.grid.width = 12;
    obj.horzLine155:setName("horzLine155");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout267);
    obj.label152:setText("Arma1");
    obj.label152.grid.role = "col";
    obj.label152.grid.width = 12;
    obj.label152:setHorzTextAlign("leading");
    obj.label152:setName("label152");
    obj.label152:setFontColor("#b5b5b5");
    obj.label152:setHeight(25);

    obj.layout268 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout268:setParent(obj.layout266);
    obj.layout268.grid.role = "col";
    obj.layout268.grid.width = 2;
    obj.layout268:setName("layout268");

    obj.edit558 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit558:setParent(obj.layout268);
    obj.edit558:setField("info_Notas1");
    obj.edit558.grid.role = "col";
    obj.edit558.grid.width = 12;
    obj.edit558:setTransparent(true);
    obj.edit558:setName("edit558");
    obj.edit558:setHeight(25);

    obj.horzLine156 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine156:setParent(obj.layout268);
    obj.horzLine156:setStrokeColor("gray");
    obj.horzLine156.grid.role = "col";
    obj.horzLine156.grid.width = 12;
    obj.horzLine156:setName("horzLine156");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout268);
    obj.label153:setText("Notas1");
    obj.label153.grid.role = "col";
    obj.label153.grid.width = 12;
    obj.label153:setHorzTextAlign("leading");
    obj.label153:setName("label153");
    obj.label153:setFontColor("#b5b5b5");
    obj.label153:setHeight(25);

    obj.layout269 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout269:setParent(obj.layout266);
    obj.layout269.grid.role = "col";
    obj.layout269.grid.width = 2;
    obj.layout269.grid["auto-height"] = true;
    obj.layout269.grid["cnt-horz-align"] = "middle";
    obj.layout269.grid["min-width"] = 35;
    obj.layout269:setName("layout269");

    obj.rectangle111 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle111:setParent(obj.layout269);
    lfm_setPropAsString(obj.rectangle111, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle111.grid.role = "col";
    obj.rectangle111.grid.width = 12;
    obj.rectangle111.grid["auto-height"] = true;
    obj.rectangle111:setXradius(10);
    obj.rectangle111:setYradius(10);
    obj.rectangle111:setCornerType("bevel");
    obj.rectangle111.grid["min-height"] = 30;
    obj.rectangle111.grid["margin-bottom"] = 0;
    obj.rectangle111:setName("rectangle111");
    obj.rectangle111:setStrokeColor("#343434");
    obj.rectangle111:setStrokeSize(2);
    obj.rectangle111:setColor("#1f1e1e");
    obj.rectangle111.grid["padding-top"] = 5;
    obj.rectangle111.grid["padding-left"] = 8;
    obj.rectangle111.grid["padding-right"] = 8;
    obj.rectangle111.grid["padding-bottom"] = 5;

    obj.edit559 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit559:setParent(obj.rectangle111);
    obj.edit559:setField("cam_ALC");
    obj.edit559:setTransparent(true);
    obj.edit559:setHorzTextAlign("center");
    obj.edit559:setVertTextAlign("center");
    obj.edit559.grid.role = "col";
    obj.edit559.grid.width = 12;
    obj.edit559:setFontSize(15);
    obj.edit559:setName("edit559");
    obj.edit559:setHeight(25);

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout269);
    obj.label154:setText("ALC");
    obj.label154:setVertTextAlign("trailing");
    obj.label154:setHorzTextAlign("center");
    obj.label154.grid.role = "col";
    obj.label154.grid.width = 12;
    obj.label154:setFontSize(10);
    obj.label154:setTextTrimming("none");
    obj.label154:setWordWrap(true);
    obj.label154:setName("label154");
    obj.label154:setFontColor("#b5b5b5");
    obj.label154:setHeight(25);

    obj.layout270 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout270:setParent(obj.layout266);
    obj.layout270.grid.role = "col";
    obj.layout270.grid.width = 2;
    obj.layout270.grid["auto-height"] = true;
    obj.layout270.grid["cnt-horz-align"] = "middle";
    obj.layout270.grid["min-width"] = 35;
    obj.layout270:setName("layout270");

    obj.rectangle112 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle112:setParent(obj.layout270);
    lfm_setPropAsString(obj.rectangle112, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle112.grid.role = "col";
    obj.rectangle112.grid.width = 12;
    obj.rectangle112.grid["auto-height"] = true;
    obj.rectangle112:setXradius(10);
    obj.rectangle112:setYradius(10);
    obj.rectangle112:setCornerType("bevel");
    obj.rectangle112.grid["min-height"] = 30;
    obj.rectangle112.grid["margin-bottom"] = 0;
    obj.rectangle112:setName("rectangle112");
    obj.rectangle112:setStrokeColor("#343434");
    obj.rectangle112:setStrokeSize(2);
    obj.rectangle112:setColor("#1f1e1e");
    obj.rectangle112.grid["padding-top"] = 5;
    obj.rectangle112.grid["padding-left"] = 8;
    obj.rectangle112.grid["padding-right"] = 8;
    obj.rectangle112.grid["padding-bottom"] = 5;

    obj.edit560 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit560:setParent(obj.rectangle112);
    obj.edit560:setField("cam_ADI");
    obj.edit560:setTransparent(true);
    obj.edit560:setHorzTextAlign("center");
    obj.edit560:setVertTextAlign("center");
    obj.edit560.grid.role = "col";
    obj.edit560.grid.width = 12;
    obj.edit560:setFontSize(15);
    obj.edit560:setName("edit560");
    obj.edit560:setHeight(25);

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout270);
    obj.label155:setText("ADI");
    obj.label155:setVertTextAlign("trailing");
    obj.label155:setHorzTextAlign("center");
    obj.label155.grid.role = "col";
    obj.label155.grid.width = 12;
    obj.label155:setFontSize(10);
    obj.label155:setTextTrimming("none");
    obj.label155:setWordWrap(true);
    obj.label155:setName("label155");
    obj.label155:setFontColor("#b5b5b5");
    obj.label155:setHeight(25);

    obj.layout271 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout271:setParent(obj.layout266);
    obj.layout271.grid.role = "col";
    obj.layout271.grid.width = 2;
    obj.layout271.grid["auto-height"] = true;
    obj.layout271.grid["cnt-horz-align"] = "middle";
    obj.layout271.grid["min-width"] = 35;
    obj.layout271:setName("layout271");

    obj.rectangle113 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle113:setParent(obj.layout271);
    lfm_setPropAsString(obj.rectangle113, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle113.grid.role = "col";
    obj.rectangle113.grid.width = 12;
    obj.rectangle113.grid["auto-height"] = true;
    obj.rectangle113:setXradius(10);
    obj.rectangle113:setYradius(10);
    obj.rectangle113:setCornerType("bevel");
    obj.rectangle113.grid["min-height"] = 30;
    obj.rectangle113.grid["margin-bottom"] = 0;
    obj.rectangle113:setName("rectangle113");
    obj.rectangle113:setStrokeColor("#343434");
    obj.rectangle113:setStrokeSize(2);
    obj.rectangle113:setColor("#1f1e1e");
    obj.rectangle113.grid["padding-top"] = 5;
    obj.rectangle113.grid["padding-left"] = 8;
    obj.rectangle113.grid["padding-right"] = 8;
    obj.rectangle113.grid["padding-bottom"] = 5;

    obj.edit561 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit561:setParent(obj.rectangle113);
    obj.edit561:setField("cam_POD");
    obj.edit561:setTransparent(true);
    obj.edit561:setHorzTextAlign("center");
    obj.edit561:setVertTextAlign("center");
    obj.edit561.grid.role = "col";
    obj.edit561.grid.width = 12;
    obj.edit561:setFontSize(15);
    obj.edit561:setName("edit561");
    obj.edit561:setHeight(25);

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout271);
    obj.label156:setText("POD");
    obj.label156:setVertTextAlign("trailing");
    obj.label156:setHorzTextAlign("center");
    obj.label156.grid.role = "col";
    obj.label156.grid.width = 12;
    obj.label156:setFontSize(10);
    obj.label156:setTextTrimming("none");
    obj.label156:setWordWrap(true);
    obj.label156:setName("label156");
    obj.label156:setFontColor("#b5b5b5");
    obj.label156:setHeight(25);

    obj.layout272 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout272:setParent(obj.rectangle109);
    obj.layout272.grid.role = "col";
    obj.layout272.grid.width = 12;
    obj.layout272.grid["auto-height"] = true;
    obj.layout272.grid["padding-bottom"] = 5;
    obj.layout272:setName("layout272");

    obj.button136 = GUI.fromHandle(_obj_newObject("button"));
    obj.button136:setParent(obj.layout272);
    obj.button136:setText("🏹");
    obj.button136.grid.role = "col";
    obj.button136.grid.width = 1;
    obj.button136.grid["min-height"] = 20;
    obj.button136:setFontSize(20);
    obj.button136:setName("button136");

    obj.layout273 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout273:setParent(obj.layout272);
    obj.layout273.grid.role = "col";
    obj.layout273.grid.width = 3;
    obj.layout273:setName("layout273");

    obj.edit562 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit562:setParent(obj.layout273);
    obj.edit562:setField("info_Arma1");
    obj.edit562.grid.role = "col";
    obj.edit562.grid.width = 12;
    obj.edit562:setTransparent(true);
    obj.edit562:setName("edit562");
    obj.edit562:setHeight(25);

    obj.horzLine157 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine157:setParent(obj.layout273);
    obj.horzLine157:setStrokeColor("gray");
    obj.horzLine157.grid.role = "col";
    obj.horzLine157.grid.width = 12;
    obj.horzLine157:setName("horzLine157");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout273);
    obj.label157:setText("Arma1");
    obj.label157.grid.role = "col";
    obj.label157.grid.width = 12;
    obj.label157:setHorzTextAlign("leading");
    obj.label157:setName("label157");
    obj.label157:setFontColor("#b5b5b5");
    obj.label157:setHeight(25);

    obj.layout274 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout274:setParent(obj.layout272);
    obj.layout274.grid.role = "col";
    obj.layout274.grid.width = 2;
    obj.layout274:setName("layout274");

    obj.edit563 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit563:setParent(obj.layout274);
    obj.edit563:setField("info_Notas1");
    obj.edit563.grid.role = "col";
    obj.edit563.grid.width = 12;
    obj.edit563:setTransparent(true);
    obj.edit563:setName("edit563");
    obj.edit563:setHeight(25);

    obj.horzLine158 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine158:setParent(obj.layout274);
    obj.horzLine158:setStrokeColor("gray");
    obj.horzLine158.grid.role = "col";
    obj.horzLine158.grid.width = 12;
    obj.horzLine158:setName("horzLine158");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout274);
    obj.label158:setText("Notas1");
    obj.label158.grid.role = "col";
    obj.label158.grid.width = 12;
    obj.label158:setHorzTextAlign("leading");
    obj.label158:setName("label158");
    obj.label158:setFontColor("#b5b5b5");
    obj.label158:setHeight(25);

    obj.layout275 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout275:setParent(obj.layout272);
    obj.layout275.grid.role = "col";
    obj.layout275.grid.width = 2;
    obj.layout275.grid["auto-height"] = true;
    obj.layout275.grid["cnt-horz-align"] = "middle";
    obj.layout275.grid["min-width"] = 35;
    obj.layout275:setName("layout275");

    obj.rectangle114 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle114:setParent(obj.layout275);
    lfm_setPropAsString(obj.rectangle114, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle114.grid.role = "col";
    obj.rectangle114.grid.width = 12;
    obj.rectangle114.grid["auto-height"] = true;
    obj.rectangle114:setXradius(10);
    obj.rectangle114:setYradius(10);
    obj.rectangle114:setCornerType("bevel");
    obj.rectangle114.grid["min-height"] = 30;
    obj.rectangle114.grid["margin-bottom"] = 0;
    obj.rectangle114:setName("rectangle114");
    obj.rectangle114:setStrokeColor("#343434");
    obj.rectangle114:setStrokeSize(2);
    obj.rectangle114:setColor("#1f1e1e");
    obj.rectangle114.grid["padding-top"] = 5;
    obj.rectangle114.grid["padding-left"] = 8;
    obj.rectangle114.grid["padding-right"] = 8;
    obj.rectangle114.grid["padding-bottom"] = 5;

    obj.edit564 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit564:setParent(obj.rectangle114);
    obj.edit564:setField("cam_ALC");
    obj.edit564:setTransparent(true);
    obj.edit564:setHorzTextAlign("center");
    obj.edit564:setVertTextAlign("center");
    obj.edit564.grid.role = "col";
    obj.edit564.grid.width = 12;
    obj.edit564:setFontSize(15);
    obj.edit564:setName("edit564");
    obj.edit564:setHeight(25);

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout275);
    obj.label159:setText("ALC");
    obj.label159:setVertTextAlign("trailing");
    obj.label159:setHorzTextAlign("center");
    obj.label159.grid.role = "col";
    obj.label159.grid.width = 12;
    obj.label159:setFontSize(10);
    obj.label159:setTextTrimming("none");
    obj.label159:setWordWrap(true);
    obj.label159:setName("label159");
    obj.label159:setFontColor("#b5b5b5");
    obj.label159:setHeight(25);

    obj.layout276 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout276:setParent(obj.layout272);
    obj.layout276.grid.role = "col";
    obj.layout276.grid.width = 2;
    obj.layout276.grid["auto-height"] = true;
    obj.layout276.grid["cnt-horz-align"] = "middle";
    obj.layout276.grid["min-width"] = 35;
    obj.layout276:setName("layout276");

    obj.rectangle115 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle115:setParent(obj.layout276);
    lfm_setPropAsString(obj.rectangle115, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle115.grid.role = "col";
    obj.rectangle115.grid.width = 12;
    obj.rectangle115.grid["auto-height"] = true;
    obj.rectangle115:setXradius(10);
    obj.rectangle115:setYradius(10);
    obj.rectangle115:setCornerType("bevel");
    obj.rectangle115.grid["min-height"] = 30;
    obj.rectangle115.grid["margin-bottom"] = 0;
    obj.rectangle115:setName("rectangle115");
    obj.rectangle115:setStrokeColor("#343434");
    obj.rectangle115:setStrokeSize(2);
    obj.rectangle115:setColor("#1f1e1e");
    obj.rectangle115.grid["padding-top"] = 5;
    obj.rectangle115.grid["padding-left"] = 8;
    obj.rectangle115.grid["padding-right"] = 8;
    obj.rectangle115.grid["padding-bottom"] = 5;

    obj.edit565 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit565:setParent(obj.rectangle115);
    obj.edit565:setField("cam_ADI");
    obj.edit565:setTransparent(true);
    obj.edit565:setHorzTextAlign("center");
    obj.edit565:setVertTextAlign("center");
    obj.edit565.grid.role = "col";
    obj.edit565.grid.width = 12;
    obj.edit565:setFontSize(15);
    obj.edit565:setName("edit565");
    obj.edit565:setHeight(25);

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout276);
    obj.label160:setText("ADI");
    obj.label160:setVertTextAlign("trailing");
    obj.label160:setHorzTextAlign("center");
    obj.label160.grid.role = "col";
    obj.label160.grid.width = 12;
    obj.label160:setFontSize(10);
    obj.label160:setTextTrimming("none");
    obj.label160:setWordWrap(true);
    obj.label160:setName("label160");
    obj.label160:setFontColor("#b5b5b5");
    obj.label160:setHeight(25);

    obj.layout277 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout277:setParent(obj.layout272);
    obj.layout277.grid.role = "col";
    obj.layout277.grid.width = 2;
    obj.layout277.grid["auto-height"] = true;
    obj.layout277.grid["cnt-horz-align"] = "middle";
    obj.layout277.grid["min-width"] = 35;
    obj.layout277:setName("layout277");

    obj.rectangle116 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle116:setParent(obj.layout277);
    lfm_setPropAsString(obj.rectangle116, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle116.grid.role = "col";
    obj.rectangle116.grid.width = 12;
    obj.rectangle116.grid["auto-height"] = true;
    obj.rectangle116:setXradius(10);
    obj.rectangle116:setYradius(10);
    obj.rectangle116:setCornerType("bevel");
    obj.rectangle116.grid["min-height"] = 30;
    obj.rectangle116.grid["margin-bottom"] = 0;
    obj.rectangle116:setName("rectangle116");
    obj.rectangle116:setStrokeColor("#343434");
    obj.rectangle116:setStrokeSize(2);
    obj.rectangle116:setColor("#1f1e1e");
    obj.rectangle116.grid["padding-top"] = 5;
    obj.rectangle116.grid["padding-left"] = 8;
    obj.rectangle116.grid["padding-right"] = 8;
    obj.rectangle116.grid["padding-bottom"] = 5;

    obj.edit566 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit566:setParent(obj.rectangle116);
    obj.edit566:setField("cam_POD");
    obj.edit566:setTransparent(true);
    obj.edit566:setHorzTextAlign("center");
    obj.edit566:setVertTextAlign("center");
    obj.edit566.grid.role = "col";
    obj.edit566.grid.width = 12;
    obj.edit566:setFontSize(15);
    obj.edit566:setName("edit566");
    obj.edit566:setHeight(25);

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout277);
    obj.label161:setText("POD");
    obj.label161:setVertTextAlign("trailing");
    obj.label161:setHorzTextAlign("center");
    obj.label161.grid.role = "col";
    obj.label161.grid.width = 12;
    obj.label161:setFontSize(10);
    obj.label161:setTextTrimming("none");
    obj.label161:setWordWrap(true);
    obj.label161:setName("label161");
    obj.label161:setFontColor("#b5b5b5");
    obj.label161:setHeight(25);

    obj.rectangle117 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle117:setParent(obj.layout255);
    obj.rectangle117.grid.role = "col";
    obj.rectangle117.grid.width = 12;
    obj.rectangle117.grid["auto-height"] = true;
    obj.rectangle117.grid["cnt-horz-align"] = "right";
    obj.rectangle117.grid["margin-bottom"] = 5;
    obj.rectangle117:setName("rectangle117");
    lfm_setPropAsString(obj.rectangle117, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle117:setCornerType("round");
    obj.rectangle117:setXradius(15);
    obj.rectangle117:setYradius(15);
    obj.rectangle117:setStrokeColor("#343434");
    obj.rectangle117:setStrokeSize(2);
    obj.rectangle117:setColor("#1f1e1e");
    obj.rectangle117.grid["padding-top"] = 5;
    obj.rectangle117.grid["padding-left"] = 8;
    obj.rectangle117.grid["padding-right"] = 8;
    obj.rectangle117.grid["padding-bottom"] = 5;

    obj.rectangle118 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle118:setParent(obj.rectangle117);
    obj.rectangle118:setColor("grey");
    obj.rectangle118:setXradius(0);
    obj.rectangle118:setYradius(0);
    obj.rectangle118.grid.role = "row";
    obj.rectangle118.grid.width = 12;
    obj.rectangle118.grid["cnt-vert-align"] = "center";
    obj.rectangle118.grid["max-height"] = 23;
    obj.rectangle118.grid["margin-bottom"] = 5;
    obj.rectangle118.grid["margin-top"] = -5;
    obj.rectangle118.grid["margin-left"] = -5;
    obj.rectangle118.grid["margin-right"] = -5;
    obj.rectangle118:setName("rectangle118");
    lfm_setPropAsString(obj.rectangle118, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle118:setCornerType("round");
    obj.rectangle118:setStrokeColor("#343434");
    obj.rectangle118:setStrokeSize(2);
    obj.rectangle118.grid["padding-top"] = 5;
    obj.rectangle118.grid["padding-left"] = 8;
    obj.rectangle118.grid["padding-right"] = 8;
    obj.rectangle118.grid["padding-bottom"] = 5;

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.rectangle118);
    obj.label162:setText("DEFESA");
    obj.label162:setHorzTextAlign("leading");
    obj.label162:setFontSize(15);
    lfm_setPropAsString(obj.label162, "fontStyle", "bold");
    obj.label162.grid.role = "col";
    obj.label162:setFontColor("black");
    obj.label162.grid["dyn-width-txt"] = true;
    obj.label162:setName("label162");
    obj.label162:setHeight(25);

    obj.layout278 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout278:setParent(obj.rectangle117);
    obj.layout278.grid.role = "col";
    obj.layout278.grid.width = 2;
    obj.layout278.grid["auto-height"] = true;
    obj.layout278.grid["cnt-horz-align"] = "middle";
    obj.layout278.grid["min-width"] = 35;
    obj.layout278:setName("layout278");

    obj.rectangle119 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle119:setParent(obj.layout278);
    lfm_setPropAsString(obj.rectangle119, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle119.grid.role = "col";
    obj.rectangle119.grid.width = 12;
    obj.rectangle119.grid["auto-height"] = true;
    obj.rectangle119:setXradius(10);
    obj.rectangle119:setYradius(10);
    obj.rectangle119:setCornerType("bevel");
    obj.rectangle119.grid["min-height"] = 30;
    obj.rectangle119.grid["margin-bottom"] = 0;
    obj.rectangle119:setName("rectangle119");
    obj.rectangle119:setStrokeColor("#343434");
    obj.rectangle119:setStrokeSize(2);
    obj.rectangle119:setColor("#1f1e1e");
    obj.rectangle119.grid["padding-top"] = 5;
    obj.rectangle119.grid["padding-left"] = 8;
    obj.rectangle119.grid["padding-right"] = 8;
    obj.rectangle119.grid["padding-bottom"] = 5;

    obj.edit567 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit567:setParent(obj.rectangle119);
    obj.edit567:setField("cam_ VEL + AGI + PER");
    obj.edit567:setTransparent(true);
    obj.edit567:setHorzTextAlign("center");
    obj.edit567:setVertTextAlign("center");
    obj.edit567.grid.role = "col";
    obj.edit567.grid.width = 12;
    obj.edit567:setFontSize(15);
    obj.edit567:setName("edit567");
    obj.edit567:setHeight(25);

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout278);
    obj.label163:setText(" VEL + AGI + PER");
    obj.label163:setVertTextAlign("trailing");
    obj.label163:setHorzTextAlign("center");
    obj.label163.grid.role = "col";
    obj.label163.grid.width = 12;
    obj.label163:setFontSize(10);
    obj.label163:setTextTrimming("none");
    obj.label163:setWordWrap(true);
    obj.label163:setName("label163");
    obj.label163:setFontColor("#b5b5b5");
    obj.label163:setHeight(25);

    obj.layout279 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout279:setParent(obj.rectangle117);
    obj.layout279.grid.role = "col";
    obj.layout279.grid.width = 2;
    obj.layout279.grid["auto-height"] = true;
    obj.layout279.grid["cnt-horz-align"] = "middle";
    obj.layout279.grid["min-width"] = 35;
    obj.layout279:setName("layout279");

    obj.rectangle120 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle120:setParent(obj.layout279);
    lfm_setPropAsString(obj.rectangle120, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle120.grid.role = "col";
    obj.rectangle120.grid.width = 12;
    obj.rectangle120.grid["auto-height"] = true;
    obj.rectangle120:setXradius(10);
    obj.rectangle120:setYradius(10);
    obj.rectangle120:setCornerType("bevel");
    obj.rectangle120.grid["min-height"] = 30;
    obj.rectangle120.grid["margin-bottom"] = 0;
    obj.rectangle120:setName("rectangle120");
    obj.rectangle120:setStrokeColor("#343434");
    obj.rectangle120:setStrokeSize(2);
    obj.rectangle120:setColor("#1f1e1e");
    obj.rectangle120.grid["padding-top"] = 5;
    obj.rectangle120.grid["padding-left"] = 8;
    obj.rectangle120.grid["padding-right"] = 8;
    obj.rectangle120.grid["padding-bottom"] = 5;

    obj.edit568 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit568:setParent(obj.rectangle120);
    obj.edit568:setField("cam_MOD. EQUIP +");
    obj.edit568:setTransparent(true);
    obj.edit568:setHorzTextAlign("center");
    obj.edit568:setVertTextAlign("center");
    obj.edit568.grid.role = "col";
    obj.edit568.grid.width = 12;
    obj.edit568:setFontSize(15);
    obj.edit568:setName("edit568");
    obj.edit568:setHeight(25);

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout279);
    obj.label164:setText("MOD. EQUIP +");
    obj.label164:setVertTextAlign("trailing");
    obj.label164:setHorzTextAlign("center");
    obj.label164.grid.role = "col";
    obj.label164.grid.width = 12;
    obj.label164:setFontSize(10);
    obj.label164:setTextTrimming("none");
    obj.label164:setWordWrap(true);
    obj.label164:setName("label164");
    obj.label164:setFontColor("#b5b5b5");
    obj.label164:setHeight(25);

    obj.layout280 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout280:setParent(obj.rectangle117);
    obj.layout280.grid.role = "col";
    obj.layout280.grid.width = 2;
    obj.layout280.grid["auto-height"] = true;
    obj.layout280.grid["cnt-horz-align"] = "middle";
    obj.layout280.grid["min-width"] = 35;
    obj.layout280:setName("layout280");

    obj.rectangle121 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle121:setParent(obj.layout280);
    lfm_setPropAsString(obj.rectangle121, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle121.grid.role = "col";
    obj.rectangle121.grid.width = 12;
    obj.rectangle121.grid["auto-height"] = true;
    obj.rectangle121:setXradius(10);
    obj.rectangle121:setYradius(10);
    obj.rectangle121:setCornerType("bevel");
    obj.rectangle121.grid["min-height"] = 30;
    obj.rectangle121.grid["margin-bottom"] = 0;
    obj.rectangle121:setName("rectangle121");
    obj.rectangle121:setStrokeColor("#343434");
    obj.rectangle121:setStrokeSize(2);
    obj.rectangle121:setColor("#1f1e1e");
    obj.rectangle121.grid["padding-top"] = 5;
    obj.rectangle121.grid["padding-left"] = 8;
    obj.rectangle121.grid["padding-right"] = 8;
    obj.rectangle121.grid["padding-bottom"] = 5;

    obj.edit569 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit569:setParent(obj.rectangle121);
    obj.edit569:setField("cam_OUTRO");
    obj.edit569:setTransparent(true);
    obj.edit569:setHorzTextAlign("center");
    obj.edit569:setVertTextAlign("center");
    obj.edit569.grid.role = "col";
    obj.edit569.grid.width = 12;
    obj.edit569:setFontSize(15);
    obj.edit569:setName("edit569");
    obj.edit569:setHeight(25);

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout280);
    obj.label165:setText("OUTRO");
    obj.label165:setVertTextAlign("trailing");
    obj.label165:setHorzTextAlign("center");
    obj.label165.grid.role = "col";
    obj.label165.grid.width = 12;
    obj.label165:setFontSize(10);
    obj.label165:setTextTrimming("none");
    obj.label165:setWordWrap(true);
    obj.label165:setName("label165");
    obj.label165:setFontColor("#b5b5b5");
    obj.label165:setHeight(25);

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.rectangle117);
    obj.label166:setText("=");
    obj.label166.grid.role = "col";
    obj.label166.grid.width = 1;
    obj.label166:setHorzTextAlign("center");
    obj.label166:setName("label166");
    obj.label166:setFontColor("#b5b5b5");
    obj.label166:setHeight(25);

    obj.layout281 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout281:setParent(obj.rectangle117);
    obj.layout281.grid.role = "col";
    obj.layout281.grid.width = 3;
    obj.layout281.grid["auto-height"] = true;
    obj.layout281.grid["cnt-horz-align"] = "middle";
    obj.layout281.grid["cnt-vert-align"] = "bottom";
    obj.layout281:setName("layout281");

    obj.rectangle122 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle122:setParent(obj.layout281);
    lfm_setPropAsString(obj.rectangle122, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle122.grid.role = "col";
    obj.rectangle122.grid.width = 12;
    obj.rectangle122.grid["auto-height"] = true;
    obj.rectangle122.grid["min-width"] = 30;
    obj.rectangle122:setName("rectangle122");
    obj.rectangle122:setCornerType("round");
    obj.rectangle122:setXradius(15);
    obj.rectangle122:setYradius(15);
    obj.rectangle122:setStrokeColor("#343434");
    obj.rectangle122:setStrokeSize(2);
    obj.rectangle122:setColor("#1f1e1e");
    obj.rectangle122.grid["padding-top"] = 5;
    obj.rectangle122.grid["padding-left"] = 8;
    obj.rectangle122.grid["padding-right"] = 8;
    obj.rectangle122.grid["padding-bottom"] = 5;

    obj.edit570 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit570:setParent(obj.rectangle122);
    obj.edit570:setField("cam_DEFESA or 0");
    obj.edit570:setHorzTextAlign("center");
    obj.edit570:setVertTextAlign("center");
    obj.edit570:setTransparent(true);
    obj.edit570.grid.role = "col";
    obj.edit570.grid.width = 12;
    obj.edit570:setFontSize(20);
    obj.edit570:setName("edit570");
    obj.edit570:setHeight(25);

    obj.button137 = GUI.fromHandle(_obj_newObject("button"));
    obj.button137:setParent(obj.layout281);
    obj.button137:setText("DEFESA");
    obj.button137:setHorzTextAlign("center");
    obj.button137.grid.role = "col";
    obj.button137.grid.width = 12;
    obj.button137:setFontSize(10);
    obj.button137:setName("button137");

    obj.rectangle123 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle123:setParent(obj.layout255);
    obj.rectangle123.grid.role = "col";
    obj.rectangle123.grid.width = 12;
    obj.rectangle123.grid["auto-height"] = true;
    obj.rectangle123.grid["cnt-horz-align"] = "right";
    obj.rectangle123.grid["margin-bottom"] = 5;
    obj.rectangle123.grid["cnt-gutter"] = 5;
    obj.rectangle123:setName("rectangle123");
    lfm_setPropAsString(obj.rectangle123, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle123:setCornerType("round");
    obj.rectangle123:setXradius(15);
    obj.rectangle123:setYradius(15);
    obj.rectangle123:setStrokeColor("#343434");
    obj.rectangle123:setStrokeSize(2);
    obj.rectangle123:setColor("#1f1e1e");
    obj.rectangle123.grid["padding-top"] = 5;
    obj.rectangle123.grid["padding-left"] = 8;
    obj.rectangle123.grid["padding-right"] = 8;
    obj.rectangle123.grid["padding-bottom"] = 5;

    obj.rectangle124 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle124:setParent(obj.rectangle123);
    obj.rectangle124:setColor("grey");
    obj.rectangle124:setXradius(0);
    obj.rectangle124:setYradius(0);
    obj.rectangle124.grid.role = "row";
    obj.rectangle124.grid.width = 12;
    obj.rectangle124.grid["cnt-vert-align"] = "center";
    obj.rectangle124.grid["max-height"] = 23;
    obj.rectangle124.grid["margin-bottom"] = 5;
    obj.rectangle124.grid["margin-top"] = -5;
    obj.rectangle124.grid["margin-left"] = -5;
    obj.rectangle124.grid["margin-right"] = -5;
    obj.rectangle124:setName("rectangle124");
    lfm_setPropAsString(obj.rectangle124, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle124:setCornerType("round");
    obj.rectangle124:setStrokeColor("#343434");
    obj.rectangle124:setStrokeSize(2);
    obj.rectangle124.grid["padding-top"] = 5;
    obj.rectangle124.grid["padding-left"] = 8;
    obj.rectangle124.grid["padding-right"] = 8;
    obj.rectangle124.grid["padding-bottom"] = 5;

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.rectangle124);
    obj.label167:setText("ARMADURA");
    obj.label167:setHorzTextAlign("leading");
    obj.label167:setFontSize(15);
    lfm_setPropAsString(obj.label167, "fontStyle", "bold");
    obj.label167.grid.role = "col";
    obj.label167:setFontColor("black");
    obj.label167.grid["dyn-width-txt"] = true;
    obj.label167:setName("label167");
    obj.label167:setHeight(25);

    obj.layout282 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout282:setParent(obj.rectangle123);
    obj.layout282.grid.role = "col";
    obj.layout282.grid.width = 2;
    obj.layout282.grid["auto-height"] = true;
    obj.layout282.grid["cnt-horz-align"] = "middle";
    obj.layout282.grid["min-width"] = 35;
    obj.layout282:setName("layout282");

    obj.rectangle125 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle125:setParent(obj.layout282);
    lfm_setPropAsString(obj.rectangle125, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle125.grid.role = "col";
    obj.rectangle125.grid.width = 12;
    obj.rectangle125.grid["auto-height"] = true;
    obj.rectangle125:setXradius(10);
    obj.rectangle125:setYradius(10);
    obj.rectangle125:setCornerType("bevel");
    obj.rectangle125.grid["min-height"] = 30;
    obj.rectangle125.grid["margin-bottom"] = 0;
    obj.rectangle125:setName("rectangle125");
    obj.rectangle125:setStrokeColor("#343434");
    obj.rectangle125:setStrokeSize(2);
    obj.rectangle125:setColor("#1f1e1e");
    obj.rectangle125.grid["padding-top"] = 5;
    obj.rectangle125.grid["padding-left"] = 8;
    obj.rectangle125.grid["padding-right"] = 8;
    obj.rectangle125.grid["padding-bottom"] = 5;

    obj.edit571 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit571:setParent(obj.rectangle125);
    obj.edit571:setField("cam_FIS +");
    obj.edit571:setTransparent(true);
    obj.edit571:setHorzTextAlign("center");
    obj.edit571:setVertTextAlign("center");
    obj.edit571.grid.role = "col";
    obj.edit571.grid.width = 12;
    obj.edit571:setFontSize(15);
    obj.edit571:setName("edit571");
    obj.edit571:setHeight(25);

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout282);
    obj.label168:setText("FIS +");
    obj.label168:setVertTextAlign("trailing");
    obj.label168:setHorzTextAlign("center");
    obj.label168.grid.role = "col";
    obj.label168.grid.width = 12;
    obj.label168:setFontSize(10);
    obj.label168:setTextTrimming("none");
    obj.label168:setWordWrap(true);
    obj.label168:setName("label168");
    obj.label168:setFontColor("#b5b5b5");
    obj.label168:setHeight(25);

    obj.layout283 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout283:setParent(obj.rectangle123);
    obj.layout283.grid.role = "col";
    obj.layout283.grid.width = 2;
    obj.layout283.grid["auto-height"] = true;
    obj.layout283.grid["cnt-horz-align"] = "middle";
    obj.layout283.grid["min-width"] = 35;
    obj.layout283:setName("layout283");

    obj.rectangle126 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle126:setParent(obj.layout283);
    lfm_setPropAsString(obj.rectangle126, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle126.grid.role = "col";
    obj.rectangle126.grid.width = 12;
    obj.rectangle126.grid["auto-height"] = true;
    obj.rectangle126:setXradius(10);
    obj.rectangle126:setYradius(10);
    obj.rectangle126:setCornerType("bevel");
    obj.rectangle126.grid["min-height"] = 30;
    obj.rectangle126.grid["margin-bottom"] = 0;
    obj.rectangle126:setName("rectangle126");
    obj.rectangle126:setStrokeColor("#343434");
    obj.rectangle126:setStrokeSize(2);
    obj.rectangle126:setColor("#1f1e1e");
    obj.rectangle126.grid["padding-top"] = 5;
    obj.rectangle126.grid["padding-left"] = 8;
    obj.rectangle126.grid["padding-right"] = 8;
    obj.rectangle126.grid["padding-bottom"] = 5;

    obj.edit572 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit572:setParent(obj.rectangle126);
    obj.edit572:setField("cam_MOD. ARM +");
    obj.edit572:setTransparent(true);
    obj.edit572:setHorzTextAlign("center");
    obj.edit572:setVertTextAlign("center");
    obj.edit572.grid.role = "col";
    obj.edit572.grid.width = 12;
    obj.edit572:setFontSize(15);
    obj.edit572:setName("edit572");
    obj.edit572:setHeight(25);

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout283);
    obj.label169:setText("MOD. ARM +");
    obj.label169:setVertTextAlign("trailing");
    obj.label169:setHorzTextAlign("center");
    obj.label169.grid.role = "col";
    obj.label169.grid.width = 12;
    obj.label169:setFontSize(10);
    obj.label169:setTextTrimming("none");
    obj.label169:setWordWrap(true);
    obj.label169:setName("label169");
    obj.label169:setFontColor("#b5b5b5");
    obj.label169:setHeight(25);

    obj.layout284 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout284:setParent(obj.rectangle123);
    obj.layout284.grid.role = "col";
    obj.layout284.grid.width = 2;
    obj.layout284.grid["auto-height"] = true;
    obj.layout284.grid["cnt-horz-align"] = "middle";
    obj.layout284.grid["min-width"] = 35;
    obj.layout284:setName("layout284");

    obj.rectangle127 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle127:setParent(obj.layout284);
    lfm_setPropAsString(obj.rectangle127, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle127.grid.role = "col";
    obj.rectangle127.grid.width = 12;
    obj.rectangle127.grid["auto-height"] = true;
    obj.rectangle127:setXradius(10);
    obj.rectangle127:setYradius(10);
    obj.rectangle127:setCornerType("bevel");
    obj.rectangle127.grid["min-height"] = 30;
    obj.rectangle127.grid["margin-bottom"] = 0;
    obj.rectangle127:setName("rectangle127");
    obj.rectangle127:setStrokeColor("#343434");
    obj.rectangle127:setStrokeSize(2);
    obj.rectangle127:setColor("#1f1e1e");
    obj.rectangle127.grid["padding-top"] = 5;
    obj.rectangle127.grid["padding-left"] = 8;
    obj.rectangle127.grid["padding-right"] = 8;
    obj.rectangle127.grid["padding-bottom"] = 5;

    obj.edit573 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit573:setParent(obj.rectangle127);
    obj.edit573:setField("cam_MOD. ESCUDO +");
    obj.edit573:setTransparent(true);
    obj.edit573:setHorzTextAlign("center");
    obj.edit573:setVertTextAlign("center");
    obj.edit573.grid.role = "col";
    obj.edit573.grid.width = 12;
    obj.edit573:setFontSize(15);
    obj.edit573:setName("edit573");
    obj.edit573:setHeight(25);

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout284);
    obj.label170:setText("MOD. ESCUDO +");
    obj.label170:setVertTextAlign("trailing");
    obj.label170:setHorzTextAlign("center");
    obj.label170.grid.role = "col";
    obj.label170.grid.width = 12;
    obj.label170:setFontSize(10);
    obj.label170:setTextTrimming("none");
    obj.label170:setWordWrap(true);
    obj.label170:setName("label170");
    obj.label170:setFontColor("#b5b5b5");
    obj.label170:setHeight(25);

    obj.layout285 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout285:setParent(obj.rectangle123);
    obj.layout285.grid.role = "col";
    obj.layout285.grid.width = 2;
    obj.layout285.grid["auto-height"] = true;
    obj.layout285.grid["cnt-horz-align"] = "middle";
    obj.layout285.grid["min-width"] = 35;
    obj.layout285:setName("layout285");

    obj.rectangle128 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle128:setParent(obj.layout285);
    lfm_setPropAsString(obj.rectangle128, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle128.grid.role = "col";
    obj.rectangle128.grid.width = 12;
    obj.rectangle128.grid["auto-height"] = true;
    obj.rectangle128:setXradius(10);
    obj.rectangle128:setYradius(10);
    obj.rectangle128:setCornerType("bevel");
    obj.rectangle128.grid["min-height"] = 30;
    obj.rectangle128.grid["margin-bottom"] = 0;
    obj.rectangle128:setName("rectangle128");
    obj.rectangle128:setStrokeColor("#343434");
    obj.rectangle128:setStrokeSize(2);
    obj.rectangle128:setColor("#1f1e1e");
    obj.rectangle128.grid["padding-top"] = 5;
    obj.rectangle128.grid["padding-left"] = 8;
    obj.rectangle128.grid["padding-right"] = 8;
    obj.rectangle128.grid["padding-bottom"] = 5;

    obj.edit574 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit574:setParent(obj.rectangle128);
    obj.edit574:setField("cam_OUTRO ");
    obj.edit574:setTransparent(true);
    obj.edit574:setHorzTextAlign("center");
    obj.edit574:setVertTextAlign("center");
    obj.edit574.grid.role = "col";
    obj.edit574.grid.width = 12;
    obj.edit574:setFontSize(15);
    obj.edit574:setName("edit574");
    obj.edit574:setHeight(25);

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout285);
    obj.label171:setText("OUTRO ");
    obj.label171:setVertTextAlign("trailing");
    obj.label171:setHorzTextAlign("center");
    obj.label171.grid.role = "col";
    obj.label171.grid.width = 12;
    obj.label171:setFontSize(10);
    obj.label171:setTextTrimming("none");
    obj.label171:setWordWrap(true);
    obj.label171:setName("label171");
    obj.label171:setFontColor("#b5b5b5");
    obj.label171:setHeight(25);

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.rectangle123);
    obj.label172:setText("=");
    obj.label172.grid.role = "col";
    obj.label172.grid.width = 1;
    obj.label172:setHorzTextAlign("center");
    obj.label172:setName("label172");
    obj.label172:setFontColor("#b5b5b5");
    obj.label172:setHeight(25);

    obj.layout286 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout286:setParent(obj.rectangle123);
    obj.layout286.grid.role = "col";
    obj.layout286.grid.width = 3;
    obj.layout286.grid["auto-height"] = true;
    obj.layout286.grid["cnt-horz-align"] = "middle";
    obj.layout286.grid["cnt-vert-align"] = "bottom";
    obj.layout286:setName("layout286");

    obj.rectangle129 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle129:setParent(obj.layout286);
    lfm_setPropAsString(obj.rectangle129, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle129.grid.role = "col";
    obj.rectangle129.grid.width = 12;
    obj.rectangle129.grid["auto-height"] = true;
    obj.rectangle129.grid["min-width"] = 30;
    obj.rectangle129:setName("rectangle129");
    obj.rectangle129:setCornerType("round");
    obj.rectangle129:setXradius(15);
    obj.rectangle129:setYradius(15);
    obj.rectangle129:setStrokeColor("#343434");
    obj.rectangle129:setStrokeSize(2);
    obj.rectangle129:setColor("#1f1e1e");
    obj.rectangle129.grid["padding-top"] = 5;
    obj.rectangle129.grid["padding-left"] = 8;
    obj.rectangle129.grid["padding-right"] = 8;
    obj.rectangle129.grid["padding-bottom"] = 5;

    obj.edit575 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit575:setParent(obj.rectangle129);
    obj.edit575:setField("cam_ARMADURA or 0");
    obj.edit575:setHorzTextAlign("center");
    obj.edit575:setVertTextAlign("center");
    obj.edit575:setTransparent(true);
    obj.edit575.grid.role = "col";
    obj.edit575.grid.width = 12;
    obj.edit575:setFontSize(20);
    obj.edit575:setName("edit575");
    obj.edit575:setHeight(25);

    obj.button138 = GUI.fromHandle(_obj_newObject("button"));
    obj.button138:setParent(obj.layout286);
    obj.button138:setText("ARMADURA");
    obj.button138:setHorzTextAlign("center");
    obj.button138.grid.role = "col";
    obj.button138.grid.width = 12;
    obj.button138:setFontSize(10);
    obj.button138:setName("button138");

    obj.layout287 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout287:setParent(obj.layout237);
    obj.layout287.grid.role = "col";
    obj.layout287.grid.width = 3;
    obj.layout287.grid["auto-height"] = true;
    obj.layout287:setName("layout287");

    obj.rectangle130 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle130:setParent(obj.layout287);
    obj.rectangle130.grid.role = "col";
    obj.rectangle130.grid.width = 12;
    obj.rectangle130.grid["min-height"] = 100;
    obj.rectangle130.grid["auto-height"] = true;
    obj.rectangle130:setName("rectangle130");
    lfm_setPropAsString(obj.rectangle130, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle130:setCornerType("round");
    obj.rectangle130:setXradius(15);
    obj.rectangle130:setYradius(15);
    obj.rectangle130:setStrokeColor("#343434");
    obj.rectangle130:setStrokeSize(2);
    obj.rectangle130:setColor("#1f1e1e");
    obj.rectangle130.grid["padding-top"] = 5;
    obj.rectangle130.grid["padding-left"] = 8;
    obj.rectangle130.grid["padding-right"] = 8;
    obj.rectangle130.grid["padding-bottom"] = 5;

    obj.rectangle131 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle131:setParent(obj.rectangle130);
    obj.rectangle131:setColor("grey");
    obj.rectangle131:setXradius(0);
    obj.rectangle131:setYradius(0);
    obj.rectangle131.grid.role = "col";
    obj.rectangle131.grid.width = 12;
    obj.rectangle131.grid["cnt-vert-align"] = "center";
    obj.rectangle131.grid["max-height"] = 23;
    obj.rectangle131.grid["margin-bottom"] = 5;
    obj.rectangle131.grid["margin-top"] = -5;
    obj.rectangle131.grid["margin-left"] = -5;
    obj.rectangle131.grid["margin-right"] = -5;
    obj.rectangle131:setName("rectangle131");
    lfm_setPropAsString(obj.rectangle131, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle131:setCornerType("round");
    obj.rectangle131:setStrokeColor("#343434");
    obj.rectangle131:setStrokeSize(2);
    obj.rectangle131.grid["padding-top"] = 5;
    obj.rectangle131.grid["padding-left"] = 8;
    obj.rectangle131.grid["padding-right"] = 8;
    obj.rectangle131.grid["padding-bottom"] = 5;

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.rectangle131);
    obj.label173:setText("APRIMORAMENTOS");
    obj.label173:setHorzTextAlign("leading");
    obj.label173:setFontSize(15);
    lfm_setPropAsString(obj.label173, "fontStyle", "bold");
    obj.label173.grid.role = "col";
    obj.label173:setFontColor("black");
    obj.label173.grid["dyn-width-txt"] = true;
    obj.label173:setName("label173");
    obj.label173:setHeight(25);

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.rectangle130);
    obj.label174.grid.role = "col";
    obj.label174.grid.width = 4;
    obj.label174:setText("UPGRADE");
    obj.label174:setName("label174");
    obj.label174:setFontColor("#b5b5b5");
    obj.label174:setHeight(25);

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.rectangle130);
    obj.label175.grid.role = "col";
    obj.label175.grid.width = 8;
    obj.label175:setText("DESCRIÇÃO");
    obj.label175:setName("label175");
    obj.label175:setFontColor("#b5b5b5");
    obj.label175:setHeight(25);

    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.rectangle130);
    obj.scrollBox9.grid.role = "col";
    obj.scrollBox9.grid.width = 12;
    obj.scrollBox9.grid["min-height"] = 200;
    obj.scrollBox9:setName("scrollBox9");

    obj.layout288 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout288:setParent(obj.scrollBox9);
    obj.layout288.grid.role = "col";
    obj.layout288.grid.width = 12;
    obj.layout288.grid["auto-height"] = true;
    obj.layout288.grid["padding-bottom"] = 20;
    obj.layout288:setName("layout288");

    obj.edit576 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit576:setParent(obj.layout288);
    obj.edit576:setTransparent(true);
    obj.edit576.grid.role = "col";
    obj.edit576.grid.width = 4;
    obj.edit576:setName("edit576");
    obj.edit576:setHeight(25);

    obj.edit577 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit577:setParent(obj.layout288);
    obj.edit577:setTransparent(true);
    obj.edit577.grid.role = "col";
    obj.edit577.grid.width = 8;
    obj.edit577:setName("edit577");
    obj.edit577:setHeight(25);

    obj.horzLine159 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine159:setParent(obj.layout288);
    obj.horzLine159.grid.role = "col";
    obj.horzLine159.grid.width = 12;
    obj.horzLine159:setName("horzLine159");
    obj.horzLine159:setStrokeColor("grey");

    obj.edit578 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit578:setParent(obj.layout288);
    obj.edit578:setTransparent(true);
    obj.edit578.grid.role = "col";
    obj.edit578.grid.width = 4;
    obj.edit578:setName("edit578");
    obj.edit578:setHeight(25);

    obj.edit579 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit579:setParent(obj.layout288);
    obj.edit579:setTransparent(true);
    obj.edit579.grid.role = "col";
    obj.edit579.grid.width = 8;
    obj.edit579:setName("edit579");
    obj.edit579:setHeight(25);

    obj.horzLine160 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine160:setParent(obj.layout288);
    obj.horzLine160.grid.role = "col";
    obj.horzLine160.grid.width = 12;
    obj.horzLine160:setName("horzLine160");
    obj.horzLine160:setStrokeColor("grey");

    obj.edit580 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit580:setParent(obj.layout288);
    obj.edit580:setTransparent(true);
    obj.edit580.grid.role = "col";
    obj.edit580.grid.width = 4;
    obj.edit580:setName("edit580");
    obj.edit580:setHeight(25);

    obj.edit581 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit581:setParent(obj.layout288);
    obj.edit581:setTransparent(true);
    obj.edit581.grid.role = "col";
    obj.edit581.grid.width = 8;
    obj.edit581:setName("edit581");
    obj.edit581:setHeight(25);

    obj.horzLine161 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine161:setParent(obj.layout288);
    obj.horzLine161.grid.role = "col";
    obj.horzLine161.grid.width = 12;
    obj.horzLine161:setName("horzLine161");
    obj.horzLine161:setStrokeColor("grey");

    obj.edit582 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit582:setParent(obj.layout288);
    obj.edit582:setTransparent(true);
    obj.edit582.grid.role = "col";
    obj.edit582.grid.width = 4;
    obj.edit582:setName("edit582");
    obj.edit582:setHeight(25);

    obj.edit583 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit583:setParent(obj.layout288);
    obj.edit583:setTransparent(true);
    obj.edit583.grid.role = "col";
    obj.edit583.grid.width = 8;
    obj.edit583:setName("edit583");
    obj.edit583:setHeight(25);

    obj.horzLine162 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine162:setParent(obj.layout288);
    obj.horzLine162.grid.role = "col";
    obj.horzLine162.grid.width = 12;
    obj.horzLine162:setName("horzLine162");
    obj.horzLine162:setStrokeColor("grey");

    obj.edit584 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit584:setParent(obj.layout288);
    obj.edit584:setTransparent(true);
    obj.edit584.grid.role = "col";
    obj.edit584.grid.width = 4;
    obj.edit584:setName("edit584");
    obj.edit584:setHeight(25);

    obj.edit585 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit585:setParent(obj.layout288);
    obj.edit585:setTransparent(true);
    obj.edit585.grid.role = "col";
    obj.edit585.grid.width = 8;
    obj.edit585:setName("edit585");
    obj.edit585:setHeight(25);

    obj.horzLine163 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine163:setParent(obj.layout288);
    obj.horzLine163.grid.role = "col";
    obj.horzLine163.grid.width = 12;
    obj.horzLine163:setName("horzLine163");
    obj.horzLine163:setStrokeColor("grey");

    obj.edit586 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit586:setParent(obj.layout288);
    obj.edit586:setTransparent(true);
    obj.edit586.grid.role = "col";
    obj.edit586.grid.width = 4;
    obj.edit586:setName("edit586");
    obj.edit586:setHeight(25);

    obj.edit587 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit587:setParent(obj.layout288);
    obj.edit587:setTransparent(true);
    obj.edit587.grid.role = "col";
    obj.edit587.grid.width = 8;
    obj.edit587:setName("edit587");
    obj.edit587:setHeight(25);

    obj.horzLine164 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine164:setParent(obj.layout288);
    obj.horzLine164.grid.role = "col";
    obj.horzLine164.grid.width = 12;
    obj.horzLine164:setName("horzLine164");
    obj.horzLine164:setStrokeColor("grey");

    obj.edit588 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit588:setParent(obj.layout288);
    obj.edit588:setTransparent(true);
    obj.edit588.grid.role = "col";
    obj.edit588.grid.width = 4;
    obj.edit588:setName("edit588");
    obj.edit588:setHeight(25);

    obj.edit589 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit589:setParent(obj.layout288);
    obj.edit589:setTransparent(true);
    obj.edit589.grid.role = "col";
    obj.edit589.grid.width = 8;
    obj.edit589:setName("edit589");
    obj.edit589:setHeight(25);

    obj.horzLine165 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine165:setParent(obj.layout288);
    obj.horzLine165.grid.role = "col";
    obj.horzLine165.grid.width = 12;
    obj.horzLine165:setName("horzLine165");
    obj.horzLine165:setStrokeColor("grey");

    obj.edit590 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit590:setParent(obj.layout288);
    obj.edit590:setTransparent(true);
    obj.edit590.grid.role = "col";
    obj.edit590.grid.width = 4;
    obj.edit590:setName("edit590");
    obj.edit590:setHeight(25);

    obj.edit591 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit591:setParent(obj.layout288);
    obj.edit591:setTransparent(true);
    obj.edit591.grid.role = "col";
    obj.edit591.grid.width = 8;
    obj.edit591:setName("edit591");
    obj.edit591:setHeight(25);

    obj.horzLine166 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine166:setParent(obj.layout288);
    obj.horzLine166.grid.role = "col";
    obj.horzLine166.grid.width = 12;
    obj.horzLine166:setName("horzLine166");
    obj.horzLine166:setStrokeColor("grey");

    obj.edit592 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit592:setParent(obj.layout288);
    obj.edit592:setTransparent(true);
    obj.edit592.grid.role = "col";
    obj.edit592.grid.width = 4;
    obj.edit592:setName("edit592");
    obj.edit592:setHeight(25);

    obj.edit593 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit593:setParent(obj.layout288);
    obj.edit593:setTransparent(true);
    obj.edit593.grid.role = "col";
    obj.edit593.grid.width = 8;
    obj.edit593:setName("edit593");
    obj.edit593:setHeight(25);

    obj.horzLine167 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine167:setParent(obj.layout288);
    obj.horzLine167.grid.role = "col";
    obj.horzLine167.grid.width = 12;
    obj.horzLine167:setName("horzLine167");
    obj.horzLine167:setStrokeColor("grey");

    obj.edit594 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit594:setParent(obj.layout288);
    obj.edit594:setTransparent(true);
    obj.edit594.grid.role = "col";
    obj.edit594.grid.width = 4;
    obj.edit594:setName("edit594");
    obj.edit594:setHeight(25);

    obj.edit595 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit595:setParent(obj.layout288);
    obj.edit595:setTransparent(true);
    obj.edit595.grid.role = "col";
    obj.edit595.grid.width = 8;
    obj.edit595:setName("edit595");
    obj.edit595:setHeight(25);

    obj.horzLine168 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine168:setParent(obj.layout288);
    obj.horzLine168.grid.role = "col";
    obj.horzLine168.grid.width = 12;
    obj.horzLine168:setName("horzLine168");
    obj.horzLine168:setStrokeColor("grey");

    obj.rectangle132 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle132:setParent(obj.layout287);
    obj.rectangle132.grid.role = "col";
    obj.rectangle132.grid.width = 12;
    obj.rectangle132.grid["min-height"] = 100;
    obj.rectangle132.grid["auto-height"] = true;
    obj.rectangle132:setName("rectangle132");
    lfm_setPropAsString(obj.rectangle132, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle132:setCornerType("round");
    obj.rectangle132:setXradius(15);
    obj.rectangle132:setYradius(15);
    obj.rectangle132:setStrokeColor("#343434");
    obj.rectangle132:setStrokeSize(2);
    obj.rectangle132:setColor("#1f1e1e");
    obj.rectangle132.grid["padding-top"] = 5;
    obj.rectangle132.grid["padding-left"] = 8;
    obj.rectangle132.grid["padding-right"] = 8;
    obj.rectangle132.grid["padding-bottom"] = 5;

    obj.rectangle133 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle133:setParent(obj.rectangle132);
    obj.rectangle133:setColor("grey");
    obj.rectangle133:setXradius(0);
    obj.rectangle133:setYradius(0);
    obj.rectangle133.grid.role = "col";
    obj.rectangle133.grid.width = 12;
    obj.rectangle133.grid["cnt-vert-align"] = "center";
    obj.rectangle133.grid["max-height"] = 23;
    obj.rectangle133.grid["margin-bottom"] = 5;
    obj.rectangle133.grid["margin-top"] = -5;
    obj.rectangle133.grid["margin-left"] = -5;
    obj.rectangle133.grid["margin-right"] = -5;
    obj.rectangle133:setName("rectangle133");
    lfm_setPropAsString(obj.rectangle133, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle133:setCornerType("round");
    obj.rectangle133:setStrokeColor("#343434");
    obj.rectangle133:setStrokeSize(2);
    obj.rectangle133.grid["padding-top"] = 5;
    obj.rectangle133.grid["padding-left"] = 8;
    obj.rectangle133.grid["padding-right"] = 8;
    obj.rectangle133.grid["padding-bottom"] = 5;

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.rectangle133);
    obj.label176:setText("EQUIPAMENTO");
    obj.label176:setHorzTextAlign("leading");
    obj.label176:setFontSize(15);
    lfm_setPropAsString(obj.label176, "fontStyle", "bold");
    obj.label176.grid.role = "col";
    obj.label176:setFontColor("black");
    obj.label176.grid["dyn-width-txt"] = true;
    obj.label176:setName("label176");
    obj.label176:setHeight(25);

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.rectangle132);
    obj.label177.grid.role = "col";
    obj.label177.grid.width = 4;
    obj.label177:setText("EQUIPAMENTO");
    obj.label177:setName("label177");
    obj.label177:setFontColor("#b5b5b5");
    obj.label177:setHeight(25);

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.rectangle132);
    obj.label178.grid.role = "col";
    obj.label178.grid.width = 8;
    obj.label178:setText("DESCRIÇÃO");
    obj.label178:setName("label178");
    obj.label178:setFontColor("#b5b5b5");
    obj.label178:setHeight(25);

    obj.scrollBox10 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.rectangle132);
    obj.scrollBox10.grid.role = "col";
    obj.scrollBox10.grid.width = 12;
    obj.scrollBox10.grid["min-height"] = 200;
    obj.scrollBox10:setName("scrollBox10");

    obj.layout289 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout289:setParent(obj.scrollBox10);
    obj.layout289.grid.role = "col";
    obj.layout289.grid.width = 12;
    obj.layout289.grid["auto-height"] = true;
    obj.layout289.grid["padding-bottom"] = 20;
    obj.layout289:setName("layout289");

    obj.edit596 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit596:setParent(obj.layout289);
    obj.edit596:setTransparent(true);
    obj.edit596.grid.role = "col";
    obj.edit596.grid.width = 4;
    obj.edit596:setName("edit596");
    obj.edit596:setHeight(25);

    obj.edit597 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit597:setParent(obj.layout289);
    obj.edit597:setTransparent(true);
    obj.edit597.grid.role = "col";
    obj.edit597.grid.width = 8;
    obj.edit597:setName("edit597");
    obj.edit597:setHeight(25);

    obj.horzLine169 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine169:setParent(obj.layout289);
    obj.horzLine169.grid.role = "col";
    obj.horzLine169.grid.width = 12;
    obj.horzLine169:setName("horzLine169");
    obj.horzLine169:setStrokeColor("grey");

    obj.edit598 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit598:setParent(obj.layout289);
    obj.edit598:setTransparent(true);
    obj.edit598.grid.role = "col";
    obj.edit598.grid.width = 4;
    obj.edit598:setName("edit598");
    obj.edit598:setHeight(25);

    obj.edit599 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit599:setParent(obj.layout289);
    obj.edit599:setTransparent(true);
    obj.edit599.grid.role = "col";
    obj.edit599.grid.width = 8;
    obj.edit599:setName("edit599");
    obj.edit599:setHeight(25);

    obj.horzLine170 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine170:setParent(obj.layout289);
    obj.horzLine170.grid.role = "col";
    obj.horzLine170.grid.width = 12;
    obj.horzLine170:setName("horzLine170");
    obj.horzLine170:setStrokeColor("grey");

    obj.edit600 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit600:setParent(obj.layout289);
    obj.edit600:setTransparent(true);
    obj.edit600.grid.role = "col";
    obj.edit600.grid.width = 4;
    obj.edit600:setName("edit600");
    obj.edit600:setHeight(25);

    obj.edit601 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit601:setParent(obj.layout289);
    obj.edit601:setTransparent(true);
    obj.edit601.grid.role = "col";
    obj.edit601.grid.width = 8;
    obj.edit601:setName("edit601");
    obj.edit601:setHeight(25);

    obj.horzLine171 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine171:setParent(obj.layout289);
    obj.horzLine171.grid.role = "col";
    obj.horzLine171.grid.width = 12;
    obj.horzLine171:setName("horzLine171");
    obj.horzLine171:setStrokeColor("grey");

    obj.edit602 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit602:setParent(obj.layout289);
    obj.edit602:setTransparent(true);
    obj.edit602.grid.role = "col";
    obj.edit602.grid.width = 4;
    obj.edit602:setName("edit602");
    obj.edit602:setHeight(25);

    obj.edit603 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit603:setParent(obj.layout289);
    obj.edit603:setTransparent(true);
    obj.edit603.grid.role = "col";
    obj.edit603.grid.width = 8;
    obj.edit603:setName("edit603");
    obj.edit603:setHeight(25);

    obj.horzLine172 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine172:setParent(obj.layout289);
    obj.horzLine172.grid.role = "col";
    obj.horzLine172.grid.width = 12;
    obj.horzLine172:setName("horzLine172");
    obj.horzLine172:setStrokeColor("grey");

    obj.edit604 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit604:setParent(obj.layout289);
    obj.edit604:setTransparent(true);
    obj.edit604.grid.role = "col";
    obj.edit604.grid.width = 4;
    obj.edit604:setName("edit604");
    obj.edit604:setHeight(25);

    obj.edit605 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit605:setParent(obj.layout289);
    obj.edit605:setTransparent(true);
    obj.edit605.grid.role = "col";
    obj.edit605.grid.width = 8;
    obj.edit605:setName("edit605");
    obj.edit605:setHeight(25);

    obj.horzLine173 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine173:setParent(obj.layout289);
    obj.horzLine173.grid.role = "col";
    obj.horzLine173.grid.width = 12;
    obj.horzLine173:setName("horzLine173");
    obj.horzLine173:setStrokeColor("grey");

    obj.edit606 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit606:setParent(obj.layout289);
    obj.edit606:setTransparent(true);
    obj.edit606.grid.role = "col";
    obj.edit606.grid.width = 4;
    obj.edit606:setName("edit606");
    obj.edit606:setHeight(25);

    obj.edit607 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit607:setParent(obj.layout289);
    obj.edit607:setTransparent(true);
    obj.edit607.grid.role = "col";
    obj.edit607.grid.width = 8;
    obj.edit607:setName("edit607");
    obj.edit607:setHeight(25);

    obj.horzLine174 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine174:setParent(obj.layout289);
    obj.horzLine174.grid.role = "col";
    obj.horzLine174.grid.width = 12;
    obj.horzLine174:setName("horzLine174");
    obj.horzLine174:setStrokeColor("grey");

    obj.edit608 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit608:setParent(obj.layout289);
    obj.edit608:setTransparent(true);
    obj.edit608.grid.role = "col";
    obj.edit608.grid.width = 4;
    obj.edit608:setName("edit608");
    obj.edit608:setHeight(25);

    obj.edit609 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit609:setParent(obj.layout289);
    obj.edit609:setTransparent(true);
    obj.edit609.grid.role = "col";
    obj.edit609.grid.width = 8;
    obj.edit609:setName("edit609");
    obj.edit609:setHeight(25);

    obj.horzLine175 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine175:setParent(obj.layout289);
    obj.horzLine175.grid.role = "col";
    obj.horzLine175.grid.width = 12;
    obj.horzLine175:setName("horzLine175");
    obj.horzLine175:setStrokeColor("grey");

    obj.edit610 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit610:setParent(obj.layout289);
    obj.edit610:setTransparent(true);
    obj.edit610.grid.role = "col";
    obj.edit610.grid.width = 4;
    obj.edit610:setName("edit610");
    obj.edit610:setHeight(25);

    obj.edit611 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit611:setParent(obj.layout289);
    obj.edit611:setTransparent(true);
    obj.edit611.grid.role = "col";
    obj.edit611.grid.width = 8;
    obj.edit611:setName("edit611");
    obj.edit611:setHeight(25);

    obj.horzLine176 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine176:setParent(obj.layout289);
    obj.horzLine176.grid.role = "col";
    obj.horzLine176.grid.width = 12;
    obj.horzLine176:setName("horzLine176");
    obj.horzLine176:setStrokeColor("grey");

    obj.edit612 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit612:setParent(obj.layout289);
    obj.edit612:setTransparent(true);
    obj.edit612.grid.role = "col";
    obj.edit612.grid.width = 4;
    obj.edit612:setName("edit612");
    obj.edit612:setHeight(25);

    obj.edit613 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit613:setParent(obj.layout289);
    obj.edit613:setTransparent(true);
    obj.edit613.grid.role = "col";
    obj.edit613.grid.width = 8;
    obj.edit613:setName("edit613");
    obj.edit613:setHeight(25);

    obj.horzLine177 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine177:setParent(obj.layout289);
    obj.horzLine177.grid.role = "col";
    obj.horzLine177.grid.width = 12;
    obj.horzLine177:setName("horzLine177");
    obj.horzLine177:setStrokeColor("grey");

    obj.edit614 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit614:setParent(obj.layout289);
    obj.edit614:setTransparent(true);
    obj.edit614.grid.role = "col";
    obj.edit614.grid.width = 4;
    obj.edit614:setName("edit614");
    obj.edit614:setHeight(25);

    obj.edit615 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit615:setParent(obj.layout289);
    obj.edit615:setTransparent(true);
    obj.edit615.grid.role = "col";
    obj.edit615.grid.width = 8;
    obj.edit615:setName("edit615");
    obj.edit615:setHeight(25);

    obj.horzLine178 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine178:setParent(obj.layout289);
    obj.horzLine178.grid.role = "col";
    obj.horzLine178.grid.width = 12;
    obj.horzLine178:setName("horzLine178");
    obj.horzLine178:setStrokeColor("grey");

    obj.rectangle134 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle134:setParent(obj.layout287);
    obj.rectangle134.grid.role = "col";
    obj.rectangle134.grid.width = 12;
    obj.rectangle134.grid["min-height"] = 100;
    obj.rectangle134.grid["auto-height"] = true;
    obj.rectangle134:setName("rectangle134");
    lfm_setPropAsString(obj.rectangle134, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle134:setCornerType("round");
    obj.rectangle134:setXradius(15);
    obj.rectangle134:setYradius(15);
    obj.rectangle134:setStrokeColor("#343434");
    obj.rectangle134:setStrokeSize(2);
    obj.rectangle134:setColor("#1f1e1e");
    obj.rectangle134.grid["padding-top"] = 5;
    obj.rectangle134.grid["padding-left"] = 8;
    obj.rectangle134.grid["padding-right"] = 8;
    obj.rectangle134.grid["padding-bottom"] = 5;

    obj.rectangle135 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle135:setParent(obj.rectangle134);
    obj.rectangle135:setColor("grey");
    obj.rectangle135:setXradius(0);
    obj.rectangle135:setYradius(0);
    obj.rectangle135.grid.role = "col";
    obj.rectangle135.grid.width = 12;
    obj.rectangle135.grid["cnt-vert-align"] = "center";
    obj.rectangle135.grid["max-height"] = 23;
    obj.rectangle135.grid["margin-bottom"] = 5;
    obj.rectangle135.grid["margin-top"] = -5;
    obj.rectangle135.grid["margin-left"] = -5;
    obj.rectangle135.grid["margin-right"] = -5;
    obj.rectangle135:setName("rectangle135");
    lfm_setPropAsString(obj.rectangle135, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle135:setCornerType("round");
    obj.rectangle135:setStrokeColor("#343434");
    obj.rectangle135:setStrokeSize(2);
    obj.rectangle135.grid["padding-top"] = 5;
    obj.rectangle135.grid["padding-left"] = 8;
    obj.rectangle135.grid["padding-right"] = 8;
    obj.rectangle135.grid["padding-bottom"] = 5;

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.rectangle135);
    obj.label179:setText("DANO CATASTRÓFICO");
    obj.label179:setHorzTextAlign("leading");
    obj.label179:setFontSize(15);
    lfm_setPropAsString(obj.label179, "fontStyle", "bold");
    obj.label179.grid.role = "col";
    obj.label179:setFontColor("black");
    obj.label179.grid["dyn-width-txt"] = true;
    obj.label179:setName("label179");
    obj.label179:setHeight(25);

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.rectangle134);
    obj.label180.grid.role = "col";
    obj.label180.grid.width = 4;
    obj.label180:setText("AREA");
    obj.label180:setName("label180");
    obj.label180:setFontColor("#b5b5b5");
    obj.label180:setHeight(25);

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.rectangle134);
    obj.label181.grid.role = "col";
    obj.label181.grid.width = 8;
    obj.label181:setText("DESCRIÇÃO");
    obj.label181:setName("label181");
    obj.label181:setFontColor("#b5b5b5");
    obj.label181:setHeight(25);

    obj.layout290 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout290:setParent(obj.rectangle134);
    obj.layout290.grid.role = "col";
    obj.layout290.grid.width = 12;
    obj.layout290.grid["auto-height"] = true;
    obj.layout290.grid["padding-bottom"] = 20;
    obj.layout290:setName("layout290");

    obj.edit616 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit616:setParent(obj.layout290);
    obj.edit616:setTransparent(true);
    obj.edit616.grid.role = "col";
    obj.edit616.grid.width = 4;
    obj.edit616:setName("edit616");
    obj.edit616:setHeight(25);

    obj.edit617 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit617:setParent(obj.layout290);
    obj.edit617:setTransparent(true);
    obj.edit617.grid.role = "col";
    obj.edit617.grid.width = 8;
    obj.edit617:setName("edit617");
    obj.edit617:setHeight(25);

    obj.horzLine179 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine179:setParent(obj.layout290);
    obj.horzLine179.grid.role = "col";
    obj.horzLine179.grid.width = 12;
    obj.horzLine179:setName("horzLine179");
    obj.horzLine179:setStrokeColor("grey");

    obj.edit618 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit618:setParent(obj.layout290);
    obj.edit618:setTransparent(true);
    obj.edit618.grid.role = "col";
    obj.edit618.grid.width = 4;
    obj.edit618:setName("edit618");
    obj.edit618:setHeight(25);

    obj.edit619 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit619:setParent(obj.layout290);
    obj.edit619:setTransparent(true);
    obj.edit619.grid.role = "col";
    obj.edit619.grid.width = 8;
    obj.edit619:setName("edit619");
    obj.edit619:setHeight(25);

    obj.horzLine180 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine180:setParent(obj.layout290);
    obj.horzLine180.grid.role = "col";
    obj.horzLine180.grid.width = 12;
    obj.horzLine180:setName("horzLine180");
    obj.horzLine180:setStrokeColor("grey");

    obj.edit620 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit620:setParent(obj.layout290);
    obj.edit620:setTransparent(true);
    obj.edit620.grid.role = "col";
    obj.edit620.grid.width = 4;
    obj.edit620:setName("edit620");
    obj.edit620:setHeight(25);

    obj.edit621 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit621:setParent(obj.layout290);
    obj.edit621:setTransparent(true);
    obj.edit621.grid.role = "col";
    obj.edit621.grid.width = 8;
    obj.edit621:setName("edit621");
    obj.edit621:setHeight(25);

    obj.horzLine181 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine181:setParent(obj.layout290);
    obj.horzLine181.grid.role = "col";
    obj.horzLine181.grid.width = 12;
    obj.horzLine181:setName("horzLine181");
    obj.horzLine181:setStrokeColor("grey");

    obj.edit622 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit622:setParent(obj.layout290);
    obj.edit622:setTransparent(true);
    obj.edit622.grid.role = "col";
    obj.edit622.grid.width = 4;
    obj.edit622:setName("edit622");
    obj.edit622:setHeight(25);

    obj.edit623 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit623:setParent(obj.layout290);
    obj.edit623:setTransparent(true);
    obj.edit623.grid.role = "col";
    obj.edit623.grid.width = 8;
    obj.edit623:setName("edit623");
    obj.edit623:setHeight(25);

    obj.horzLine182 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine182:setParent(obj.layout290);
    obj.horzLine182.grid.role = "col";
    obj.horzLine182.grid.width = 12;
    obj.horzLine182:setName("horzLine182");
    obj.horzLine182:setStrokeColor("grey");

    obj.edit624 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit624:setParent(obj.layout290);
    obj.edit624:setTransparent(true);
    obj.edit624.grid.role = "col";
    obj.edit624.grid.width = 4;
    obj.edit624:setName("edit624");
    obj.edit624:setHeight(25);

    obj.edit625 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit625:setParent(obj.layout290);
    obj.edit625:setTransparent(true);
    obj.edit625.grid.role = "col";
    obj.edit625.grid.width = 8;
    obj.edit625:setName("edit625");
    obj.edit625:setHeight(25);

    obj.horzLine183 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine183:setParent(obj.layout290);
    obj.horzLine183.grid.role = "col";
    obj.horzLine183.grid.width = 12;
    obj.horzLine183:setName("horzLine183");
    obj.horzLine183:setStrokeColor("grey");

    obj.edit626 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit626:setParent(obj.layout290);
    obj.edit626:setTransparent(true);
    obj.edit626.grid.role = "col";
    obj.edit626.grid.width = 4;
    obj.edit626:setName("edit626");
    obj.edit626:setHeight(25);

    obj.edit627 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit627:setParent(obj.layout290);
    obj.edit627:setTransparent(true);
    obj.edit627.grid.role = "col";
    obj.edit627.grid.width = 8;
    obj.edit627:setName("edit627");
    obj.edit627:setHeight(25);

    obj.horzLine184 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine184:setParent(obj.layout290);
    obj.horzLine184.grid.role = "col";
    obj.horzLine184.grid.width = 12;
    obj.horzLine184:setName("horzLine184");
    obj.horzLine184:setStrokeColor("grey");

    obj.edit628 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit628:setParent(obj.layout290);
    obj.edit628:setTransparent(true);
    obj.edit628.grid.role = "col";
    obj.edit628.grid.width = 4;
    obj.edit628:setName("edit628");
    obj.edit628:setHeight(25);

    obj.edit629 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit629:setParent(obj.layout290);
    obj.edit629:setTransparent(true);
    obj.edit629.grid.role = "col";
    obj.edit629.grid.width = 8;
    obj.edit629:setName("edit629");
    obj.edit629:setHeight(25);

    obj.horzLine185 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine185:setParent(obj.layout290);
    obj.horzLine185.grid.role = "col";
    obj.horzLine185.grid.width = 12;
    obj.horzLine185:setName("horzLine185");
    obj.horzLine185:setStrokeColor("grey");

    obj.edit630 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit630:setParent(obj.layout290);
    obj.edit630:setTransparent(true);
    obj.edit630.grid.role = "col";
    obj.edit630.grid.width = 4;
    obj.edit630:setName("edit630");
    obj.edit630:setHeight(25);

    obj.edit631 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit631:setParent(obj.layout290);
    obj.edit631:setTransparent(true);
    obj.edit631.grid.role = "col";
    obj.edit631.grid.width = 8;
    obj.edit631:setName("edit631");
    obj.edit631:setHeight(25);

    obj.horzLine186 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine186:setParent(obj.layout290);
    obj.horzLine186.grid.role = "col";
    obj.horzLine186.grid.width = 12;
    obj.horzLine186:setName("horzLine186");
    obj.horzLine186:setStrokeColor("grey");

    obj.edit632 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit632:setParent(obj.layout290);
    obj.edit632:setTransparent(true);
    obj.edit632.grid.role = "col";
    obj.edit632.grid.width = 4;
    obj.edit632:setName("edit632");
    obj.edit632:setHeight(25);

    obj.edit633 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit633:setParent(obj.layout290);
    obj.edit633:setTransparent(true);
    obj.edit633.grid.role = "col";
    obj.edit633.grid.width = 8;
    obj.edit633:setName("edit633");
    obj.edit633:setHeight(25);

    obj.horzLine187 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine187:setParent(obj.layout290);
    obj.horzLine187.grid.role = "col";
    obj.horzLine187.grid.width = 12;
    obj.horzLine187:setName("horzLine187");
    obj.horzLine187:setStrokeColor("grey");

    obj.edit634 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit634:setParent(obj.layout290);
    obj.edit634:setTransparent(true);
    obj.edit634.grid.role = "col";
    obj.edit634.grid.width = 4;
    obj.edit634:setName("edit634");
    obj.edit634:setHeight(25);

    obj.edit635 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit635:setParent(obj.layout290);
    obj.edit635:setTransparent(true);
    obj.edit635.grid.role = "col";
    obj.edit635.grid.width = 8;
    obj.edit635:setName("edit635");
    obj.edit635:setHeight(25);

    obj.horzLine188 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine188:setParent(obj.layout290);
    obj.horzLine188.grid.role = "col";
    obj.horzLine188.grid.width = 12;
    obj.horzLine188:setName("horzLine188");
    obj.horzLine188:setStrokeColor("grey");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotacoees");
    obj.tab5:setName("tab5");

    obj.Anotacoes = GUI.fromHandle(_obj_newObject("form"));
    obj.Anotacoes:setParent(obj.tab5);
    obj.Anotacoes:setName("Anotacoes");
    obj.Anotacoes:setAlign("client");
    obj.Anotacoes:setTheme("dark");
    obj.Anotacoes.grid["padding-top"] = 8;
    obj.Anotacoes.grid["cnt-line-spacing"] = 4;

    obj.scrollBox11 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox11:setParent(obj.Anotacoes);
    obj.scrollBox11:setAlign("client");
    obj.scrollBox11:setName("scrollBox11");

    obj.layout291 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout291:setParent(obj.scrollBox11);
    obj.layout291.grid.role = "col";
    obj.layout291.grid.width = 8;
    obj.layout291.grid["horz-align"] = "center";
    obj.layout291.grid["cnt-gutter"] = 10;
    obj.layout291.grid["min-height"] = 900;
    obj.layout291.grid["padding-top"] = 30;
    obj.layout291:setName("layout291");

    obj.layout292 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout292:setParent(obj.layout291);
    obj.layout292.grid.role = "col";
    obj.layout292.grid.width = 6;
    obj.layout292.grid["auto-height"] = true;
    obj.layout292:setName("layout292");

    obj.rectangle136 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle136:setParent(obj.layout292);
    obj.rectangle136.grid.role = "col";
    obj.rectangle136.grid.width = 12;
    obj.rectangle136.grid["auto-height"] = true;
    obj.rectangle136.grid["min-height"] = 400;
    obj.rectangle136.grid["padding-bottom"] = 5;
    obj.rectangle136.grid["padding-top"] = 5;
    obj.rectangle136.grid["padding-left"] = 5;
    obj.rectangle136.grid["padding-right"] = 5;
    obj.rectangle136:setName("rectangle136");
    lfm_setPropAsString(obj.rectangle136, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle136:setCornerType("round");
    obj.rectangle136:setXradius(15);
    obj.rectangle136:setYradius(15);
    obj.rectangle136:setStrokeColor("#343434");
    obj.rectangle136:setStrokeSize(2);
    obj.rectangle136:setColor("#1f1e1e");

    obj.rectangle137 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle137:setParent(obj.rectangle136);
    obj.rectangle137:setColor("grey");
    obj.rectangle137:setXradius(0);
    obj.rectangle137:setYradius(0);
    obj.rectangle137.grid.role = "col";
    obj.rectangle137.grid.width = 12;
    obj.rectangle137.grid["cnt-vert-align"] = "center";
    obj.rectangle137.grid["max-height"] = 23;
    obj.rectangle137.grid["margin-bottom"] = 5;
    obj.rectangle137.grid["margin-top"] = -5;
    obj.rectangle137.grid["margin-left"] = -5;
    obj.rectangle137.grid["margin-right"] = -5;
    obj.rectangle137:setName("rectangle137");
    lfm_setPropAsString(obj.rectangle137, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle137:setCornerType("round");
    obj.rectangle137:setStrokeColor("#343434");
    obj.rectangle137:setStrokeSize(2);
    obj.rectangle137.grid["padding-top"] = 5;
    obj.rectangle137.grid["padding-left"] = 8;
    obj.rectangle137.grid["padding-right"] = 8;
    obj.rectangle137.grid["padding-bottom"] = 5;

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.rectangle137);
    obj.label182:setText("FOTA");
    obj.label182:setHorzTextAlign("leading");
    obj.label182:setFontSize(15);
    lfm_setPropAsString(obj.label182, "fontStyle", "bold");
    obj.label182.grid.role = "col";
    obj.label182:setFontColor("black");
    obj.label182.grid["dyn-width-txt"] = true;
    obj.label182:setName("label182");
    obj.label182:setHeight(25);

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle136);
    obj.image1:setEditable(true);
    obj.image1.grid.role = "col";
    obj.image1.grid.width = 12;
    obj.image1:setStyle("autoFit");
    obj.image1:setField("imgPers");
    obj.image1.grid["vert-tile"] = true;
    obj.image1:setName("image1");

    obj.rectangle138 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle138:setParent(obj.layout292);
    obj.rectangle138.grid.role = "col";
    obj.rectangle138.grid.width = 12;
    obj.rectangle138.grid["auto-height"] = true;
    obj.rectangle138.grid["min-height"] = 280;
    obj.rectangle138.grid["padding-bottom"] = 20;
    obj.rectangle138:setName("rectangle138");
    lfm_setPropAsString(obj.rectangle138, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle138:setCornerType("round");
    obj.rectangle138:setXradius(15);
    obj.rectangle138:setYradius(15);
    obj.rectangle138:setStrokeColor("#343434");
    obj.rectangle138:setStrokeSize(2);
    obj.rectangle138:setColor("#1f1e1e");
    obj.rectangle138.grid["padding-top"] = 5;
    obj.rectangle138.grid["padding-left"] = 8;
    obj.rectangle138.grid["padding-right"] = 8;

    obj.rectangle139 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle139:setParent(obj.rectangle138);
    obj.rectangle139:setColor("grey");
    obj.rectangle139:setXradius(0);
    obj.rectangle139:setYradius(0);
    obj.rectangle139.grid.role = "col";
    obj.rectangle139.grid.width = 12;
    obj.rectangle139.grid["cnt-vert-align"] = "center";
    obj.rectangle139.grid["max-height"] = 23;
    obj.rectangle139.grid["margin-bottom"] = 5;
    obj.rectangle139.grid["margin-top"] = -5;
    obj.rectangle139.grid["margin-left"] = -5;
    obj.rectangle139.grid["margin-right"] = -5;
    obj.rectangle139:setName("rectangle139");
    lfm_setPropAsString(obj.rectangle139, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle139:setCornerType("round");
    obj.rectangle139:setStrokeColor("#343434");
    obj.rectangle139:setStrokeSize(2);
    obj.rectangle139.grid["padding-top"] = 5;
    obj.rectangle139.grid["padding-left"] = 8;
    obj.rectangle139.grid["padding-right"] = 8;
    obj.rectangle139.grid["padding-bottom"] = 5;

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.rectangle139);
    obj.label183:setText("ANOTACOES");
    obj.label183:setHorzTextAlign("leading");
    obj.label183:setFontSize(15);
    lfm_setPropAsString(obj.label183, "fontStyle", "bold");
    obj.label183.grid.role = "col";
    obj.label183:setFontColor("black");
    obj.label183.grid["dyn-width-txt"] = true;
    obj.label183:setName("label183");
    obj.label183:setHeight(25);

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle138);
    obj.textEditor2:setField("historia");
    obj.textEditor2.grid.role = "row";
    obj.textEditor2:setWidth(12);
    obj.textEditor2.grid["vert-tile"] = true;
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontSize(15);
    obj.textEditor2.grid["padding-left"] = 20;
    obj.textEditor2.grid["padding-right"] = 20;
    obj.textEditor2:setName("textEditor2");

    obj.layout293 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout293:setParent(obj.layout291);
    obj.layout293.grid.role = "col";
    obj.layout293.grid.width = 6;
    obj.layout293.grid["min-height"] = 800;
    obj.layout293.grid["cnt-vert-align"] = "bottom";
    obj.layout293.grid["cnt-horz-align"] = "center";
    obj.layout293:setName("layout293");

    obj.layout294 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout294:setParent(obj.layout293);
    obj.layout294.grid.role = "col";
    obj.layout294.grid.width = 12;
    obj.layout294.grid["auto-height"] = true;
    obj.layout294.grid["min-height"] = 300;
    obj.layout294.grid["margin-bottom"] = 30;
    obj.layout294:setName("layout294");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout294);
    obj.image2:setSRC("/img/xerem_profile.png");
    obj.image2.grid.role = "col";
    obj.image2.grid.width = 12;
    obj.image2.grid["min-height"] = 400;
    obj.image2:setStyle("proportional");
    obj.image2:setName("image2");

    obj.button139 = GUI.fromHandle(_obj_newObject("button"));
    obj.button139:setParent(obj.layout293);
    obj.button139.grid["horz-align"] = "center";
    obj.button139:setText("Xerém Destrói O RPG de Mesa");
    obj.button139.grid.role = "col";
    obj.button139.grid.width = 6;
    obj.button139:setName("button139");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_FIS)
        end);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_VEL)
        end);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_FOR)
        end);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_AGI)
        end);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_DES)
        end);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_MAE)
        end);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_INT)
        end);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_ARC)
        end);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_PER)
        end);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_VONTADE)
        end);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_ACO or 0)
        end);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_ACO or 0)
        end);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_ADI or 0)
        end);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_ADI or 0)
        end);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_DEFESA)
        end);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_ARMADURA)
        end);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_INICIATIVA)
        end);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_ARMADURA)
        end);

    obj._e_event18 = obj.button70:addEventListener("onClick",
        function (event)
            self.rclArmasMelee:append();
        end);

    obj._e_event19 = obj.button71:addEventListener("onClick",
        function (event)
            self.rclEquipamento:append();
        end);

    obj._e_event20 = obj.button72:addEventListener("onClick",
        function (event)
            self.rclArmasRanged:append();
        end);

    obj._e_event21 = obj.button73:addEventListener("onClick",
        function (event)
            self.rclArmadura:append();
        end);

    obj._e_event22 = obj.button125:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_Fis)
        end);

    obj._e_event23 = obj.button126:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_Vel)
        end);

    obj._e_event24 = obj.button127:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_For)
        end);

    obj._e_event25 = obj.button128:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_Agi)
        end);

    obj._e_event26 = obj.button129:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_Des)
        end);

    obj._e_event27 = obj.button130:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_Mae)
        end);

    obj._e_event28 = obj.button131:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_Int)
        end);

    obj._e_event29 = obj.button132:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_Per)
        end);

    obj._e_event30 = obj.button133:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_ACO or 0)
        end);

    obj._e_event31 = obj.button134:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_ACO or 0)
        end);

    obj._e_event32 = obj.button135:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_ADI or 0)
        end);

    obj._e_event33 = obj.button136:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_ADI or 0)
        end);

    obj._e_event34 = obj.button137:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_DEFESA)
        end);

    obj._e_event35 = obj.button138:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.cam_ARMADURA)
        end);

    obj._e_event36 = obj.button139:addEventListener("onClick",
        function (event)
            GUI.openInBrowser('https://open.spotify.com/show/0cO3SWlsJw7nfoRePJjyzV?si=4e8678590abf405c')
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
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

        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.horzLine175 ~= nil then self.horzLine175:destroy(); self.horzLine175 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.comboBox89 ~= nil then self.comboBox89:destroy(); self.comboBox89 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.layout202 ~= nil then self.layout202:destroy(); self.layout202 = nil; end;
        if self.edit605 ~= nil then self.edit605:destroy(); self.edit605 = nil; end;
        if self.edit615 ~= nil then self.edit615:destroy(); self.edit615 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.edit512 ~= nil then self.edit512:destroy(); self.edit512 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.horzLine65 ~= nil then self.horzLine65:destroy(); self.horzLine65 = nil; end;
        if self.horzLine59 ~= nil then self.horzLine59:destroy(); self.horzLine59 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout267 ~= nil then self.layout267:destroy(); self.layout267 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.layout277 ~= nil then self.layout277:destroy(); self.layout277 = nil; end;
        if self.edit301 ~= nil then self.edit301:destroy(); self.edit301 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.horzLine99 ~= nil then self.horzLine99:destroy(); self.horzLine99 = nil; end;
        if self.edit439 ~= nil then self.edit439:destroy(); self.edit439 = nil; end;
        if self.checkBox60 ~= nil then self.checkBox60:destroy(); self.checkBox60 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.horzLine118 ~= nil then self.horzLine118:destroy(); self.horzLine118 = nil; end;
        if self.edit320 ~= nil then self.edit320:destroy(); self.edit320 = nil; end;
        if self.comboBox96 ~= nil then self.comboBox96:destroy(); self.comboBox96 = nil; end;
        if self.comboBox31 ~= nil then self.comboBox31:destroy(); self.comboBox31 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.edit508 ~= nil then self.edit508:destroy(); self.edit508 = nil; end;
        if self.horzLine36 ~= nil then self.horzLine36:destroy(); self.horzLine36 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.edit494 ~= nil then self.edit494:destroy(); self.edit494 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit298 ~= nil then self.edit298:destroy(); self.edit298 = nil; end;
        if self.rclArmadura ~= nil then self.rclArmadura:destroy(); self.rclArmadura = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.edit462 ~= nil then self.edit462:destroy(); self.edit462 = nil; end;
        if self.edit470 ~= nil then self.edit470:destroy(); self.edit470 = nil; end;
        if self.edit337 ~= nil then self.edit337:destroy(); self.edit337 = nil; end;
        if self.button54 ~= nil then self.button54:destroy(); self.button54 = nil; end;
        if self.edit388 ~= nil then self.edit388:destroy(); self.edit388 = nil; end;
        if self.edit527 ~= nil then self.edit527:destroy(); self.edit527 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.edit483 ~= nil then self.edit483:destroy(); self.edit483 = nil; end;
        if self.layout239 ~= nil then self.layout239:destroy(); self.layout239 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit587 ~= nil then self.edit587:destroy(); self.edit587 = nil; end;
        if self.edit597 ~= nil then self.edit597:destroy(); self.edit597 = nil; end;
        if self.horzLine103 ~= nil then self.horzLine103:destroy(); self.horzLine103 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.checkBox58 ~= nil then self.checkBox58:destroy(); self.checkBox58 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.button93 ~= nil then self.button93:destroy(); self.button93 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit403 ~= nil then self.edit403:destroy(); self.edit403 = nil; end;
        if self.edit413 ~= nil then self.edit413:destroy(); self.edit413 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit318 ~= nil then self.edit318:destroy(); self.edit318 = nil; end;
        if self.horzLine160 ~= nil then self.horzLine160:destroy(); self.horzLine160 = nil; end;
        if self.horzLine176 ~= nil then self.horzLine176:destroy(); self.horzLine176 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.edit530 ~= nil then self.edit530:destroy(); self.edit530 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.layout294 ~= nil then self.layout294:destroy(); self.layout294 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.layout201 ~= nil then self.layout201:destroy(); self.layout201 = nil; end;
        if self.button60 ~= nil then self.button60:destroy(); self.button60 = nil; end;
        if self.edit608 ~= nil then self.edit608:destroy(); self.edit608 = nil; end;
        if self.edit616 ~= nil then self.edit616:destroy(); self.edit616 = nil; end;
        if self.edit511 ~= nil then self.edit511:destroy(); self.edit511 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.horzLine66 ~= nil then self.horzLine66:destroy(); self.horzLine66 = nil; end;
        if self.horzLine54 ~= nil then self.horzLine54:destroy(); self.horzLine54 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.layout262 ~= nil then self.layout262:destroy(); self.layout262 = nil; end;
        if self.layout270 ~= nil then self.layout270:destroy(); self.layout270 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.edit302 ~= nil then self.edit302:destroy(); self.edit302 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.edit448 ~= nil then self.edit448:destroy(); self.edit448 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.comboBox95 ~= nil then self.comboBox95:destroy(); self.comboBox95 = nil; end;
        if self.comboBox34 ~= nil then self.comboBox34:destroy(); self.comboBox34 = nil; end;
        if self.comboBox22 ~= nil then self.comboBox22:destroy(); self.comboBox22 = nil; end;
        if self.layout283 ~= nil then self.layout283:destroy(); self.layout283 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit545 ~= nil then self.edit545:destroy(); self.edit545 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.horzLine79 ~= nil then self.horzLine79:destroy(); self.horzLine79 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.button88 ~= nil then self.button88:destroy(); self.button88 = nil; end;
        if self.edit499 ~= nil then self.edit499:destroy(); self.edit499 = nil; end;
        if self.layout213 ~= nil then self.layout213:destroy(); self.layout213 = nil; end;
        if self.edit361 ~= nil then self.edit361:destroy(); self.edit361 = nil; end;
        if self.button125 ~= nil then self.button125:destroy(); self.button125 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.horzLine138 ~= nil then self.horzLine138:destroy(); self.horzLine138 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit332 ~= nil then self.edit332:destroy(); self.edit332 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button59 ~= nil then self.button59:destroy(); self.button59 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.edit385 ~= nil then self.edit385:destroy(); self.edit385 = nil; end;
        if self.edit395 ~= nil then self.edit395:destroy(); self.edit395 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.edit528 ~= nil then self.edit528:destroy(); self.edit528 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.button78 ~= nil then self.button78:destroy(); self.button78 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit486 ~= nil then self.edit486:destroy(); self.edit486 = nil; end;
        if self.edit421 ~= nil then self.edit421:destroy(); self.edit421 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.edit584 ~= nil then self.edit584:destroy(); self.edit584 = nil; end;
        if self.horzLine106 ~= nil then self.horzLine106:destroy(); self.horzLine106 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.layout248 ~= nil then self.layout248:destroy(); self.layout248 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.edit406 ~= nil then self.edit406:destroy(); self.edit406 = nil; end;
        if self.edit410 ~= nil then self.edit410:destroy(); self.edit410 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.horzLine163 ~= nil then self.horzLine163:destroy(); self.horzLine163 = nil; end;
        if self.horzLine173 ~= nil then self.horzLine173:destroy(); self.horzLine173 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit533 ~= nil then self.edit533:destroy(); self.edit533 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.layout204 ~= nil then self.layout204:destroy(); self.layout204 = nil; end;
        if self.button67 ~= nil then self.button67:destroy(); self.button67 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.comboBox56 ~= nil then self.comboBox56:destroy(); self.comboBox56 = nil; end;
        if self.comboBox48 ~= nil then self.comboBox48:destroy(); self.comboBox48 = nil; end;
        if self.edit514 ~= nil then self.edit514:destroy(); self.edit514 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.horzLine180 ~= nil then self.horzLine180:destroy(); self.horzLine180 = nil; end;
        if self.horzLine63 ~= nil then self.horzLine63:destroy(); self.horzLine63 = nil; end;
        if self.horzLine53 ~= nil then self.horzLine53:destroy(); self.horzLine53 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.horzLine112 ~= nil then self.horzLine112:destroy(); self.horzLine112 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.layout192 ~= nil then self.layout192:destroy(); self.layout192 = nil; end;
        if self.layout180 ~= nil then self.layout180:destroy(); self.layout180 = nil; end;
        if self.comboBox37 ~= nil then self.comboBox37:destroy(); self.comboBox37 = nil; end;
        if self.comboBox27 ~= nil then self.comboBox27:destroy(); self.comboBox27 = nil; end;
        if self.layout286 ~= nil then self.layout286:destroy(); self.layout286 = nil; end;
        if self.layout221 ~= nil then self.layout221:destroy(); self.layout221 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit542 ~= nil then self.edit542:destroy(); self.edit542 = nil; end;
        if self.horzLine74 ~= nil then self.horzLine74:destroy(); self.horzLine74 = nil; end;
        if self.layout210 ~= nil then self.layout210:destroy(); self.layout210 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.edit366 ~= nil then self.edit366:destroy(); self.edit366 = nil; end;
        if self.button122 ~= nil then self.button122:destroy(); self.button122 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit468 ~= nil then self.edit468:destroy(); self.edit468 = nil; end;
        if self.edit331 ~= nil then self.edit331:destroy(); self.edit331 = nil; end;
        if self.horzLine149 ~= nil then self.horzLine149:destroy(); self.horzLine149 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.edit386 ~= nil then self.edit386:destroy(); self.edit386 = nil; end;
        if self.edit390 ~= nil then self.edit390:destroy(); self.edit390 = nil; end;
        if self.horzLine38 ~= nil then self.horzLine38:destroy(); self.horzLine38 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit559 ~= nil then self.edit559:destroy(); self.edit559 = nil; end;
        if self.edit565 ~= nil then self.edit565:destroy(); self.edit565 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.horzLine19 ~= nil then self.horzLine19:destroy(); self.horzLine19 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit485 ~= nil then self.edit485:destroy(); self.edit485 = nil; end;
        if self.edit424 ~= nil then self.edit424:destroy(); self.edit424 = nil; end;
        if self.edit599 ~= nil then self.edit599:destroy(); self.edit599 = nil; end;
        if self.edit341 ~= nil then self.edit341:destroy(); self.edit341 = nil; end;
        if self.horzLine105 ~= nil then self.horzLine105:destroy(); self.horzLine105 = nil; end;
        if self.horzLine49 ~= nil then self.horzLine49:destroy(); self.horzLine49 = nil; end;
        if self.button105 ~= nil then self.button105:destroy(); self.button105 = nil; end;
        if self.button139 ~= nil then self.button139:destroy(); self.button139 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.checkBox56 ~= nil then self.checkBox56:destroy(); self.checkBox56 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.edit405 ~= nil then self.edit405:destroy(); self.edit405 = nil; end;
        if self.edit415 ~= nil then self.edit415:destroy(); self.edit415 = nil; end;
        if self.edit316 ~= nil then self.edit316:destroy(); self.edit316 = nil; end;
        if self.layout178 ~= nil then self.layout178:destroy(); self.layout178 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.comboBox74 ~= nil then self.comboBox74:destroy(); self.comboBox74 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.edit536 ~= nil then self.edit536:destroy(); self.edit536 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.comboBox55 ~= nil then self.comboBox55:destroy(); self.comboBox55 = nil; end;
        if self.comboBox45 ~= nil then self.comboBox45:destroy(); self.comboBox45 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.horzLine187 ~= nil then self.horzLine187:destroy(); self.horzLine187 = nil; end;
        if self.horzLine122 ~= nil then self.horzLine122:destroy(); self.horzLine122 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.layout268 ~= nil then self.layout268:destroy(); self.layout268 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.edit308 ~= nil then self.edit308:destroy(); self.edit308 = nil; end;
        if self.edit430 ~= nil then self.edit430:destroy(); self.edit430 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.horzLine117 ~= nil then self.horzLine117:destroy(); self.horzLine117 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.rectangle120 ~= nil then self.rectangle120:destroy(); self.rectangle120 = nil; end;
        if self.layout195 ~= nil then self.layout195:destroy(); self.layout195 = nil; end;
        if self.layout185 ~= nil then self.layout185:destroy(); self.layout185 = nil; end;
        if self.horzLine20 ~= nil then self.horzLine20:destroy(); self.horzLine20 = nil; end;
        if self.edit618 ~= nil then self.edit618:destroy(); self.edit618 = nil; end;
        if self.layout285 ~= nil then self.layout285:destroy(); self.layout285 = nil; end;
        if self.layout224 ~= nil then self.layout224:destroy(); self.layout224 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.comboBox68 ~= nil then self.comboBox68:destroy(); self.comboBox68 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.rectangle111 ~= nil then self.rectangle111:destroy(); self.rectangle111 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.horzLine77 ~= nil then self.horzLine77:destroy(); self.horzLine77 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.horzLine92 ~= nil then self.horzLine92:destroy(); self.horzLine92 = nil; end;
        if self.layout215 ~= nil then self.layout215:destroy(); self.layout215 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit446 ~= nil then self.edit446:destroy(); self.edit446 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.edit503 ~= nil then self.edit503:destroy(); self.edit503 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.edit383 ~= nil then self.edit383:destroy(); self.edit383 = nil; end;
        if self.edit393 ~= nil then self.edit393:destroy(); self.edit393 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit566 ~= nil then self.edit566:destroy(); self.edit566 = nil; end;
        if self.edit554 ~= nil then self.edit554:destroy(); self.edit554 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit297 ~= nil then self.edit297:destroy(); self.edit297 = nil; end;
        if self.layout230 ~= nil then self.layout230:destroy(); self.layout230 = nil; end;
        if self.edit427 ~= nil then self.edit427:destroy(); self.edit427 = nil; end;
        if self.edit342 ~= nil then self.edit342:destroy(); self.edit342 = nil; end;
        if self.edit370 ~= nil then self.edit370:destroy(); self.edit370 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.horzLine108 ~= nil then self.horzLine108:destroy(); self.horzLine108 = nil; end;
        if self.button106 ~= nil then self.button106:destroy(); self.button106 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.checkBox51 ~= nil then self.checkBox51:destroy(); self.checkBox51 = nil; end;
        if self.button134 ~= nil then self.button134:destroy(); self.button134 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.edit408 ~= nil then self.edit408:destroy(); self.edit408 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.edit311 ~= nil then self.edit311:destroy(); self.edit311 = nil; end;
        if self.horzLine169 ~= nil then self.horzLine169:destroy(); self.horzLine169 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.layout177 ~= nil then self.layout177:destroy(); self.layout177 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.comboBox77 ~= nil then self.comboBox77:destroy(); self.comboBox77 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit620 ~= nil then self.edit620:destroy(); self.edit620 = nil; end;
        if self.edit632 ~= nil then self.edit632:destroy(); self.edit632 = nil; end;
        if self.edit579 ~= nil then self.edit579:destroy(); self.edit579 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.comboBox50 ~= nil then self.comboBox50:destroy(); self.comboBox50 = nil; end;
        if self.comboBox42 ~= nil then self.comboBox42:destroy(); self.comboBox42 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.layout246 ~= nil then self.layout246:destroy(); self.layout246 = nil; end;
        if self.layout258 ~= nil then self.layout258:destroy(); self.layout258 = nil; end;
        if self.horzLine125 ~= nil then self.horzLine125:destroy(); self.horzLine125 = nil; end;
        if self.horzLine69 ~= nil then self.horzLine69:destroy(); self.horzLine69 = nil; end;
        if self.button119 ~= nil then self.button119:destroy(); self.button119 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.edit435 ~= nil then self.edit435:destroy(); self.edit435 = nil; end;
        if self.horzLine114 ~= nil then self.horzLine114:destroy(); self.horzLine114 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.comboBox81 ~= nil then self.comboBox81:destroy(); self.comboBox81 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.rectangle123 ~= nil then self.rectangle123:destroy(); self.rectangle123 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout198 ~= nil then self.layout198:destroy(); self.layout198 = nil; end;
        if self.layout186 ~= nil then self.layout186:destroy(); self.layout186 = nil; end;
        if self.horzLine25 ~= nil then self.horzLine25:destroy(); self.horzLine25 = nil; end;
        if self.layout227 ~= nil then self.layout227:destroy(); self.layout227 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.comboBox65 ~= nil then self.comboBox65:destroy(); self.comboBox65 = nil; end;
        if self.rectangle104 ~= nil then self.rectangle104:destroy(); self.rectangle104 = nil; end;
        if self.rectangle116 ~= nil then self.rectangle116:destroy(); self.rectangle116 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.horzLine72 ~= nil then self.horzLine72:destroy(); self.horzLine72 = nil; end;
        if self.horzLine91 ~= nil then self.horzLine91:destroy(); self.horzLine91 = nil; end;
        if self.horzLine81 ~= nil then self.horzLine81:destroy(); self.horzLine81 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.edit368 ~= nil then self.edit368:destroy(); self.edit368 = nil; end;
        if self.edit445 ~= nil then self.edit445:destroy(); self.edit445 = nil; end;
        if self.horzLine133 ~= nil then self.horzLine133:destroy(); self.horzLine133 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.comboBox29 ~= nil then self.comboBox29:destroy(); self.comboBox29 = nil; end;
        if self.edit500 ~= nil then self.edit500:destroy(); self.edit500 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.button85 ~= nil then self.button85:destroy(); self.button85 = nil; end;
        if self.rectangle131 ~= nil then self.rectangle131:destroy(); self.rectangle131 = nil; end;
        if self.edit563 ~= nil then self.edit563:destroy(); self.edit563 = nil; end;
        if self.edit553 ~= nil then self.edit553:destroy(); self.edit553 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.horzLine13 ~= nil then self.horzLine13:destroy(); self.horzLine13 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.layout235 ~= nil then self.layout235:destroy(); self.layout235 = nil; end;
        if self.edit347 ~= nil then self.edit347:destroy(); self.edit347 = nil; end;
        if self.edit377 ~= nil then self.edit377:destroy(); self.edit377 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.button103 ~= nil then self.button103:destroy(); self.button103 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.button133 ~= nil then self.button133:destroy(); self.button133 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit478 ~= nil then self.edit478:destroy(); self.edit478 = nil; end;
        if self.horzLine147 ~= nil then self.horzLine147:destroy(); self.horzLine147 = nil; end;
        if self.horzLine157 ~= nil then self.horzLine157:destroy(); self.horzLine157 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.edit457 ~= nil then self.edit457:destroy(); self.edit457 = nil; end;
        if self.comboBox72 ~= nil then self.comboBox72:destroy(); self.comboBox72 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.button73 ~= nil then self.button73:destroy(); self.button73 = nil; end;
        if self.edit627 ~= nil then self.edit627:destroy(); self.edit627 = nil; end;
        if self.edit574 ~= nil then self.edit574:destroy(); self.edit574 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.comboBox103 ~= nil then self.comboBox103:destroy(); self.comboBox103 = nil; end;
        if self.horzLine47 ~= nil then self.horzLine47:destroy(); self.horzLine47 = nil; end;
        if self.layout245 ~= nil then self.layout245:destroy(); self.layout245 = nil; end;
        if self.layout255 ~= nil then self.layout255:destroy(); self.layout255 = nil; end;
        if self.edit350 ~= nil then self.edit350:destroy(); self.edit350 = nil; end;
        if self.horzLine128 ~= nil then self.horzLine128:destroy(); self.horzLine128 = nil; end;
        if self.button114 ~= nil then self.button114:destroy(); self.button114 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.edit436 ~= nil then self.edit436:destroy(); self.edit436 = nil; end;
        if self.edit538 ~= nil then self.edit538:destroy(); self.edit538 = nil; end;
        if self.comboBox86 ~= nil then self.comboBox86:destroy(); self.comboBox86 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.rectangle126 ~= nil then self.rectangle126:destroy(); self.rectangle126 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.button68 ~= nil then self.button68:destroy(); self.button68 = nil; end;
        if self.edit600 ~= nil then self.edit600:destroy(); self.edit600 = nil; end;
        if self.horzLine26 ~= nil then self.horzLine26:destroy(); self.horzLine26 = nil; end;
        if self.edit519 ~= nil then self.edit519:destroy(); self.edit519 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.comboBox66 ~= nil then self.comboBox66:destroy(); self.comboBox66 = nil; end;
        if self.edit549 ~= nil then self.edit549:destroy(); self.edit549 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.layout278 ~= nil then self.layout278:destroy(); self.layout278 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.horzLine94 ~= nil then self.horzLine94:destroy(); self.horzLine94 = nil; end;
        if self.horzLine86 ~= nil then self.horzLine86:destroy(); self.horzLine86 = nil; end;
        if self.checkBox65 ~= nil then self.checkBox65:destroy(); self.checkBox65 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.button129 ~= nil then self.button129:destroy(); self.button129 = nil; end;
        if self.edit440 ~= nil then self.edit440:destroy(); self.edit440 = nil; end;
        if self.horzLine134 ~= nil then self.horzLine134:destroy(); self.horzLine134 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.edit325 ~= nil then self.edit325:destroy(); self.edit325 = nil; end;
        if self.edit505 ~= nil then self.edit505:destroy(); self.edit505 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit399 ~= nil then self.edit399:destroy(); self.edit399 = nil; end;
        if self.horzLine31 ~= nil then self.horzLine31:destroy(); self.horzLine31 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.button80 ~= nil then self.button80:destroy(); self.button80 = nil; end;
        if self.edit491 ~= nil then self.edit491:destroy(); self.edit491 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.rectangle132 ~= nil then self.rectangle132:destroy(); self.rectangle132 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.horzLine16 ~= nil then self.horzLine16:destroy(); self.horzLine16 = nil; end;
        if self.layout236 ~= nil then self.layout236:destroy(); self.layout236 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit348 ~= nil then self.edit348:destroy(); self.edit348 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit465 ~= nil then self.edit465:destroy(); self.edit465 = nil; end;
        if self.edit475 ~= nil then self.edit475:destroy(); self.edit475 = nil; end;
        if self.horzLine142 ~= nil then self.horzLine142:destroy(); self.horzLine142 = nil; end;
        if self.horzLine154 ~= nil then self.horzLine154:destroy(); self.horzLine154 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit520 ~= nil then self.edit520:destroy(); self.edit520 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit454 ~= nil then self.edit454:destroy(); self.edit454 = nil; end;
        if self.button70 ~= nil then self.button70:destroy(); self.button70 = nil; end;
        if self.edit634 ~= nil then self.edit634:destroy(); self.edit634 = nil; end;
        if self.edit577 ~= nil then self.edit577:destroy(); self.edit577 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.edit592 ~= nil then self.edit592:destroy(); self.edit592 = nil; end;
        if self.horzLine44 ~= nil then self.horzLine44:destroy(); self.horzLine44 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.layout240 ~= nil then self.layout240:destroy(); self.layout240 = nil; end;
        if self.layout252 ~= nil then self.layout252:destroy(); self.layout252 = nil; end;
        if self.edit353 ~= nil then self.edit353:destroy(); self.edit353 = nil; end;
        if self.button117 ~= nil then self.button117:destroy(); self.button117 = nil; end;
        if self.button94 ~= nil then self.button94:destroy(); self.button94 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.edit418 ~= nil then self.edit418:destroy(); self.edit418 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.layout291 ~= nil then self.layout291:destroy(); self.layout291 = nil; end;
        if self.rectangle129 ~= nil then self.rectangle129:destroy(); self.rectangle129 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.edit603 ~= nil then self.edit603:destroy(); self.edit603 = nil; end;
        if self.edit613 ~= nil then self.edit613:destroy(); self.edit613 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.horzLine188 ~= nil then self.horzLine188:destroy(); self.horzLine188 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.comboBox63 ~= nil then self.comboBox63:destroy(); self.comboBox63 = nil; end;
        if self.layout265 ~= nil then self.layout265:destroy(); self.layout265 = nil; end;
        if self.layout275 ~= nil then self.layout275:destroy(); self.layout275 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit307 ~= nil then self.edit307:destroy(); self.edit307 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox62 ~= nil then self.checkBox62:destroy(); self.checkBox62 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.edit322 ~= nil then self.edit322:destroy(); self.edit322 = nil; end;
        if self.comboBox90 ~= nil then self.comboBox90:destroy(); self.comboBox90 = nil; end;
        if self.layout188 ~= nil then self.layout188:destroy(); self.layout188 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.horzLine34 ~= nil then self.horzLine34:destroy(); self.horzLine34 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.button83 ~= nil then self.button83:destroy(); self.button83 = nil; end;
        if self.edit496 ~= nil then self.edit496:destroy(); self.edit496 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.layout218 ~= nil then self.layout218:destroy(); self.layout218 = nil; end;
        if self.edit569 ~= nil then self.edit569:destroy(); self.edit569 = nil; end;
        if self.rectangle137 ~= nil then self.rectangle137:destroy(); self.rectangle137 = nil; end;
        if self.horzLine15 ~= nil then self.horzLine15:destroy(); self.horzLine15 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.button109 ~= nil then self.button109:destroy(); self.button109 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit460 ~= nil then self.edit460:destroy(); self.edit460 = nil; end;
        if self.edit476 ~= nil then self.edit476:destroy(); self.edit476 = nil; end;
        if self.edit339 ~= nil then self.edit339:destroy(); self.edit339 = nil; end;
        if self.horzLine141 ~= nil then self.horzLine141:destroy(); self.horzLine141 = nil; end;
        if self.horzLine151 ~= nil then self.horzLine151:destroy(); self.horzLine151 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.edit525 ~= nil then self.edit525:destroy(); self.edit525 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.edit451 ~= nil then self.edit451:destroy(); self.edit451 = nil; end;
        if self.comboBox78 ~= nil then self.comboBox78:destroy(); self.comboBox78 = nil; end;
        if self.button75 ~= nil then self.button75:destroy(); self.button75 = nil; end;
        if self.edit629 ~= nil then self.edit629:destroy(); self.edit629 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit572 ~= nil then self.edit572:destroy(); self.edit572 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.edit581 ~= nil then self.edit581:destroy(); self.edit581 = nil; end;
        if self.edit591 ~= nil then self.edit591:destroy(); self.edit591 = nil; end;
        if self.comboBox59 ~= nil then self.comboBox59:destroy(); self.comboBox59 = nil; end;
        if self.horzLine41 ~= nil then self.horzLine41:destroy(); self.horzLine41 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.edit356 ~= nil then self.edit356:destroy(); self.edit356 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.button91 ~= nil then self.button91:destroy(); self.button91 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.button112 ~= nil then self.button112:destroy(); self.button112 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.horzLine166 ~= nil then self.horzLine166:destroy(); self.horzLine166 = nil; end;
        if self.horzLine174 ~= nil then self.horzLine174:destroy(); self.horzLine174 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.comboBox88 ~= nil then self.comboBox88:destroy(); self.comboBox88 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.layout203 ~= nil then self.layout203:destroy(); self.layout203 = nil; end;
        if self.button62 ~= nil then self.button62:destroy(); self.button62 = nil; end;
        if self.edit606 ~= nil then self.edit606:destroy(); self.edit606 = nil; end;
        if self.edit614 ~= nil then self.edit614:destroy(); self.edit614 = nil; end;
        if self.edit513 ~= nil then self.edit513:destroy(); self.edit513 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.horzLine64 ~= nil then self.horzLine64:destroy(); self.horzLine64 = nil; end;
        if self.horzLine56 ~= nil then self.horzLine56:destroy(); self.horzLine56 = nil; end;
        if self.layout260 ~= nil then self.layout260:destroy(); self.layout260 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.layout276 ~= nil then self.layout276:destroy(); self.layout276 = nil; end;
        if self.edit300 ~= nil then self.edit300:destroy(); self.edit300 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit438 ~= nil then self.edit438:destroy(); self.edit438 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.comboBox97 ~= nil then self.comboBox97:destroy(); self.comboBox97 = nil; end;
        if self.comboBox32 ~= nil then self.comboBox32:destroy(); self.comboBox32 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.horzLine37 ~= nil then self.horzLine37:destroy(); self.horzLine37 = nil; end;
        if self.rectangle119 ~= nil then self.rectangle119:destroy(); self.rectangle119 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.edit547 ~= nil then self.edit547:destroy(); self.edit547 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit363 ~= nil then self.edit363:destroy(); self.edit363 = nil; end;
        if self.button127 ~= nil then self.button127:destroy(); self.button127 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.edit463 ~= nil then self.edit463:destroy(); self.edit463 = nil; end;
        if self.edit473 ~= nil then self.edit473:destroy(); self.edit473 = nil; end;
        if self.edit334 ~= nil then self.edit334:destroy(); self.edit334 = nil; end;
        if self.button57 ~= nil then self.button57:destroy(); self.button57 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.edit526 ~= nil then self.edit526:destroy(); self.edit526 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.edit480 ~= nil then self.edit480:destroy(); self.edit480 = nil; end;
        if self.layout238 ~= nil then self.layout238:destroy(); self.layout238 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit586 ~= nil then self.edit586:destroy(); self.edit586 = nil; end;
        if self.edit594 ~= nil then self.edit594:destroy(); self.edit594 = nil; end;
        if self.horzLine100 ~= nil then self.horzLine100:destroy(); self.horzLine100 = nil; end;
        if self.edit378 ~= nil then self.edit378:destroy(); self.edit378 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.checkBox59 ~= nil then self.checkBox59:destroy(); self.checkBox59 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.button92 ~= nil then self.button92:destroy(); self.button92 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.edit400 ~= nil then self.edit400:destroy(); self.edit400 = nil; end;
        if self.edit412 ~= nil then self.edit412:destroy(); self.edit412 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit319 ~= nil then self.edit319:destroy(); self.edit319 = nil; end;
        if self.horzLine161 ~= nil then self.horzLine161:destroy(); self.horzLine161 = nil; end;
        if self.horzLine171 ~= nil then self.horzLine171:destroy(); self.horzLine171 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit531 ~= nil then self.edit531:destroy(); self.edit531 = nil; end;
        if self.Geral ~= nil then self.Geral:destroy(); self.Geral = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.layout206 ~= nil then self.layout206:destroy(); self.layout206 = nil; end;
        if self.button61 ~= nil then self.button61:destroy(); self.button61 = nil; end;
        if self.edit609 ~= nil then self.edit609:destroy(); self.edit609 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.edit516 ~= nil then self.edit516:destroy(); self.edit516 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.horzLine182 ~= nil then self.horzLine182:destroy(); self.horzLine182 = nil; end;
        if self.horzLine61 ~= nil then self.horzLine61:destroy(); self.horzLine61 = nil; end;
        if self.horzLine55 ~= nil then self.horzLine55:destroy(); self.horzLine55 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.layout263 ~= nil then self.layout263:destroy(); self.layout263 = nil; end;
        if self.layout273 ~= nil then self.layout273:destroy(); self.layout273 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.edit449 ~= nil then self.edit449:destroy(); self.edit449 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.layout190 ~= nil then self.layout190:destroy(); self.layout190 = nil; end;
        if self.comboBox35 ~= nil then self.comboBox35:destroy(); self.comboBox35 = nil; end;
        if self.comboBox25 ~= nil then self.comboBox25:destroy(); self.comboBox25 = nil; end;
        if self.layout280 ~= nil then self.layout280:destroy(); self.layout280 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit544 ~= nil then self.edit544:destroy(); self.edit544 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.button89 ~= nil then self.button89:destroy(); self.button89 = nil; end;
        if self.edit498 ~= nil then self.edit498:destroy(); self.edit498 = nil; end;
        if self.horzLine89 ~= nil then self.horzLine89:destroy(); self.horzLine89 = nil; end;
        if self.layout212 ~= nil then self.layout212:destroy(); self.layout212 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.edit360 ~= nil then self.edit360:destroy(); self.edit360 = nil; end;
        if self.button124 ~= nil then self.button124:destroy(); self.button124 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.edit333 ~= nil then self.edit333:destroy(); self.edit333 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button58 ~= nil then self.button58:destroy(); self.button58 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.Habilidades ~= nil then self.Habilidades:destroy(); self.Habilidades = nil; end;
        if self.edit384 ~= nil then self.edit384:destroy(); self.edit384 = nil; end;
        if self.edit396 ~= nil then self.edit396:destroy(); self.edit396 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.rectangle139 ~= nil then self.rectangle139:destroy(); self.rectangle139 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit487 ~= nil then self.edit487:destroy(); self.edit487 = nil; end;
        if self.edit422 ~= nil then self.edit422:destroy(); self.edit422 = nil; end;
        if self.Equipamentos ~= nil then self.Equipamentos:destroy(); self.Equipamentos = nil; end;
        if self.horzLine107 ~= nil then self.horzLine107:destroy(); self.horzLine107 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.checkBox54 ~= nil then self.checkBox54:destroy(); self.checkBox54 = nil; end;
        if self.layout249 ~= nil then self.layout249:destroy(); self.layout249 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.edit407 ~= nil then self.edit407:destroy(); self.edit407 = nil; end;
        if self.edit417 ~= nil then self.edit417:destroy(); self.edit417 = nil; end;
        if self.edit314 ~= nil then self.edit314:destroy(); self.edit314 = nil; end;
        if self.horzLine172 ~= nil then self.horzLine172:destroy(); self.horzLine172 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.edit534 ~= nil then self.edit534:destroy(); self.edit534 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.layout205 ~= nil then self.layout205:destroy(); self.layout205 = nil; end;
        if self.button64 ~= nil then self.button64:destroy(); self.button64 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.comboBox57 ~= nil then self.comboBox57:destroy(); self.comboBox57 = nil; end;
        if self.comboBox47 ~= nil then self.comboBox47:destroy(); self.comboBox47 = nil; end;
        if self.edit515 ~= nil then self.edit515:destroy(); self.edit515 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.horzLine181 ~= nil then self.horzLine181:destroy(); self.horzLine181 = nil; end;
        if self.edit358 ~= nil then self.edit358:destroy(); self.edit358 = nil; end;
        if self.horzLine62 ~= nil then self.horzLine62:destroy(); self.horzLine62 = nil; end;
        if self.horzLine50 ~= nil then self.horzLine50:destroy(); self.horzLine50 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.horzLine120 ~= nil then self.horzLine120:destroy(); self.horzLine120 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.horzLine111 ~= nil then self.horzLine111:destroy(); self.horzLine111 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.edit329 ~= nil then self.edit329:destroy(); self.edit329 = nil; end;
        if self.layout193 ~= nil then self.layout193:destroy(); self.layout193 = nil; end;
        if self.layout183 ~= nil then self.layout183:destroy(); self.layout183 = nil; end;
        if self.comboBox38 ~= nil then self.comboBox38:destroy(); self.comboBox38 = nil; end;
        if self.comboBox26 ~= nil then self.comboBox26:destroy(); self.comboBox26 = nil; end;
        if self.layout287 ~= nil then self.layout287:destroy(); self.layout287 = nil; end;
        if self.layout222 ~= nil then self.layout222:destroy(); self.layout222 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.rectangle113 ~= nil then self.rectangle113:destroy(); self.rectangle113 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.edit541 ~= nil then self.edit541:destroy(); self.edit541 = nil; end;
        if self.horzLine75 ~= nil then self.horzLine75:destroy(); self.horzLine75 = nil; end;
        if self.layout217 ~= nil then self.layout217:destroy(); self.layout217 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit365 ~= nil then self.edit365:destroy(); self.edit365 = nil; end;
        if self.button121 ~= nil then self.button121:destroy(); self.button121 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit469 ~= nil then self.edit469:destroy(); self.edit469 = nil; end;
        if self.Funcoes ~= nil then self.Funcoes:destroy(); self.Funcoes = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.edit381 ~= nil then self.edit381:destroy(); self.edit381 = nil; end;
        if self.horzLine39 ~= nil then self.horzLine39:destroy(); self.horzLine39 = nil; end;
        if self.edit391 ~= nil then self.edit391:destroy(); self.edit391 = nil; end;
        if self.Anotacoes ~= nil then self.Anotacoes:destroy(); self.Anotacoes = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit564 ~= nil then self.edit564:destroy(); self.edit564 = nil; end;
        if self.edit556 ~= nil then self.edit556:destroy(); self.edit556 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit295 ~= nil then self.edit295:destroy(); self.edit295 = nil; end;
        if self.edit425 ~= nil then self.edit425:destroy(); self.edit425 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.edit340 ~= nil then self.edit340:destroy(); self.edit340 = nil; end;
        if self.edit372 ~= nil then self.edit372:destroy(); self.edit372 = nil; end;
        if self.horzLine48 ~= nil then self.horzLine48:destroy(); self.horzLine48 = nil; end;
        if self.button104 ~= nil then self.button104:destroy(); self.button104 = nil; end;
        if self.button136 ~= nil then self.button136:destroy(); self.button136 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.checkBox57 ~= nil then self.checkBox57:destroy(); self.checkBox57 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.edit414 ~= nil then self.edit414:destroy(); self.edit414 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.edit317 ~= nil then self.edit317:destroy(); self.edit317 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.layout179 ~= nil then self.layout179:destroy(); self.layout179 = nil; end;
        if self.comboBox75 ~= nil then self.comboBox75:destroy(); self.comboBox75 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.edit537 ~= nil then self.edit537:destroy(); self.edit537 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.edit622 ~= nil then self.edit622:destroy(); self.edit622 = nil; end;
        if self.layout208 ~= nil then self.layout208:destroy(); self.layout208 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.comboBox52 ~= nil then self.comboBox52:destroy(); self.comboBox52 = nil; end;
        if self.comboBox44 ~= nil then self.comboBox44:destroy(); self.comboBox44 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.horzLine184 ~= nil then self.horzLine184:destroy(); self.horzLine184 = nil; end;
        if self.horzLine123 ~= nil then self.horzLine123:destroy(); self.horzLine123 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.layout269 ~= nil then self.layout269:destroy(); self.layout269 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.edit433 ~= nil then self.edit433:destroy(); self.edit433 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.horzLine116 ~= nil then self.horzLine116:destroy(); self.horzLine116 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.comboBox83 ~= nil then self.comboBox83:destroy(); self.comboBox83 = nil; end;
        if self.rectangle121 ~= nil then self.rectangle121:destroy(); self.rectangle121 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.layout196 ~= nil then self.layout196:destroy(); self.layout196 = nil; end;
        if self.layout184 ~= nil then self.layout184:destroy(); self.layout184 = nil; end;
        if self.horzLine23 ~= nil then self.horzLine23:destroy(); self.horzLine23 = nil; end;
        if self.layout225 ~= nil then self.layout225:destroy(); self.layout225 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.rectangle106 ~= nil then self.rectangle106:destroy(); self.rectangle106 = nil; end;
        if self.rectangle110 ~= nil then self.rectangle110:destroy(); self.rectangle110 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.horzLine70 ~= nil then self.horzLine70:destroy(); self.horzLine70 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.horzLine83 ~= nil then self.horzLine83:destroy(); self.horzLine83 = nil; end;
        if self.horzLine93 ~= nil then self.horzLine93:destroy(); self.horzLine93 = nil; end;
        if self.layout214 ~= nil then self.layout214:destroy(); self.layout214 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.edit447 ~= nil then self.edit447:destroy(); self.edit447 = nil; end;
        if self.horzLine131 ~= nil then self.horzLine131:destroy(); self.horzLine131 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.comboBox98 ~= nil then self.comboBox98:destroy(); self.comboBox98 = nil; end;
        if self.edit502 ~= nil then self.edit502:destroy(); self.edit502 = nil; end;
        if self.edit382 ~= nil then self.edit382:destroy(); self.edit382 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.edit561 ~= nil then self.edit561:destroy(); self.edit561 = nil; end;
        if self.edit555 ~= nil then self.edit555:destroy(); self.edit555 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.edit296 ~= nil then self.edit296:destroy(); self.edit296 = nil; end;
        if self.layout233 ~= nil then self.layout233:destroy(); self.layout233 = nil; end;
        if self.edit428 ~= nil then self.edit428:destroy(); self.edit428 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.edit345 ~= nil then self.edit345:destroy(); self.edit345 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit371 ~= nil then self.edit371:destroy(); self.edit371 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.horzLine109 ~= nil then self.horzLine109:destroy(); self.horzLine109 = nil; end;
        if self.button101 ~= nil then self.button101:destroy(); self.button101 = nil; end;
        if self.checkBox52 ~= nil then self.checkBox52:destroy(); self.checkBox52 = nil; end;
        if self.button135 ~= nil then self.button135:destroy(); self.button135 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.horzLine159 ~= nil then self.horzLine159:destroy(); self.horzLine159 = nil; end;
        if self.edit409 ~= nil then self.edit409:destroy(); self.edit409 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.edit312 ~= nil then self.edit312:destroy(); self.edit312 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.edit459 ~= nil then self.edit459:destroy(); self.edit459 = nil; end;
        if self.comboBox70 ~= nil then self.comboBox70:destroy(); self.comboBox70 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit621 ~= nil then self.edit621:destroy(); self.edit621 = nil; end;
        if self.edit631 ~= nil then self.edit631:destroy(); self.edit631 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.edit589 ~= nil then self.edit589:destroy(); self.edit589 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.comboBox51 ~= nil then self.comboBox51:destroy(); self.comboBox51 = nil; end;
        if self.comboBox41 ~= nil then self.comboBox41:destroy(); self.comboBox41 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.layout247 ~= nil then self.layout247:destroy(); self.layout247 = nil; end;
        if self.layout257 ~= nil then self.layout257:destroy(); self.layout257 = nil; end;
        if self.horzLine126 ~= nil then self.horzLine126:destroy(); self.horzLine126 = nil; end;
        if self.horzLine68 ~= nil then self.horzLine68:destroy(); self.horzLine68 = nil; end;
        if self.button99 ~= nil then self.button99:destroy(); self.button99 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit434 ~= nil then self.edit434:destroy(); self.edit434 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.comboBox80 ~= nil then self.comboBox80:destroy(); self.comboBox80 = nil; end;
        if self.rectangle124 ~= nil then self.rectangle124:destroy(); self.rectangle124 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.layout199 ~= nil then self.layout199:destroy(); self.layout199 = nil; end;
        if self.horzLine24 ~= nil then self.horzLine24:destroy(); self.horzLine24 = nil; end;
        if self.layout228 ~= nil then self.layout228:destroy(); self.layout228 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.comboBox64 ~= nil then self.comboBox64:destroy(); self.comboBox64 = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.rectangle115 ~= nil then self.rectangle115:destroy(); self.rectangle115 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.horzLine73 ~= nil then self.horzLine73:destroy(); self.horzLine73 = nil; end;
        if self.horzLine96 ~= nil then self.horzLine96:destroy(); self.horzLine96 = nil; end;
        if self.horzLine80 ~= nil then self.horzLine80:destroy(); self.horzLine80 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit442 ~= nil then self.edit442:destroy(); self.edit442 = nil; end;
        if self.horzLine132 ~= nil then self.horzLine132:destroy(); self.horzLine132 = nil; end;
        if self.edit327 ~= nil then self.edit327:destroy(); self.edit327 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.comboBox28 ~= nil then self.comboBox28:destroy(); self.comboBox28 = nil; end;
        if self.edit507 ~= nil then self.edit507:destroy(); self.edit507 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.button86 ~= nil then self.button86:destroy(); self.button86 = nil; end;
        if self.edit493 ~= nil then self.edit493:destroy(); self.edit493 = nil; end;
        if self.edit562 ~= nil then self.edit562:destroy(); self.edit562 = nil; end;
        if self.edit550 ~= nil then self.edit550:destroy(); self.edit550 = nil; end;
        if self.rectangle130 ~= nil then self.rectangle130:destroy(); self.rectangle130 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.edit293 ~= nil then self.edit293:destroy(); self.edit293 = nil; end;
        if self.layout234 ~= nil then self.layout234:destroy(); self.layout234 = nil; end;
        if self.edit346 ~= nil then self.edit346:destroy(); self.edit346 = nil; end;
        if self.edit374 ~= nil then self.edit374:destroy(); self.edit374 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.button102 ~= nil then self.button102:destroy(); self.button102 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.button130 ~= nil then self.button130:destroy(); self.button130 = nil; end;
        if self.horzLine144 ~= nil then self.horzLine144:destroy(); self.horzLine144 = nil; end;
        if self.horzLine156 ~= nil then self.horzLine156:destroy(); self.horzLine156 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.edit456 ~= nil then self.edit456:destroy(); self.edit456 = nil; end;
        if self.comboBox73 ~= nil then self.comboBox73:destroy(); self.comboBox73 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.button72 ~= nil then self.button72:destroy(); self.button72 = nil; end;
        if self.edit624 ~= nil then self.edit624:destroy(); self.edit624 = nil; end;
        if self.edit488 ~= nil then self.edit488:destroy(); self.edit488 = nil; end;
        if self.edit575 ~= nil then self.edit575:destroy(); self.edit575 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.comboBox100 ~= nil then self.comboBox100:destroy(); self.comboBox100 = nil; end;
        if self.horzLine46 ~= nil then self.horzLine46:destroy(); self.horzLine46 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.layout242 ~= nil then self.layout242:destroy(); self.layout242 = nil; end;
        if self.layout254 ~= nil then self.layout254:destroy(); self.layout254 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.edit351 ~= nil then self.edit351:destroy(); self.edit351 = nil; end;
        if self.horzLine129 ~= nil then self.horzLine129:destroy(); self.horzLine129 = nil; end;
        if self.button115 ~= nil then self.button115:destroy(); self.button115 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.horzLine179 ~= nil then self.horzLine179:destroy(); self.horzLine179 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.edit539 ~= nil then self.edit539:destroy(); self.edit539 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.comboBox85 ~= nil then self.comboBox85:destroy(); self.comboBox85 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.layout293 ~= nil then self.layout293:destroy(); self.layout293 = nil; end;
        if self.rectangle127 ~= nil then self.rectangle127:destroy(); self.rectangle127 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.button69 ~= nil then self.button69:destroy(); self.button69 = nil; end;
        if self.edit601 ~= nil then self.edit601:destroy(); self.edit601 = nil; end;
        if self.horzLine29 ~= nil then self.horzLine29:destroy(); self.horzLine29 = nil; end;
        if self.edit611 ~= nil then self.edit611:destroy(); self.edit611 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.comboBox61 ~= nil then self.comboBox61:destroy(); self.comboBox61 = nil; end;
        if self.rectangle108 ~= nil then self.rectangle108:destroy(); self.rectangle108 = nil; end;
        if self.rclArmasRanged ~= nil then self.rclArmasRanged:destroy(); self.rclArmasRanged = nil; end;
        if self.edit548 ~= nil then self.edit548:destroy(); self.edit548 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.edit305 ~= nil then self.edit305:destroy(); self.edit305 = nil; end;
        if self.horzLine85 ~= nil then self.horzLine85:destroy(); self.horzLine85 = nil; end;
        if self.horzLine95 ~= nil then self.horzLine95:destroy(); self.horzLine95 = nil; end;
        if self.checkBox64 ~= nil then self.checkBox64:destroy(); self.checkBox64 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.button128 ~= nil then self.button128:destroy(); self.button128 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.edit441 ~= nil then self.edit441:destroy(); self.edit441 = nil; end;
        if self.horzLine137 ~= nil then self.horzLine137:destroy(); self.horzLine137 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit324 ~= nil then self.edit324:destroy(); self.edit324 = nil; end;
        if self.comboBox92 ~= nil then self.comboBox92:destroy(); self.comboBox92 = nil; end;
        if self.layout288 ~= nil then self.layout288:destroy(); self.layout288 = nil; end;
        if self.edit504 ~= nil then self.edit504:destroy(); self.edit504 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.horzLine32 ~= nil then self.horzLine32:destroy(); self.horzLine32 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.button81 ~= nil then self.button81:destroy(); self.button81 = nil; end;
        if self.edit490 ~= nil then self.edit490:destroy(); self.edit490 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.rectangle135 ~= nil then self.rectangle135:destroy(); self.rectangle135 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.horzLine17 ~= nil then self.horzLine17:destroy(); self.horzLine17 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit466 ~= nil then self.edit466:destroy(); self.edit466 = nil; end;
        if self.edit474 ~= nil then self.edit474:destroy(); self.edit474 = nil; end;
        if self.horzLine143 ~= nil then self.horzLine143:destroy(); self.horzLine143 = nil; end;
        if self.horzLine153 ~= nil then self.horzLine153:destroy(); self.horzLine153 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.edit523 ~= nil then self.edit523:destroy(); self.edit523 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.edit453 ~= nil then self.edit453:destroy(); self.edit453 = nil; end;
        if self.GiganteAVapor ~= nil then self.GiganteAVapor:destroy(); self.GiganteAVapor = nil; end;
        if self.button77 ~= nil then self.button77:destroy(); self.button77 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit570 ~= nil then self.edit570:destroy(); self.edit570 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.edit583 ~= nil then self.edit583:destroy(); self.edit583 = nil; end;
        if self.edit593 ~= nil then self.edit593:destroy(); self.edit593 = nil; end;
        if self.horzLine43 ~= nil then self.horzLine43:destroy(); self.horzLine43 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.layout241 ~= nil then self.layout241:destroy(); self.layout241 = nil; end;
        if self.layout251 ~= nil then self.layout251:destroy(); self.layout251 = nil; end;
        if self.edit354 ~= nil then self.edit354:destroy(); self.edit354 = nil; end;
        if self.button110 ~= nil then self.button110:destroy(); self.button110 = nil; end;
        if self.button97 ~= nil then self.button97:destroy(); self.button97 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.horzLine164 ~= nil then self.horzLine164:destroy(); self.horzLine164 = nil; end;
        if self.scrollBox11 ~= nil then self.scrollBox11:destroy(); self.scrollBox11 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.layout290 ~= nil then self.layout290:destroy(); self.layout290 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.edit604 ~= nil then self.edit604:destroy(); self.edit604 = nil; end;
        if self.edit612 ~= nil then self.edit612:destroy(); self.edit612 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.comboBox62 ~= nil then self.comboBox62:destroy(); self.comboBox62 = nil; end;
        if self.horzLine58 ~= nil then self.horzLine58:destroy(); self.horzLine58 = nil; end;
        if self.layout266 ~= nil then self.layout266:destroy(); self.layout266 = nil; end;
        if self.layout274 ~= nil then self.layout274:destroy(); self.layout274 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit306 ~= nil then self.edit306:destroy(); self.edit306 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.horzLine98 ~= nil then self.horzLine98:destroy(); self.horzLine98 = nil; end;
        if self.checkBox61 ~= nil then self.checkBox61:destroy(); self.checkBox61 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.horzLine119 ~= nil then self.horzLine119:destroy(); self.horzLine119 = nil; end;
        if self.edit321 ~= nil then self.edit321:destroy(); self.edit321 = nil; end;
        if self.comboBox91 ~= nil then self.comboBox91:destroy(); self.comboBox91 = nil; end;
        if self.comboBox30 ~= nil then self.comboBox30:destroy(); self.comboBox30 = nil; end;
        if self.edit509 ~= nil then self.edit509:destroy(); self.edit509 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.horzLine35 ~= nil then self.horzLine35:destroy(); self.horzLine35 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.rectangle136 ~= nil then self.rectangle136:destroy(); self.rectangle136 = nil; end;
        if self.edit495 ~= nil then self.edit495:destroy(); self.edit495 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.edit568 ~= nil then self.edit568:destroy(); self.edit568 = nil; end;
        if self.edit299 ~= nil then self.edit299:destroy(); self.edit299 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button108 ~= nil then self.button108:destroy(); self.button108 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit461 ~= nil then self.edit461:destroy(); self.edit461 = nil; end;
        if self.edit471 ~= nil then self.edit471:destroy(); self.edit471 = nil; end;
        if self.edit336 ~= nil then self.edit336:destroy(); self.edit336 = nil; end;
        if self.horzLine150 ~= nil then self.horzLine150:destroy(); self.horzLine150 = nil; end;
        if self.button55 ~= nil then self.button55:destroy(); self.button55 = nil; end;
        if self.edit389 ~= nil then self.edit389:destroy(); self.edit389 = nil; end;
        if self.edit524 ~= nil then self.edit524:destroy(); self.edit524 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.edit450 ~= nil then self.edit450:destroy(); self.edit450 = nil; end;
        if self.comboBox79 ~= nil then self.comboBox79:destroy(); self.comboBox79 = nil; end;
        if self.button74 ~= nil then self.button74:destroy(); self.button74 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit482 ~= nil then self.edit482:destroy(); self.edit482 = nil; end;
        if self.edit573 ~= nil then self.edit573:destroy(); self.edit573 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit580 ~= nil then self.edit580:destroy(); self.edit580 = nil; end;
        if self.edit596 ~= nil then self.edit596:destroy(); self.edit596 = nil; end;
        if self.horzLine102 ~= nil then self.horzLine102:destroy(); self.horzLine102 = nil; end;
        if self.horzLine40 ~= nil then self.horzLine40:destroy(); self.horzLine40 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit357 ~= nil then self.edit357:destroy(); self.edit357 = nil; end;
        if self.button113 ~= nil then self.button113:destroy(); self.button113 = nil; end;
        if self.button90 ~= nil then self.button90:destroy(); self.button90 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.edit402 ~= nil then self.edit402:destroy(); self.edit402 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.horzLine167 ~= nil then self.horzLine167:destroy(); self.horzLine167 = nil; end;
        if self.horzLine177 ~= nil then self.horzLine177:destroy(); self.horzLine177 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.layout200 ~= nil then self.layout200:destroy(); self.layout200 = nil; end;
        if self.button63 ~= nil then self.button63:destroy(); self.button63 = nil; end;
        if self.edit607 ~= nil then self.edit607:destroy(); self.edit607 = nil; end;
        if self.edit617 ~= nil then self.edit617:destroy(); self.edit617 = nil; end;
        if self.edit510 ~= nil then self.edit510:destroy(); self.edit510 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.horzLine67 ~= nil then self.horzLine67:destroy(); self.horzLine67 = nil; end;
        if self.horzLine57 ~= nil then self.horzLine57:destroy(); self.horzLine57 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout261 ~= nil then self.layout261:destroy(); self.layout261 = nil; end;
        if self.layout271 ~= nil then self.layout271:destroy(); self.layout271 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit303 ~= nil then self.edit303:destroy(); self.edit303 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.edit273 ~= nil then self.edit273:destroy(); self.edit273 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.comboBox94 ~= nil then self.comboBox94:destroy(); self.comboBox94 = nil; end;
        if self.comboBox33 ~= nil then self.comboBox33:destroy(); self.comboBox33 = nil; end;
        if self.comboBox23 ~= nil then self.comboBox23:destroy(); self.comboBox23 = nil; end;
        if self.layout282 ~= nil then self.layout282:destroy(); self.layout282 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.rectangle118 ~= nil then self.rectangle118:destroy(); self.rectangle118 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit546 ~= nil then self.edit546:destroy(); self.edit546 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.horzLine78 ~= nil then self.horzLine78:destroy(); self.horzLine78 = nil; end;
        if self.edit362 ~= nil then self.edit362:destroy(); self.edit362 = nil; end;
        if self.button126 ~= nil then self.button126:destroy(); self.button126 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.horzLine139 ~= nil then self.horzLine139:destroy(); self.horzLine139 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit472 ~= nil then self.edit472:destroy(); self.edit472 = nil; end;
        if self.edit335 ~= nil then self.edit335:destroy(); self.edit335 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button56 ~= nil then self.button56:destroy(); self.button56 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.edit394 ~= nil then self.edit394:destroy(); self.edit394 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.edit529 ~= nil then self.edit529:destroy(); self.edit529 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.button79 ~= nil then self.button79:destroy(); self.button79 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit481 ~= nil then self.edit481:destroy(); self.edit481 = nil; end;
        if self.edit420 ~= nil then self.edit420:destroy(); self.edit420 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.edit585 ~= nil then self.edit585:destroy(); self.edit585 = nil; end;
        if self.edit595 ~= nil then self.edit595:destroy(); self.edit595 = nil; end;
        if self.horzLine101 ~= nil then self.horzLine101:destroy(); self.horzLine101 = nil; end;
        if self.edit379 ~= nil then self.edit379:destroy(); self.edit379 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.edit401 ~= nil then self.edit401:destroy(); self.edit401 = nil; end;
        if self.edit411 ~= nil then self.edit411:destroy(); self.edit411 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.horzLine162 ~= nil then self.horzLine162:destroy(); self.horzLine162 = nil; end;
        if self.horzLine170 ~= nil then self.horzLine170:destroy(); self.horzLine170 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit532 ~= nil then self.edit532:destroy(); self.edit532 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.layout207 ~= nil then self.layout207:destroy(); self.layout207 = nil; end;
        if self.button66 ~= nil then self.button66:destroy(); self.button66 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.comboBox49 ~= nil then self.comboBox49:destroy(); self.comboBox49 = nil; end;
        if self.edit517 ~= nil then self.edit517:destroy(); self.edit517 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.horzLine183 ~= nil then self.horzLine183:destroy(); self.horzLine183 = nil; end;
        if self.horzLine60 ~= nil then self.horzLine60:destroy(); self.horzLine60 = nil; end;
        if self.horzLine52 ~= nil then self.horzLine52:destroy(); self.horzLine52 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.layout272 ~= nil then self.layout272:destroy(); self.layout272 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.horzLine113 ~= nil then self.horzLine113:destroy(); self.horzLine113 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.layout191 ~= nil then self.layout191:destroy(); self.layout191 = nil; end;
        if self.layout181 ~= nil then self.layout181:destroy(); self.layout181 = nil; end;
        if self.comboBox36 ~= nil then self.comboBox36:destroy(); self.comboBox36 = nil; end;
        if self.comboBox24 ~= nil then self.comboBox24:destroy(); self.comboBox24 = nil; end;
        if self.layout281 ~= nil then self.layout281:destroy(); self.layout281 = nil; end;
        if self.layout220 ~= nil then self.layout220:destroy(); self.layout220 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit543 ~= nil then self.edit543:destroy(); self.edit543 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.horzLine88 ~= nil then self.horzLine88:destroy(); self.horzLine88 = nil; end;
        if self.layout211 ~= nil then self.layout211:destroy(); self.layout211 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.edit367 ~= nil then self.edit367:destroy(); self.edit367 = nil; end;
        if self.button123 ~= nil then self.button123:destroy(); self.button123 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.edit330 ~= nil then self.edit330:destroy(); self.edit330 = nil; end;
        if self.horzLine148 ~= nil then self.horzLine148:destroy(); self.horzLine148 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.edit387 ~= nil then self.edit387:destroy(); self.edit387 = nil; end;
        if self.edit397 ~= nil then self.edit397:destroy(); self.edit397 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.rectangle138 ~= nil then self.rectangle138:destroy(); self.rectangle138 = nil; end;
        if self.edit558 ~= nil then self.edit558:destroy(); self.edit558 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.horzLine18 ~= nil then self.horzLine18:destroy(); self.horzLine18 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit484 ~= nil then self.edit484:destroy(); self.edit484 = nil; end;
        if self.edit423 ~= nil then self.edit423:destroy(); self.edit423 = nil; end;
        if self.edit598 ~= nil then self.edit598:destroy(); self.edit598 = nil; end;
        if self.horzLine104 ~= nil then self.horzLine104:destroy(); self.horzLine104 = nil; end;
        if self.button138 ~= nil then self.button138:destroy(); self.button138 = nil; end;
        if self.rclEquipamento ~= nil then self.rclEquipamento:destroy(); self.rclEquipamento = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.checkBox55 ~= nil then self.checkBox55:destroy(); self.checkBox55 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.edit404 ~= nil then self.edit404:destroy(); self.edit404 = nil; end;
        if self.edit416 ~= nil then self.edit416:destroy(); self.edit416 = nil; end;
        if self.edit315 ~= nil then self.edit315:destroy(); self.edit315 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.edit535 ~= nil then self.edit535:destroy(); self.edit535 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.button65 ~= nil then self.button65:destroy(); self.button65 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.comboBox54 ~= nil then self.comboBox54:destroy(); self.comboBox54 = nil; end;
        if self.comboBox46 ~= nil then self.comboBox46:destroy(); self.comboBox46 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.horzLine186 ~= nil then self.horzLine186:destroy(); self.horzLine186 = nil; end;
        if self.edit359 ~= nil then self.edit359:destroy(); self.edit359 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.horzLine51 ~= nil then self.horzLine51:destroy(); self.horzLine51 = nil; end;
        if self.horzLine121 ~= nil then self.horzLine121:destroy(); self.horzLine121 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit309 ~= nil then self.edit309:destroy(); self.edit309 = nil; end;
        if self.edit431 ~= nil then self.edit431:destroy(); self.edit431 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.horzLine110 ~= nil then self.horzLine110:destroy(); self.horzLine110 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.edit328 ~= nil then self.edit328:destroy(); self.edit328 = nil; end;
        if self.layout194 ~= nil then self.layout194:destroy(); self.layout194 = nil; end;
        if self.layout182 ~= nil then self.layout182:destroy(); self.layout182 = nil; end;
        if self.comboBox39 ~= nil then self.comboBox39:destroy(); self.comboBox39 = nil; end;
        if self.horzLine21 ~= nil then self.horzLine21:destroy(); self.horzLine21 = nil; end;
        if self.edit619 ~= nil then self.edit619:destroy(); self.edit619 = nil; end;
        if self.layout284 ~= nil then self.layout284:destroy(); self.layout284 = nil; end;
        if self.layout223 ~= nil then self.layout223:destroy(); self.layout223 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.comboBox69 ~= nil then self.comboBox69:destroy(); self.comboBox69 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.rectangle112 ~= nil then self.rectangle112:destroy(); self.rectangle112 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit540 ~= nil then self.edit540:destroy(); self.edit540 = nil; end;
        if self.horzLine76 ~= nil then self.horzLine76:destroy(); self.horzLine76 = nil; end;
        if self.layout216 ~= nil then self.layout216:destroy(); self.layout216 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit364 ~= nil then self.edit364:destroy(); self.edit364 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button120 ~= nil then self.button120:destroy(); self.button120 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.edit380 ~= nil then self.edit380:destroy(); self.edit380 = nil; end;
        if self.edit392 ~= nil then self.edit392:destroy(); self.edit392 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.edit567 ~= nil then self.edit567:destroy(); self.edit567 = nil; end;
        if self.edit557 ~= nil then self.edit557:destroy(); self.edit557 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.edit294 ~= nil then self.edit294:destroy(); self.edit294 = nil; end;
        if self.layout231 ~= nil then self.layout231:destroy(); self.layout231 = nil; end;
        if self.edit426 ~= nil then self.edit426:destroy(); self.edit426 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit343 ~= nil then self.edit343:destroy(); self.edit343 = nil; end;
        if self.edit373 ~= nil then self.edit373:destroy(); self.edit373 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button107 ~= nil then self.button107:destroy(); self.button107 = nil; end;
        if self.button137 ~= nil then self.button137:destroy(); self.button137 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.rclArmasMelee ~= nil then self.rclArmasMelee:destroy(); self.rclArmasMelee = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.edit310 ~= nil then self.edit310:destroy(); self.edit310 = nil; end;
        if self.horzLine168 ~= nil then self.horzLine168:destroy(); self.horzLine168 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.comboBox76 ~= nil then self.comboBox76:destroy(); self.comboBox76 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.edit623 ~= nil then self.edit623:destroy(); self.edit623 = nil; end;
        if self.edit633 ~= nil then self.edit633:destroy(); self.edit633 = nil; end;
        if self.edit578 ~= nil then self.edit578:destroy(); self.edit578 = nil; end;
        if self.layout209 ~= nil then self.layout209:destroy(); self.layout209 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.comboBox53 ~= nil then self.comboBox53:destroy(); self.comboBox53 = nil; end;
        if self.comboBox43 ~= nil then self.comboBox43:destroy(); self.comboBox43 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.layout259 ~= nil then self.layout259:destroy(); self.layout259 = nil; end;
        if self.horzLine185 ~= nil then self.horzLine185:destroy(); self.horzLine185 = nil; end;
        if self.horzLine124 ~= nil then self.horzLine124:destroy(); self.horzLine124 = nil; end;
        if self.button118 ~= nil then self.button118:destroy(); self.button118 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.edit432 ~= nil then self.edit432:destroy(); self.edit432 = nil; end;
        if self.horzLine115 ~= nil then self.horzLine115:destroy(); self.horzLine115 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.comboBox82 ~= nil then self.comboBox82:destroy(); self.comboBox82 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.rectangle122 ~= nil then self.rectangle122:destroy(); self.rectangle122 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.layout197 ~= nil then self.layout197:destroy(); self.layout197 = nil; end;
        if self.layout187 ~= nil then self.layout187:destroy(); self.layout187 = nil; end;
        if self.horzLine22 ~= nil then self.horzLine22:destroy(); self.horzLine22 = nil; end;
        if self.layout226 ~= nil then self.layout226:destroy(); self.layout226 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.rectangle107 ~= nil then self.rectangle107:destroy(); self.rectangle107 = nil; end;
        if self.rectangle117 ~= nil then self.rectangle117:destroy(); self.rectangle117 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.horzLine71 ~= nil then self.horzLine71:destroy(); self.horzLine71 = nil; end;
        if self.horzLine90 ~= nil then self.horzLine90:destroy(); self.horzLine90 = nil; end;
        if self.horzLine82 ~= nil then self.horzLine82:destroy(); self.horzLine82 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit369 ~= nil then self.edit369:destroy(); self.edit369 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.edit444 ~= nil then self.edit444:destroy(); self.edit444 = nil; end;
        if self.horzLine130 ~= nil then self.horzLine130:destroy(); self.horzLine130 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.comboBox99 ~= nil then self.comboBox99:destroy(); self.comboBox99 = nil; end;
        if self.edit501 ~= nil then self.edit501:destroy(); self.edit501 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.button84 ~= nil then self.button84:destroy(); self.button84 = nil; end;
        if self.edit560 ~= nil then self.edit560:destroy(); self.edit560 = nil; end;
        if self.edit552 ~= nil then self.edit552:destroy(); self.edit552 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.edit291 ~= nil then self.edit291:destroy(); self.edit291 = nil; end;
        if self.layout232 ~= nil then self.layout232:destroy(); self.layout232 = nil; end;
        if self.edit429 ~= nil then self.edit429:destroy(); self.edit429 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit344 ~= nil then self.edit344:destroy(); self.edit344 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit376 ~= nil then self.edit376:destroy(); self.edit376 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.button100 ~= nil then self.button100:destroy(); self.button100 = nil; end;
        if self.button132 ~= nil then self.button132:destroy(); self.button132 = nil; end;
        if self.checkBox53 ~= nil then self.checkBox53:destroy(); self.checkBox53 = nil; end;
        if self.edit479 ~= nil then self.edit479:destroy(); self.edit479 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.horzLine146 ~= nil then self.horzLine146:destroy(); self.horzLine146 = nil; end;
        if self.horzLine158 ~= nil then self.horzLine158:destroy(); self.horzLine158 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.edit313 ~= nil then self.edit313:destroy(); self.edit313 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.edit458 ~= nil then self.edit458:destroy(); self.edit458 = nil; end;
        if self.comboBox71 ~= nil then self.comboBox71:destroy(); self.comboBox71 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit626 ~= nil then self.edit626:destroy(); self.edit626 = nil; end;
        if self.edit630 ~= nil then self.edit630:destroy(); self.edit630 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit588 ~= nil then self.edit588:destroy(); self.edit588 = nil; end;
        if self.comboBox102 ~= nil then self.comboBox102:destroy(); self.comboBox102 = nil; end;
        if self.comboBox40 ~= nil then self.comboBox40:destroy(); self.comboBox40 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.layout244 ~= nil then self.layout244:destroy(); self.layout244 = nil; end;
        if self.layout256 ~= nil then self.layout256:destroy(); self.layout256 = nil; end;
        if self.horzLine127 ~= nil then self.horzLine127:destroy(); self.horzLine127 = nil; end;
        if self.button98 ~= nil then self.button98:destroy(); self.button98 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.edit437 ~= nil then self.edit437:destroy(); self.edit437 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.comboBox87 ~= nil then self.comboBox87:destroy(); self.comboBox87 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.rectangle125 ~= nil then self.rectangle125:destroy(); self.rectangle125 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.horzLine27 ~= nil then self.horzLine27:destroy(); self.horzLine27 = nil; end;
        if self.edit518 ~= nil then self.edit518:destroy(); self.edit518 = nil; end;
        if self.layout229 ~= nil then self.layout229:destroy(); self.layout229 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.comboBox67 ~= nil then self.comboBox67:destroy(); self.comboBox67 = nil; end;
        if self.rectangle114 ~= nil then self.rectangle114:destroy(); self.rectangle114 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.layout279 ~= nil then self.layout279:destroy(); self.layout279 = nil; end;
        if self.horzLine97 ~= nil then self.horzLine97:destroy(); self.horzLine97 = nil; end;
        if self.horzLine87 ~= nil then self.horzLine87:destroy(); self.horzLine87 = nil; end;
        if self.checkBox66 ~= nil then self.checkBox66:destroy(); self.checkBox66 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.edit443 ~= nil then self.edit443:destroy(); self.edit443 = nil; end;
        if self.horzLine135 ~= nil then self.horzLine135:destroy(); self.horzLine135 = nil; end;
        if self.edit326 ~= nil then self.edit326:destroy(); self.edit326 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.edit506 ~= nil then self.edit506:destroy(); self.edit506 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit398 ~= nil then self.edit398:destroy(); self.edit398 = nil; end;
        if self.horzLine30 ~= nil then self.horzLine30:destroy(); self.horzLine30 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.button87 ~= nil then self.button87:destroy(); self.button87 = nil; end;
        if self.edit492 ~= nil then self.edit492:destroy(); self.edit492 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit551 ~= nil then self.edit551:destroy(); self.edit551 = nil; end;
        if self.rectangle133 ~= nil then self.rectangle133:destroy(); self.rectangle133 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.edit292 ~= nil then self.edit292:destroy(); self.edit292 = nil; end;
        if self.layout237 ~= nil then self.layout237:destroy(); self.layout237 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.edit349 ~= nil then self.edit349:destroy(); self.edit349 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit375 ~= nil then self.edit375:destroy(); self.edit375 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.button131 ~= nil then self.button131:destroy(); self.button131 = nil; end;
        if self.edit464 ~= nil then self.edit464:destroy(); self.edit464 = nil; end;
        if self.horzLine145 ~= nil then self.horzLine145:destroy(); self.horzLine145 = nil; end;
        if self.horzLine155 ~= nil then self.horzLine155:destroy(); self.horzLine155 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.edit521 ~= nil then self.edit521:destroy(); self.edit521 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit455 ~= nil then self.edit455:destroy(); self.edit455 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.button71 ~= nil then self.button71:destroy(); self.button71 = nil; end;
        if self.edit625 ~= nil then self.edit625:destroy(); self.edit625 = nil; end;
        if self.edit635 ~= nil then self.edit635:destroy(); self.edit635 = nil; end;
        if self.edit489 ~= nil then self.edit489:destroy(); self.edit489 = nil; end;
        if self.edit576 ~= nil then self.edit576:destroy(); self.edit576 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.comboBox101 ~= nil then self.comboBox101:destroy(); self.comboBox101 = nil; end;
        if self.horzLine45 ~= nil then self.horzLine45:destroy(); self.horzLine45 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.layout243 ~= nil then self.layout243:destroy(); self.layout243 = nil; end;
        if self.layout253 ~= nil then self.layout253:destroy(); self.layout253 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit352 ~= nil then self.edit352:destroy(); self.edit352 = nil; end;
        if self.button116 ~= nil then self.button116:destroy(); self.button116 = nil; end;
        if self.button95 ~= nil then self.button95:destroy(); self.button95 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.edit419 ~= nil then self.edit419:destroy(); self.edit419 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.horzLine178 ~= nil then self.horzLine178:destroy(); self.horzLine178 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.comboBox84 ~= nil then self.comboBox84:destroy(); self.comboBox84 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.layout292 ~= nil then self.layout292:destroy(); self.layout292 = nil; end;
        if self.rectangle128 ~= nil then self.rectangle128:destroy(); self.rectangle128 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.edit602 ~= nil then self.edit602:destroy(); self.edit602 = nil; end;
        if self.horzLine28 ~= nil then self.horzLine28:destroy(); self.horzLine28 = nil; end;
        if self.edit610 ~= nil then self.edit610:destroy(); self.edit610 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.comboBox60 ~= nil then self.comboBox60:destroy(); self.comboBox60 = nil; end;
        if self.rectangle109 ~= nil then self.rectangle109:destroy(); self.rectangle109 = nil; end;
        if self.layout264 ~= nil then self.layout264:destroy(); self.layout264 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.edit304 ~= nil then self.edit304:destroy(); self.edit304 = nil; end;
        if self.horzLine84 ~= nil then self.horzLine84:destroy(); self.horzLine84 = nil; end;
        if self.checkBox63 ~= nil then self.checkBox63:destroy(); self.checkBox63 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.horzLine136 ~= nil then self.horzLine136:destroy(); self.horzLine136 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.edit323 ~= nil then self.edit323:destroy(); self.edit323 = nil; end;
        if self.comboBox93 ~= nil then self.comboBox93:destroy(); self.comboBox93 = nil; end;
        if self.layout189 ~= nil then self.layout189:destroy(); self.layout189 = nil; end;
        if self.layout289 ~= nil then self.layout289:destroy(); self.layout289 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.horzLine33 ~= nil then self.horzLine33:destroy(); self.horzLine33 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.button82 ~= nil then self.button82:destroy(); self.button82 = nil; end;
        if self.edit497 ~= nil then self.edit497:destroy(); self.edit497 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.layout219 ~= nil then self.layout219:destroy(); self.layout219 = nil; end;
        if self.rectangle134 ~= nil then self.rectangle134:destroy(); self.rectangle134 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.horzLine14 ~= nil then self.horzLine14:destroy(); self.horzLine14 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.edit467 ~= nil then self.edit467:destroy(); self.edit467 = nil; end;
        if self.edit477 ~= nil then self.edit477:destroy(); self.edit477 = nil; end;
        if self.edit338 ~= nil then self.edit338:destroy(); self.edit338 = nil; end;
        if self.horzLine140 ~= nil then self.horzLine140:destroy(); self.horzLine140 = nil; end;
        if self.horzLine152 ~= nil then self.horzLine152:destroy(); self.horzLine152 = nil; end;
        if self.button53 ~= nil then self.button53:destroy(); self.button53 = nil; end;
        if self.edit522 ~= nil then self.edit522:destroy(); self.edit522 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.edit452 ~= nil then self.edit452:destroy(); self.edit452 = nil; end;
        if self.button76 ~= nil then self.button76:destroy(); self.button76 = nil; end;
        if self.edit628 ~= nil then self.edit628:destroy(); self.edit628 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit571 ~= nil then self.edit571:destroy(); self.edit571 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.edit582 ~= nil then self.edit582:destroy(); self.edit582 = nil; end;
        if self.edit590 ~= nil then self.edit590:destroy(); self.edit590 = nil; end;
        if self.comboBox58 ~= nil then self.comboBox58:destroy(); self.comboBox58 = nil; end;
        if self.horzLine42 ~= nil then self.horzLine42:destroy(); self.horzLine42 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.comboBox104 ~= nil then self.comboBox104:destroy(); self.comboBox104 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.layout250 ~= nil then self.layout250:destroy(); self.layout250 = nil; end;
        if self.edit355 ~= nil then self.edit355:destroy(); self.edit355 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button96 ~= nil then self.button96:destroy(); self.button96 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.button111 ~= nil then self.button111:destroy(); self.button111 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.horzLine165 ~= nil then self.horzLine165:destroy(); self.horzLine165 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmReinosRPG()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmReinosRPG();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmReinosRPG = {
    newEditor = newfrmReinosRPG, 
    new = newfrmReinosRPG, 
    name = "frmReinosRPG", 
    dataType = "rdfRPG", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "time", 
    title = "Reinos De Ferro (auto)", 
    description=""};

frmReinosRPG = _frmReinosRPG;
Firecast.registrarForm(_frmReinosRPG);
Firecast.registrarDataType(_frmReinosRPG);

return _frmReinosRPG;
