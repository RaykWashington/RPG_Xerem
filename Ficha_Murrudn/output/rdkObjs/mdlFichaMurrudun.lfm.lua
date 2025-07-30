require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaMurrudun()
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
    obj:setDataType("fichaMurrudun");
    obj:setTitle("Ficha Murrudun");
    obj:setName("frmFichaMurrudun");

    obj.Styles = GUI.fromHandle(_obj_newObject("form"));
    obj.Styles:setParent(obj);
    obj.Styles:setName("Styles");
    obj.Styles:setAlign("client");
    obj.Styles:setTheme("dark");

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


        local function rolarTesteAtr(atr, nome)
            local rolagem = Firecast.interpretarRolagem("1d12"):concatenar(atr);
            local mesa = Firecast.getMesaDe(sheet);
            mesa.chat:rolarDados(rolagem, 'teste de '..nome);
        end;
        



    


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.Geral);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1.grid.role = "col";
    obj.layout1.grid.width = 8;
    obj.layout1.grid["horz-align"] = "center";
    obj.layout1.grid["auto-height"] = true;
    obj.layout1.grid["cnt-gutter"] = 10;
    obj.layout1.grid["min-width"] = 1000;
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setColor("#343434");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setName("rectangle1");
    lfm_setPropAsString(obj.rectangle1, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setStrokeColor("#999999");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1.grid["padding-top"] = 20;
    obj.rectangle1.grid["padding-left"] = 20;
    obj.rectangle1.grid["padding-right"] = 20;
    obj.rectangle1.grid["padding-bottom"] = 20;

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setSRC("/img/MapaSepia.jpg");
    obj.image1:setAlign("client");
    obj.image1:setOpacity(0.1);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2.grid.role = "col";
    obj.layout2.grid.width = 12;
    obj.layout2.grid["auto-height"] = true;
    obj.layout2.grid["padding-bottom"] = 10;
    obj.layout2.grid["padding-left"] = 50;
    obj.layout2.grid["padding-right"] = 50;
    obj.layout2.grid["padding-top"] = 30;
    obj.layout2.grid["cnt-horz-align"] = "center";
    obj.layout2.grid["cnt-gutter"] = 20;
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2.grid.role = "col";
    obj.rectangle2.grid.width = 2;
    obj.rectangle2.grid["auto-height"] = true;
    obj.rectangle2.grid["min-height"] = 200;
    obj.rectangle2.grid["max-width"] = 200;
    obj.rectangle2.grid["padding-bottom"] = 5;
    obj.rectangle2.grid["padding-top"] = 5;
    obj.rectangle2.grid["padding-left"] = 5;
    obj.rectangle2.grid["padding-right"] = 5;
    obj.rectangle2:setName("rectangle2");
    lfm_setPropAsString(obj.rectangle2, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setXradius(15);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setStrokeColor("#999999");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setColor("#343434");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle2);
    obj.image2:setEditable(true);
    obj.image2.grid.role = "col";
    obj.image2.grid.width = 12;
    obj.image2:setStyle("autoFit");
    obj.image2:setField("imgPers");
    obj.image2.grid["vert-tile"] = true;
    obj.image2:setName("image2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3.grid.role = "col";
    obj.rectangle3.grid.width = 10;
    obj.rectangle3.grid["auto-height"] = true;
    obj.rectangle3:setName("rectangle3");
    lfm_setPropAsString(obj.rectangle3, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setXradius(15);
    obj.rectangle3:setYradius(15);
    obj.rectangle3:setStrokeColor("#999999");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setColor("#343434");
    obj.rectangle3.grid["padding-top"] = 20;
    obj.rectangle3.grid["padding-left"] = 20;
    obj.rectangle3.grid["padding-right"] = 20;
    obj.rectangle3.grid["padding-bottom"] = 20;

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle3);
    obj.layout3.grid.role = "col";
    obj.layout3.grid.width = 8;
    obj.layout3.grid["auto-height"] = true;
    obj.layout3.grid["margin-bottom"] = 5;
    obj.layout3:setName("layout3");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 12;
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setTransparent(true);
    obj.edit1:setField("info_Nome");
    obj.edit1:setType("text");
    obj.edit1:setFontSize(20);
    obj.edit1:setName("edit1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout3);
    obj.horzLine1.grid.role = "col";
    obj.horzLine1.grid.width = 12;
    obj.horzLine1:setName("horzLine1");
    obj.horzLine1:setStrokeColor("#999999");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout3);
    obj.label1.grid.role = "col";
    obj.label1.grid.width = 12;
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setText("Nome");
    obj.label1:setName("label1");
    obj.label1:setFontColor("#9e9e9e");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle3);
    obj.layout4.grid.role = "col";
    obj.layout4.grid.width = 4;
    obj.layout4.grid["auto-height"] = true;
    obj.layout4.grid["margin-bottom"] = 5;
    obj.layout4:setName("layout4");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2.grid.role = "col";
    obj.edit2.grid.width = 12;
    obj.edit2:setHorzTextAlign("leading");
    obj.edit2:setTransparent(true);
    obj.edit2:setField("info_Jogador");
    obj.edit2:setType("text");
    obj.edit2:setFontSize(20);
    obj.edit2:setName("edit2");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout4);
    obj.horzLine2.grid.role = "col";
    obj.horzLine2.grid.width = 12;
    obj.horzLine2:setName("horzLine2");
    obj.horzLine2:setStrokeColor("#999999");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout4);
    obj.label2.grid.role = "col";
    obj.label2.grid.width = 12;
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setText("Jogador");
    obj.label2:setName("label2");
    obj.label2:setFontColor("#9e9e9e");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle3);
    obj.layout5.grid.role = "col";
    obj.layout5.grid.width = 4;
    obj.layout5.grid["auto-height"] = true;
    obj.layout5.grid["margin-bottom"] = 5;
    obj.layout5:setName("layout5");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3.grid.role = "col";
    obj.edit3.grid.width = 12;
    obj.edit3:setHorzTextAlign("leading");
    obj.edit3:setTransparent(true);
    obj.edit3:setField("info_Arquétipo");
    obj.edit3:setType("text");
    obj.edit3:setFontSize(20);
    obj.edit3:setName("edit3");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout5);
    obj.horzLine3.grid.role = "col";
    obj.horzLine3.grid.width = 12;
    obj.horzLine3:setName("horzLine3");
    obj.horzLine3:setStrokeColor("#999999");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout5);
    obj.label3.grid.role = "col";
    obj.label3.grid.width = 12;
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setText("Arquétipo");
    obj.label3:setName("label3");
    obj.label3:setFontColor("#9e9e9e");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle3);
    obj.layout6.grid.role = "col";
    obj.layout6.grid.width = 4;
    obj.layout6.grid["auto-height"] = true;
    obj.layout6.grid["margin-bottom"] = 5;
    obj.layout6:setName("layout6");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4.grid.role = "col";
    obj.edit4.grid.width = 12;
    obj.edit4:setHorzTextAlign("leading");
    obj.edit4:setTransparent(true);
    obj.edit4:setField("info_Nível");
    obj.edit4:setType("number");
    obj.edit4:setFontSize(20);
    obj.edit4:setName("edit4");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout6);
    obj.horzLine4.grid.role = "col";
    obj.horzLine4.grid.width = 12;
    obj.horzLine4:setName("horzLine4");
    obj.horzLine4:setStrokeColor("#999999");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout6);
    obj.label4.grid.role = "col";
    obj.label4.grid.width = 12;
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setText("Nível");
    obj.label4:setName("label4");
    obj.label4:setFontColor("#9e9e9e");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle3);
    obj.layout7.grid.role = "col";
    obj.layout7.grid.width = 4;
    obj.layout7.grid["auto-height"] = true;
    obj.layout7.grid["margin-bottom"] = 5;
    obj.layout7:setName("layout7");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5.grid.role = "col";
    obj.edit5.grid.width = 12;
    obj.edit5:setHorzTextAlign("leading");
    obj.edit5:setTransparent(true);
    obj.edit5:setField("info_Xp");
    obj.edit5:setType("number");
    obj.edit5:setFontSize(20);
    obj.edit5:setName("edit5");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout7);
    obj.horzLine5.grid.role = "col";
    obj.horzLine5.grid.width = 12;
    obj.horzLine5:setName("horzLine5");
    obj.horzLine5:setStrokeColor("#999999");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout7);
    obj.label5.grid.role = "col";
    obj.label5.grid.width = 12;
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setText("Xp");
    obj.label5:setName("label5");
    obj.label5:setFontColor("#9e9e9e");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle3);
    obj.layout8.grid.role = "col";
    obj.layout8.grid.width = 4;
    obj.layout8.grid["auto-height"] = true;
    obj.layout8.grid["margin-bottom"] = 5;
    obj.layout8:setName("layout8");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6.grid.role = "col";
    obj.edit6.grid.width = 12;
    obj.edit6:setHorzTextAlign("leading");
    obj.edit6:setTransparent(true);
    obj.edit6:setField("info_Recompensa");
    obj.edit6:setType("number");
    obj.edit6:setFontSize(20);
    obj.edit6:setName("edit6");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout8);
    obj.horzLine6.grid.role = "col";
    obj.horzLine6.grid.width = 12;
    obj.horzLine6:setName("horzLine6");
    obj.horzLine6:setStrokeColor("#999999");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout8);
    obj.label6.grid.role = "col";
    obj.label6.grid.width = 12;
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setText("Recompensa");
    obj.label6:setName("label6");
    obj.label6:setFontColor("#9e9e9e");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle3);
    obj.layout9.grid.role = "col";
    obj.layout9.grid.width = 4;
    obj.layout9.grid["auto-height"] = true;
    obj.layout9.grid["margin-bottom"] = 5;
    obj.layout9:setName("layout9");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7.grid.role = "col";
    obj.edit7.grid.width = 12;
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setTransparent(true);
    obj.edit7:setField("info_Tesouro");
    obj.edit7:setType("number");
    obj.edit7:setFontSize(20);
    obj.edit7:setName("edit7");

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout9);
    obj.horzLine7.grid.role = "col";
    obj.horzLine7.grid.width = 12;
    obj.horzLine7:setName("horzLine7");
    obj.horzLine7:setStrokeColor("#999999");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout9);
    obj.label7.grid.role = "col";
    obj.label7.grid.width = 12;
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setText("Tesouro");
    obj.label7:setName("label7");
    obj.label7:setFontColor("#9e9e9e");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout2);
    obj.layout10.grid.role = "col";
    obj.layout10.grid.width = 12;
    obj.layout10.grid["auto-height"] = true;
    obj.layout10.grid["padding-top"] = 10;
    obj.layout10.grid["padding-bottom"] = 40;
    obj.layout10.grid["cnt-horz-align"] = "between";
    obj.layout10:setName("layout10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11.grid.role = "col";
    obj.layout11.grid.width = 5;
    obj.layout11.grid["padding-top"] = 10;
    obj.layout11.grid["padding-bottom"] = 40;
    obj.layout11.grid["min-height"] = 400;
    obj.layout11.grid["auto-height"] = true;
    obj.layout11:setName("layout11");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout11);
    obj.label8:setText("Atributos");
    obj.label8.grid.role = "col";
    obj.label8.grid.width = 12;
    obj.label8:setFontSize(25);
    obj.label8.grid["margin-bottom"] = 30;
    obj.label8.grid["margin-top"] = 30;
    obj.label8:setFontColor("white");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout11);
    obj.image3:setSRC("/img/bussola_.png");
    obj.image3.grid.role = "container";
    obj.image3.grid.width = 12;
    obj.image3:setName("image3");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.image3);
    obj.layout12.grid.role = "col";
    obj.layout12.grid.width = 4;
    obj.layout12.grid["auto-height"] = true;
    obj.layout12.grid["cnt-horz-align"] = "center";
    obj.layout12:setName("layout12");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout12);
    obj.image4:setSRC("img/Oficio.png");
    obj.image4.grid.role = "col";
    obj.image4.grid.width = 12;
    obj.image4.grid["max-width"] = 50;
    obj.image4.grid["margin-bottom"] = 5;
    obj.image4:setName("image4");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout12);
    obj.edit8.grid.role = "col";
    obj.edit8.grid.width = 8;
    obj.edit8:setField("atr_Oficio");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setFontSize(20);
    obj.edit8.grid["margin-bottom"] = 5;
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.Oficio = GUI.fromHandle(_obj_newObject("button"));
    obj.Oficio:setParent(obj.layout12);
    obj.Oficio:setName("Oficio");
    obj.Oficio.grid.role = "col";
    obj.Oficio.grid.width = 8;
    obj.Oficio:setText("Oficio");
    obj.Oficio:setHorzTextAlign("center");
    obj.Oficio:setTextTrimming("none");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.image3);
    obj.layout13.grid.role = "col";
    obj.layout13.grid.width = 4;
    obj.layout13.grid["auto-height"] = true;
    obj.layout13.grid["cnt-horz-align"] = "center";
    obj.layout13:setName("layout13");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout13);
    obj.image5:setSRC("img/Corpo.png");
    obj.image5.grid.role = "col";
    obj.image5.grid.width = 12;
    obj.image5.grid["max-width"] = 80;
    obj.image5.grid["margin-bottom"] = 5;
    obj.image5:setName("image5");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout13);
    obj.edit9.grid.role = "col";
    obj.edit9.grid.width = 8;
    obj.edit9:setField("atr_Corpo");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setFontSize(20);
    obj.edit9.grid["margin-bottom"] = 5;
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.Corpo = GUI.fromHandle(_obj_newObject("button"));
    obj.Corpo:setParent(obj.layout13);
    obj.Corpo:setName("Corpo");
    obj.Corpo.grid.role = "col";
    obj.Corpo.grid.width = 8;
    obj.Corpo:setText("Corpo");
    obj.Corpo:setHorzTextAlign("center");
    obj.Corpo:setTextTrimming("none");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.image3);
    obj.layout14.grid.role = "col";
    obj.layout14.grid.width = 4;
    obj.layout14.grid["auto-height"] = true;
    obj.layout14.grid["cnt-horz-align"] = "center";
    obj.layout14:setName("layout14");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout14);
    obj.image6:setSRC("img/Talento.png");
    obj.image6.grid.role = "col";
    obj.image6.grid.width = 12;
    obj.image6.grid["max-width"] = 50;
    obj.image6.grid["margin-bottom"] = 5;
    obj.image6:setName("image6");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout14);
    obj.edit10.grid.role = "col";
    obj.edit10.grid.width = 8;
    obj.edit10:setField("atr_Talento");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setFontSize(20);
    obj.edit10.grid["margin-bottom"] = 5;
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.Talento = GUI.fromHandle(_obj_newObject("button"));
    obj.Talento:setParent(obj.layout14);
    obj.Talento:setName("Talento");
    obj.Talento.grid.role = "col";
    obj.Talento.grid.width = 8;
    obj.Talento:setText("Talento");
    obj.Talento:setHorzTextAlign("center");
    obj.Talento:setTextTrimming("none");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.image3);
    obj.layout15.grid.role = "col";
    obj.layout15.grid.width = 4;
    obj.layout15.grid["auto-height"] = true;
    obj.layout15.grid["cnt-horz-align"] = "center";
    obj.layout15:setName("layout15");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout15);
    obj.image7:setSRC("img/Vontade.png");
    obj.image7.grid.role = "col";
    obj.image7.grid.width = 12;
    obj.image7.grid["max-width"] = 80;
    obj.image7.grid["margin-bottom"] = 5;
    obj.image7:setName("image7");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout15);
    obj.edit11.grid.role = "col";
    obj.edit11.grid.width = 8;
    obj.edit11:setField("atr_Vontade");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setFontSize(20);
    obj.edit11.grid["margin-bottom"] = 5;
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.Vontade = GUI.fromHandle(_obj_newObject("button"));
    obj.Vontade:setParent(obj.layout15);
    obj.Vontade:setName("Vontade");
    obj.Vontade.grid.role = "col";
    obj.Vontade.grid.width = 8;
    obj.Vontade:setText("Vontade");
    obj.Vontade:setHorzTextAlign("center");
    obj.Vontade:setTextTrimming("none");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.image3);
    obj.layout16.grid.role = "col";
    obj.layout16.grid.width = 4;
    obj.layout16:setName("layout16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.image3);
    obj.layout17.grid.role = "col";
    obj.layout17.grid.width = 4;
    obj.layout17.grid["auto-height"] = true;
    obj.layout17.grid["cnt-horz-align"] = "center";
    obj.layout17:setName("layout17");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout17);
    obj.image8:setSRC("img/Alma.png");
    obj.image8.grid.role = "col";
    obj.image8.grid.width = 12;
    obj.image8.grid["max-width"] = 80;
    obj.image8.grid["margin-bottom"] = 5;
    obj.image8:setName("image8");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout17);
    obj.edit12.grid.role = "col";
    obj.edit12.grid.width = 8;
    obj.edit12:setField("atr_Alma");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setFontSize(20);
    obj.edit12.grid["margin-bottom"] = 5;
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.Alma = GUI.fromHandle(_obj_newObject("button"));
    obj.Alma:setParent(obj.layout17);
    obj.Alma:setName("Alma");
    obj.Alma.grid.role = "col";
    obj.Alma.grid.width = 8;
    obj.Alma:setText("Alma");
    obj.Alma:setHorzTextAlign("center");
    obj.Alma:setTextTrimming("none");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.image3);
    obj.layout18.grid.role = "col";
    obj.layout18.grid.width = 4;
    obj.layout18.grid["auto-height"] = true;
    obj.layout18.grid["cnt-horz-align"] = "center";
    obj.layout18:setName("layout18");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout18);
    obj.image9:setSRC("img/Inteligencia.png");
    obj.image9.grid.role = "col";
    obj.image9.grid.width = 12;
    obj.image9.grid["max-width"] = 50;
    obj.image9.grid["margin-bottom"] = 5;
    obj.image9:setName("image9");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout18);
    obj.edit13.grid.role = "col";
    obj.edit13.grid.width = 8;
    obj.edit13:setField("atr_Inteligencia");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontSize(20);
    obj.edit13.grid["margin-bottom"] = 5;
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.Inteligencia = GUI.fromHandle(_obj_newObject("button"));
    obj.Inteligencia:setParent(obj.layout18);
    obj.Inteligencia:setName("Inteligencia");
    obj.Inteligencia.grid.role = "col";
    obj.Inteligencia.grid.width = 8;
    obj.Inteligencia:setText("Inteligencia");
    obj.Inteligencia:setHorzTextAlign("center");
    obj.Inteligencia:setTextTrimming("none");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.image3);
    obj.layout19.grid.role = "col";
    obj.layout19.grid.width = 4;
    obj.layout19.grid["auto-height"] = true;
    obj.layout19.grid["cnt-horz-align"] = "center";
    obj.layout19:setName("layout19");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.layout19);
    obj.image10:setSRC("img/Mente.png");
    obj.image10.grid.role = "col";
    obj.image10.grid.width = 12;
    obj.image10.grid["max-width"] = 80;
    obj.image10.grid["margin-bottom"] = 5;
    obj.image10:setName("image10");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout19);
    obj.edit14.grid.role = "col";
    obj.edit14.grid.width = 8;
    obj.edit14:setField("atr_Mente");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontSize(20);
    obj.edit14.grid["margin-bottom"] = 5;
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.Mente = GUI.fromHandle(_obj_newObject("button"));
    obj.Mente:setParent(obj.layout19);
    obj.Mente:setName("Mente");
    obj.Mente.grid.role = "col";
    obj.Mente.grid.width = 8;
    obj.Mente:setText("Mente");
    obj.Mente:setHorzTextAlign("center");
    obj.Mente:setTextTrimming("none");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.image3);
    obj.layout20.grid.role = "col";
    obj.layout20.grid.width = 4;
    obj.layout20.grid["auto-height"] = true;
    obj.layout20.grid["cnt-horz-align"] = "center";
    obj.layout20:setName("layout20");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.layout20);
    obj.image11:setSRC("img/Sabedoria.png");
    obj.image11.grid.role = "col";
    obj.image11.grid.width = 12;
    obj.image11.grid["max-width"] = 50;
    obj.image11.grid["margin-bottom"] = 5;
    obj.image11:setName("image11");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout20);
    obj.edit15.grid.role = "col";
    obj.edit15.grid.width = 8;
    obj.edit15:setField("atr_Sabedoria");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setFontSize(20);
    obj.edit15.grid["margin-bottom"] = 5;
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.Sabedoria = GUI.fromHandle(_obj_newObject("button"));
    obj.Sabedoria:setParent(obj.layout20);
    obj.Sabedoria:setName("Sabedoria");
    obj.Sabedoria.grid.role = "col";
    obj.Sabedoria.grid.width = 8;
    obj.Sabedoria:setText("Sabedoria");
    obj.Sabedoria:setHorzTextAlign("center");
    obj.Sabedoria:setTextTrimming("none");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout10);
    obj.layout21.grid.role = "col";
    obj.layout21.grid.width = 7;
    obj.layout21.grid["padding-top"] = 10;
    obj.layout21.grid["padding-bottom"] = 40;
    obj.layout21.grid["min-height"] = 400;
    obj.layout21.grid["auto-height"] = true;
    obj.layout21.grid["cnt-horz-align"] = "end";
    obj.layout21:setName("layout21");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout21);
    obj.label9:setText("Marcadores de Atributos");
    obj.label9.grid.role = "col";
    obj.label9.grid.width = 12;
    obj.label9:setFontSize(25);
    obj.label9.grid["margin-bottom"] = 30;
    obj.label9.grid["margin-top"] = 30;
    obj.label9:setFontColor("white");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout21);
    obj.rectangle4.grid.role = "col";
    obj.rectangle4.grid.width = 12;
    obj.rectangle4.grid["auto-height"] = true;
    obj.rectangle4.grid["padding-top"] = 20;
    obj.rectangle4.grid["padding-bottom"] = 20;
    obj.rectangle4:setName("rectangle4");
    lfm_setPropAsString(obj.rectangle4, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setXradius(15);
    obj.rectangle4:setYradius(15);
    obj.rectangle4:setStrokeColor("#999999");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setColor("#343434");
    obj.rectangle4.grid["padding-left"] = 20;
    obj.rectangle4.grid["padding-right"] = 20;

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle4);
    obj.layout22.grid.role = "col";
    obj.layout22.grid.width = 3;
    obj.layout22.grid["auto-height"] = true;
    obj.layout22.grid["cnt-horz-align"] = "center";
    obj.layout22.grid["cnt-vert-align"] = "top";
    obj.layout22:setName("layout22");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.layout22);
    obj.image12:setSRC("img/Vitalidade.png");
    obj.image12.grid.role = "col";
    obj.image12.grid.width = 12;
    obj.image12.grid["max-width"] = 60;
    obj.image12.grid["margin-bottom"] = 5;
    obj.image12:setName("image12");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout22);
    obj.label10.grid.role = "col";
    obj.label10.grid.width = 8;
    obj.label10:setField("mar_Vitalidade");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setFontSize(20);
    obj.label10.grid["margin-bottom"] = 10;
    obj.label10:setName("label10");
    obj.label10:setFontColor("#9e9e9e");

    obj.Vitalidade = GUI.fromHandle(_obj_newObject("button"));
    obj.Vitalidade:setParent(obj.layout22);
    obj.Vitalidade:setName("Vitalidade");
    obj.Vitalidade.grid.role = "col";
    obj.Vitalidade.grid.width = 8;
    obj.Vitalidade:setText("Vitalidade");
    obj.Vitalidade:setHorzTextAlign("center");
    obj.Vitalidade:setTextTrimming("none");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle4);
    obj.layout23.grid.role = "col";
    obj.layout23.grid.width = 3;
    obj.layout23.grid["auto-height"] = true;
    obj.layout23.grid["cnt-horz-align"] = "center";
    obj.layout23.grid["cnt-vert-align"] = "top";
    obj.layout23:setName("layout23");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.layout23);
    obj.image13:setSRC("img/Espiritualidade.png");
    obj.image13.grid.role = "col";
    obj.image13.grid.width = 12;
    obj.image13.grid["max-width"] = 60;
    obj.image13.grid["margin-bottom"] = 5;
    obj.image13:setName("image13");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout23);
    obj.label11.grid.role = "col";
    obj.label11.grid.width = 8;
    obj.label11:setField("mar_Espiritual");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontSize(20);
    obj.label11.grid["margin-bottom"] = 10;
    obj.label11:setName("label11");
    obj.label11:setFontColor("#9e9e9e");

    obj.Espiritual = GUI.fromHandle(_obj_newObject("button"));
    obj.Espiritual:setParent(obj.layout23);
    obj.Espiritual:setName("Espiritual");
    obj.Espiritual.grid.role = "col";
    obj.Espiritual.grid.width = 8;
    obj.Espiritual:setText("Espiritual");
    obj.Espiritual:setHorzTextAlign("center");
    obj.Espiritual:setTextTrimming("none");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle4);
    obj.layout24.grid.role = "col";
    obj.layout24.grid.width = 3;
    obj.layout24.grid["auto-height"] = true;
    obj.layout24.grid["cnt-horz-align"] = "center";
    obj.layout24.grid["cnt-vert-align"] = "top";
    obj.layout24:setName("layout24");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.layout24);
    obj.image14:setSRC("img/Raciocinio.png");
    obj.image14.grid.role = "col";
    obj.image14.grid.width = 12;
    obj.image14.grid["max-width"] = 60;
    obj.image14.grid["margin-bottom"] = 5;
    obj.image14:setName("image14");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout24);
    obj.label12.grid.role = "col";
    obj.label12.grid.width = 8;
    obj.label12:setField("mar_Raciocinio");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setFontSize(20);
    obj.label12.grid["margin-bottom"] = 10;
    obj.label12:setName("label12");
    obj.label12:setFontColor("#9e9e9e");

    obj.Raciocinio = GUI.fromHandle(_obj_newObject("button"));
    obj.Raciocinio:setParent(obj.layout24);
    obj.Raciocinio:setName("Raciocinio");
    obj.Raciocinio.grid.role = "col";
    obj.Raciocinio.grid.width = 8;
    obj.Raciocinio:setText("Raciocinio");
    obj.Raciocinio:setHorzTextAlign("center");
    obj.Raciocinio:setTextTrimming("none");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle4);
    obj.layout25.grid.role = "col";
    obj.layout25.grid.width = 3;
    obj.layout25.grid["auto-height"] = true;
    obj.layout25.grid["cnt-horz-align"] = "center";
    obj.layout25.grid["cnt-vert-align"] = "top";
    obj.layout25:setName("layout25");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.layout25);
    obj.image15:setSRC("img/Energia.png");
    obj.image15.grid.role = "col";
    obj.image15.grid.width = 12;
    obj.image15.grid["max-width"] = 60;
    obj.image15.grid["margin-bottom"] = 5;
    obj.image15:setName("image15");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout25);
    obj.label13.grid.role = "col";
    obj.label13.grid.width = 8;
    obj.label13:setField("mar_Energia");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setFontSize(20);
    obj.label13.grid["margin-bottom"] = 10;
    obj.label13:setName("label13");
    obj.label13:setFontColor("#9e9e9e");

    obj.Energia = GUI.fromHandle(_obj_newObject("button"));
    obj.Energia:setParent(obj.layout25);
    obj.Energia:setName("Energia");
    obj.Energia.grid.role = "col";
    obj.Energia.grid.width = 8;
    obj.Energia:setText("Energia");
    obj.Energia:setHorzTextAlign("center");
    obj.Energia:setTextTrimming("none");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout21);
    obj.dataLink1:setFields({'atr_Corpo', 'atr_Alma', 'atr_Mente', 'atr_Vontade','atr_Talento', 'atr_Sabedoria', 'atr_Inteligencia', 'atr_Oficio', 'mar_Vitalidade', 'mar_Espiritual', 'mar_Raciocinio', 'mar_Energia'});
    obj.dataLink1:setName("dataLink1");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout21);
    obj.label14:setText("Itens");
    obj.label14.grid.role = "col";
    obj.label14.grid.width = 12;
    obj.label14:setFontSize(25);
    obj.label14.grid["margin-bottom"] = 30;
    obj.label14.grid["margin-top"] = 30;
    obj.label14:setFontColor("white");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout21);
    obj.rectangle5.grid.role = "col";
    obj.rectangle5.grid.width = 12;
    obj.rectangle5.grid["auto-height"] = true;
    obj.rectangle5.grid["min-height"] = 250;
    obj.rectangle5.grid["padding-top"] = 20;
    obj.rectangle5.grid["padding-bottom"] = 20;
    obj.rectangle5.grid["padding-left"] = 20;
    obj.rectangle5.grid["padding-right"] = 20;
    obj.rectangle5:setName("rectangle5");
    lfm_setPropAsString(obj.rectangle5, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setXradius(15);
    obj.rectangle5:setYradius(15);
    obj.rectangle5:setStrokeColor("#999999");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setColor("#343434");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle5);
    obj.textEditor1:setField("itens");
    obj.textEditor1.grid.role = "row";
    obj.textEditor1:setWidth(12);
    obj.textEditor1.grid["vert-tile"] = true;
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setFontSize(15);
    obj.textEditor1:setName("textEditor1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Historia");
    obj.tab2:setName("tab2");

    obj.Historia = GUI.fromHandle(_obj_newObject("form"));
    obj.Historia:setParent(obj.tab2);
    obj.Historia:setName("Historia");
    obj.Historia:setAlign("client");
    obj.Historia:setTheme("dark");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.Historia);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox2);
    obj.layout26.grid.role = "col";
    obj.layout26.grid.width = 8;
    obj.layout26.grid["horz-align"] = "center";
    obj.layout26.grid["auto-height"] = true;
    obj.layout26.grid["cnt-gutter"] = 10;
    obj.layout26.grid["min-width"] = 1000;
    obj.layout26.grid["padding-bottom"] = 50;
    obj.layout26:setName("layout26");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout26);
    obj.rectangle6:setColor("#343434");
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setName("rectangle6");
    lfm_setPropAsString(obj.rectangle6, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setXradius(15);
    obj.rectangle6:setYradius(15);
    obj.rectangle6:setStrokeColor("#999999");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6.grid["padding-top"] = 20;
    obj.rectangle6.grid["padding-left"] = 20;
    obj.rectangle6.grid["padding-right"] = 20;
    obj.rectangle6.grid["padding-bottom"] = 20;

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.layout26);
    obj.image16:setSRC("/img/MapaSepia.jpg");
    obj.image16:setAlign("client");
    obj.image16:setOpacity(0.2);
    obj.image16:setStyle("autoFit");
    obj.image16:setName("image16");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27.grid.role = "col";
    obj.layout27.grid.width = 12;
    obj.layout27.grid["auto-height"] = true;
    obj.layout27.grid["padding-bottom"] = 10;
    obj.layout27.grid["padding-left"] = 50;
    obj.layout27.grid["padding-right"] = 50;
    obj.layout27.grid["padding-top"] = 30;
    obj.layout27.grid["cnt-horz-align"] = "start";
    obj.layout27.grid["cnt-gutter"] = 20;
    obj.layout27:setName("layout27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout27);
    obj.layout28.grid.role = "col";
    obj.layout28.grid.width = 6;
    obj.layout28.grid["auto-height"] = true;
    obj.layout28:setName("layout28");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout28);
    obj.label15:setText("História");
    obj.label15.grid.role = "col";
    obj.label15.grid.width = 12;
    obj.label15:setFontSize(25);
    obj.label15.grid["margin-bottom"] = 30;
    obj.label15.grid["margin-top"] = 30;
    obj.label15:setFontColor("white");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout28);
    obj.rectangle7.grid.role = "col";
    obj.rectangle7.grid.width = 12;
    obj.rectangle7.grid["auto-height"] = true;
    obj.rectangle7.grid["min-height"] = 280;
    obj.rectangle7.grid["padding-top"] = 20;
    obj.rectangle7.grid["padding-bottom"] = 20;
    obj.rectangle7.grid["padding-left"] = 20;
    obj.rectangle7.grid["padding-right"] = 20;
    obj.rectangle7:setColor("#343434");
    obj.rectangle7:setName("rectangle7");
    lfm_setPropAsString(obj.rectangle7, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setXradius(15);
    obj.rectangle7:setYradius(15);
    obj.rectangle7:setStrokeColor("#999999");
    obj.rectangle7:setStrokeSize(1);

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle7);
    obj.textEditor2:setField("historia");
    obj.textEditor2.grid.role = "row";
    obj.textEditor2:setWidth(12);
    obj.textEditor2.grid["vert-tile"] = true;
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontSize(15);
    obj.textEditor2:setName("textEditor2");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout28);
    obj.label16:setText("Conexões");
    obj.label16.grid.role = "col";
    obj.label16.grid.width = 12;
    obj.label16:setFontSize(25);
    obj.label16.grid["margin-bottom"] = 30;
    obj.label16.grid["margin-top"] = 30;
    obj.label16:setFontColor("white");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout28);
    obj.rectangle8.grid.role = "col";
    obj.rectangle8.grid.width = 12;
    obj.rectangle8.grid["auto-height"] = true;
    obj.rectangle8.grid["min-height"] = 280;
    obj.rectangle8.grid["padding-top"] = 20;
    obj.rectangle8.grid["padding-bottom"] = 20;
    obj.rectangle8.grid["padding-left"] = 20;
    obj.rectangle8.grid["padding-right"] = 20;
    obj.rectangle8:setColor("#343434");
    obj.rectangle8:setName("rectangle8");
    lfm_setPropAsString(obj.rectangle8, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setXradius(15);
    obj.rectangle8:setYradius(15);
    obj.rectangle8:setStrokeColor("#999999");
    obj.rectangle8:setStrokeSize(1);

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle8);
    obj.textEditor3:setField("conexoes");
    obj.textEditor3.grid.role = "row";
    obj.textEditor3:setWidth(12);
    obj.textEditor3.grid["vert-tile"] = true;
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setFontSize(15);
    obj.textEditor3:setName("textEditor3");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout27);
    obj.layout29.grid.role = "col";
    obj.layout29.grid.width = 6;
    obj.layout29.grid["min-height"] = 800;
    obj.layout29.grid["cnt-vert-align"] = "bottom";
    obj.layout29:setName("layout29");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout29);
    obj.label17:setText("Créditos");
    obj.label17.grid.role = "col";
    obj.label17.grid.width = 12;
    obj.label17:setFontSize(25);
    obj.label17.grid["margin-bottom"] = 30;
    obj.label17.grid["margin-top"] = 30;
    obj.label17:setFontColor("white");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout29);
    obj.layout30.grid.role = "col";
    obj.layout30.grid.width = 12;
    obj.layout30.grid["auto-height"] = true;
    obj.layout30.grid["min-height"] = 300;
    obj.layout30.grid["margin-bottom"] = 30;
    obj.layout30:setName("layout30");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.layout30);
    obj.image17:setSRC("/img/xerem_profile.png");
    obj.image17:setAlign("client");
    obj.image17:setStyle("proportional");
    obj.image17:setName("image17");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout29);
    obj.button1:setText("Malovany \"Pinto\" Bruno");
    obj.button1.grid.role = "col";
    obj.button1.grid.width = 6;
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout29);
    obj.button2:setText("Xerém Destrói O RPG de Mesa");
    obj.button2.grid.role = "col";
    obj.button2.grid.width = 6;
    obj.button2:setName("button2");

    obj._e_event0 = obj.Oficio:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_Oficio, self.Oficio.text)
        end);

    obj._e_event1 = obj.Corpo:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_Corpo, self.Corpo.text)
        end);

    obj._e_event2 = obj.Talento:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_Talento, self.Talento.text)
        end);

    obj._e_event3 = obj.Vontade:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_Vontade, self.Vontade.text)
        end);

    obj._e_event4 = obj.Alma:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_Alma, self.Alma.text)
        end);

    obj._e_event5 = obj.Inteligencia:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_Inteligencia, self.Inteligencia.text)
        end);

    obj._e_event6 = obj.Mente:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_Mente, self.Mente.text)
        end);

    obj._e_event7 = obj.Sabedoria:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.atr_Sabedoria, self.Sabedoria.text)
        end);

    obj._e_event8 = obj.Vitalidade:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.mar_Vitalidade, self.Vitalidade.text)
        end);

    obj._e_event9 = obj.Espiritual:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.mar_Espiritual, self.Espiritual.text)
        end);

    obj._e_event10 = obj.Raciocinio:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.mar_Raciocinio, self.Raciocinio.text)
        end);

    obj._e_event11 = obj.Energia:addEventListener("onClick",
        function (event)
            rolarTesteAtr(sheet.mar_Energia, self.Energia.text)
        end);

    obj._e_event12 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.mar_Vitalidade = (tonumber(sheet.atr_Corpo) or 0) + math.abs((tonumber(sheet.atr_Alma)) or 0) + math.abs((tonumber(sheet.atr_Talento) or 0));
                                                sheet.mar_Espiritual = (tonumber(sheet.atr_Alma) or 0) + math.abs((tonumber(sheet.atr_Talento)) or 0) + math.abs((tonumber(sheet.atr_Sabedoria) or 0));
                                                sheet.mar_Raciocinio = (tonumber(sheet.atr_Mente) or 0) + math.abs((tonumber(sheet.atr_Sabedoria)) or 0) + math.abs((tonumber(sheet.atr_Inteligencia) or 0));
                                                sheet.mar_Energia = (tonumber(sheet.atr_Vontade) or 0) + math.abs((tonumber(sheet.atr_Inteligencia)) or 0) + math.abs((tonumber(sheet.atr_Oficio) or 0));
        end);

    obj._e_event13 = obj.button1:addEventListener("onClick",
        function (event)
            GUI.openInBrowser('https://www.instagram.com/malovanybruno/')
        end);

    obj._e_event14 = obj.button2:addEventListener("onClick",
        function (event)
            GUI.openInBrowser('https://open.spotify.com/show/0cO3SWlsJw7nfoRePJjyzV?si=4e8678590abf405c')
        end);

    function obj:_releaseEvents()
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

        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.Vitalidade ~= nil then self.Vitalidade:destroy(); self.Vitalidade = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.Sabedoria ~= nil then self.Sabedoria:destroy(); self.Sabedoria = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.Raciocinio ~= nil then self.Raciocinio:destroy(); self.Raciocinio = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.Historia ~= nil then self.Historia:destroy(); self.Historia = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.Geral ~= nil then self.Geral:destroy(); self.Geral = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.Mente ~= nil then self.Mente:destroy(); self.Mente = nil; end;
        if self.Alma ~= nil then self.Alma:destroy(); self.Alma = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.Styles ~= nil then self.Styles:destroy(); self.Styles = nil; end;
        if self.Inteligencia ~= nil then self.Inteligencia:destroy(); self.Inteligencia = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.Energia ~= nil then self.Energia:destroy(); self.Energia = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.Vontade ~= nil then self.Vontade:destroy(); self.Vontade = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.Talento ~= nil then self.Talento:destroy(); self.Talento = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.Espiritual ~= nil then self.Espiritual:destroy(); self.Espiritual = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.Oficio ~= nil then self.Oficio:destroy(); self.Oficio = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.Corpo ~= nil then self.Corpo:destroy(); self.Corpo = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaMurrudun()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaMurrudun();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaMurrudun = {
    newEditor = newfrmFichaMurrudun, 
    new = newfrmFichaMurrudun, 
    name = "frmFichaMurrudun", 
    dataType = "fichaMurrudun", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Ficha Murrudun", 
    description=""};

frmFichaMurrudun = _frmFichaMurrudun;
Firecast.registrarForm(_frmFichaMurrudun);
Firecast.registrarDataType(_frmFichaMurrudun);

return _frmFichaMurrudun;
