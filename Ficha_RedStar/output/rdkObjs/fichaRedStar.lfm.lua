require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRedStar()
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
    obj:setDataType("fichaRedStar");
    obj:setTitle("Ficha Red Star");
    obj:setName("frmFichaRedStar");

    obj.Styles = GUI.fromHandle(_obj_newObject("form"));
    obj.Styles:setParent(obj);
    obj.Styles:setName("Styles");
    obj.Styles:setAlign("client");
    obj.Styles:setTheme("dark");


        local function rolarTeste(texto, dados, habilidade, dificuldade)
            local mesa =  Firecast.getMesaDe(sheet)
            local sucessos = 0;
            local rolagem = Firecast.interpretarRolagem( dados .. ("d10"));

          
            local dif = 10 - tonumber(habilidade)
            if string.sub(dificuldade,1,1) == "+" then
                    dif = dif + tonumber(string.sub(dificuldade,2))
                elseif string.sub(dificuldade,1,1) == "-" then
                    dif = dif - tonumber(string.sub(dificuldade,2))
                else
                    dif = dif + tonumber(string.sub(dificuldade,2))
            end;

            local promessa = mesa.chat:asyncRoll(rolagem)
            local n, rollObject = await(promessa);
          
           

            for i=1, #rollObject.ops, 1 do
                local operacao = rollObject.ops[i];
                for j = 1, #operacao.resultados, 1 do
                    if operacao.resultados[j] >= dif then
                        sucessos = sucessos + 1;
                    end
                end
            end

            mesa.chat:asyncSendStd(sucessos .. ' sucessos no teste de '..texto .. ' , dificuldade ' ..  dif);
            
            
        end
    



    




    caracteristicas = {
        ['Força'] = 'valfor';
        ['Constituição'] = 'valcon';
        ['Destreza'] = 'valdes';
        ['Percepção'] = 'valper';
        ['Inteligência'] = 'valint';
        ['Força de Vontade'] = 'valfdv';
    }
    habilidades = {
        ['Esportes'] = 'esp';
        ['Combate Desarmado'] = 'combDes';
        ['Armas Brancas' ] = 'armBra';
        ['Armas de Fogo'] = 'armFog';
        ['Ciências' ] = 'cie';
        ['Crime'] = 'cri';
        ['Investigação'] = 'inv';
        ['Maquinário'] = 'maq';
        ['Manipulação'] = 'man';
        ['Medicina'] = 'med';
        ['Sobrevivência'] = 'sob';
        }
    dificuldade = {
        ['Muito Fácil'] = '-3';
        ['Banal'] = '-1';
        ['Padrão'] = '+1';
        ['Difícil'] = '+3';
        ['Épico'] = '+6';
    }
    






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

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.Geral);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setSRC("/img/redstar.png");
    obj.image1:setAlign("top");
    obj.image1:setWidth(125);
    obj.image1:setHeight(75);
    obj.image1:setStyle("proportional");
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1.grid.width = 12;
    obj.layout1.grid["min-width"] = 800;
    obj.layout1.grid["horz-align"] = "center";
    obj.layout1.grid["padding-bottom"] = 50;
    obj.layout1.grid["padding-top"] = 100;
    obj.layout1.grid["padding-left"] = 200;
    obj.layout1.grid["padding-right"] = 200;
    obj.layout1:setName("layout1");
    obj.layout1.grid.role = "col";
    obj.layout1.grid["auto-height"] = true;

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2.grid.width = 12;
    obj.layout2.grid["min-height"] = 150;
    obj.layout2.grid["margin-bottom"] = 5;
    obj.layout2:setName("layout2");
    obj.layout2.grid.role = "col";
    obj.layout2.grid["auto-height"] = true;

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3.grid.role = "col";
    obj.layout3.grid.width = 4;
    obj.layout3.grid["auto-height"] = true;
    obj.layout3.grid["margin-bottom"] = 5;
    obj.layout3:setName("layout3");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 12;
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setTransparent(true);
    obj.edit1:setField("info_Nome: ");
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
    obj.label1:setText("Nome: ");
    obj.label1:setVertTextAlign("trailing");
    obj.label1:setName("label1");
    obj.label1:setFontColor("#9e9e9e");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
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
    obj.edit2:setField("info_Especialização: ");
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
    obj.label2:setText("Especialização: ");
    obj.label2:setVertTextAlign("trailing");
    obj.label2:setName("label2");
    obj.label2:setFontColor("#9e9e9e");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
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
    obj.edit3:setField("info_Idade: ");
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
    obj.label3:setText("Idade: ");
    obj.label3:setVertTextAlign("trailing");
    obj.label3:setName("label3");
    obj.label3:setFontColor("#9e9e9e");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
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
    obj.edit4:setField("info_Jogador: ");
    obj.edit4:setType("text");
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
    obj.label4:setText("Jogador: ");
    obj.label4:setVertTextAlign("trailing");
    obj.label4:setName("label4");
    obj.label4:setFontColor("#9e9e9e");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout2);
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
    obj.edit5:setField("info_Motivação: ");
    obj.edit5:setType("text");
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
    obj.label5:setText("Motivação: ");
    obj.label5:setVertTextAlign("trailing");
    obj.label5:setName("label5");
    obj.label5:setFontColor("#9e9e9e");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout2);
    obj.layout8.grid.role = "col";
    obj.layout8.grid.width = 2;
    obj.layout8.grid["auto-height"] = true;
    obj.layout8.grid["margin-bottom"] = 5;
    obj.layout8:setName("layout8");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6.grid.role = "col";
    obj.edit6.grid.width = 12;
    obj.edit6:setHorzTextAlign("leading");
    obj.edit6:setTransparent(true);
    obj.edit6:setField("info_Campanha: ");
    obj.edit6:setType("text");
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
    obj.label6:setText("Campanha: ");
    obj.label6:setVertTextAlign("trailing");
    obj.label6:setName("label6");
    obj.label6:setFontColor("#9e9e9e");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout2);
    obj.layout9.grid.role = "col";
    obj.layout9.grid.width = 2;
    obj.layout9.grid["auto-height"] = true;
    obj.layout9.grid["margin-bottom"] = 5;
    obj.layout9:setName("layout9");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7.grid.role = "col";
    obj.edit7.grid.width = 12;
    obj.edit7:setHorzTextAlign("leading");
    obj.edit7:setTransparent(true);
    obj.edit7:setField("info_Experiência");
    obj.edit7:setType("text");
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
    obj.label7:setText("Experiência");
    obj.label7:setVertTextAlign("trailing");
    obj.label7:setName("label7");
    obj.label7:setFontColor("#9e9e9e");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10.grid.width = 5;
    obj.layout10.grid["min-height"] = 150;
    obj.layout10.grid["min-width"] = 400;
    obj.layout10.grid["margin-bottom"] = 5;
    obj.layout10:setName("layout10");
    obj.layout10.grid.role = "col";
    obj.layout10.grid["auto-height"] = true;

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11.grid.width = 12;
    obj.layout11.grid["cnt-vert-align"] = "center";
    obj.layout11.grid["margin-bottom"] = 20;
    obj.layout11.grid["margin-top"] = 20;
    obj.layout11:setName("layout11");
    obj.layout11.grid.role = "col";
    obj.layout11.grid["auto-height"] = true;

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout11);
    obj.horzLine8.grid.role = "col";
    obj.horzLine8.grid.width = 12;
    obj.horzLine8:setName("horzLine8");
    obj.horzLine8:setStrokeColor("#999999");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout11);
    obj.label8.grid.role = "col";
    obj.label8.grid.width = 12;
    obj.label8:setFontSize(20);
    obj.label8:setText("CARACTERÍSTICAS");
    obj.label8:setHorzTextAlign("center");
    obj.label8.grid["margin-top"] = 5;
    obj.label8:setName("label8");
    obj.label8:setFontColor("#9e9e9e");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout10);
    obj.layout12.grid.role = "col";
    obj.layout12.grid.width = 12;
    obj.layout12.grid["auto-height"] = true;
    obj.layout12.grid["margin-bottom"] = 5;
    obj.layout12.grid["cnt-horz-align"] = "center";
    obj.layout12:setName("layout12");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout12);
    obj.label9.grid.role = "col";
    obj.label9.grid.width = 3;
    obj.label9:setHorzTextAlign("leading");
    obj.label9:setText("Força");
    obj.label9:setVertTextAlign("trailing");
    obj.label9:setName("label9");
    obj.label9:setFontColor("#9e9e9e");

    obj.radioButton1 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.layout12);
    obj.radioButton1.grid.role = "col";
    obj.radioButton1.grid.width = 1;
    obj.radioButton1:setGroupName("for");
    obj.radioButton1:setField("valfor");
    obj.radioButton1:setFieldValue("1");
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.layout12);
    obj.radioButton2.grid.role = "col";
    obj.radioButton2.grid.width = 1;
    obj.radioButton2:setGroupName("for");
    obj.radioButton2:setField("valfor");
    obj.radioButton2:setFieldValue("2");
    obj.radioButton2:setName("radioButton2");

    obj.radioButton3 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.layout12);
    obj.radioButton3.grid.role = "col";
    obj.radioButton3.grid.width = 1;
    obj.radioButton3:setGroupName("for");
    obj.radioButton3:setField("valfor");
    obj.radioButton3:setFieldValue("3");
    obj.radioButton3:setName("radioButton3");

    obj.radioButton4 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.layout12);
    obj.radioButton4.grid.role = "col";
    obj.radioButton4.grid.width = 1;
    obj.radioButton4:setGroupName("for");
    obj.radioButton4:setField("valfor");
    obj.radioButton4:setFieldValue("4");
    obj.radioButton4:setName("radioButton4");

    obj.radioButton5 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton5:setParent(obj.layout12);
    obj.radioButton5.grid.role = "col";
    obj.radioButton5.grid.width = 1;
    obj.radioButton5:setGroupName("for");
    obj.radioButton5:setField("valfor");
    obj.radioButton5:setFieldValue("5");
    obj.radioButton5:setName("radioButton5");

    obj.radioButton6 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton6:setParent(obj.layout12);
    obj.radioButton6.grid.role = "col";
    obj.radioButton6.grid.width = 1;
    obj.radioButton6:setGroupName("for");
    obj.radioButton6:setField("valfor");
    obj.radioButton6:setFieldValue("6");
    obj.radioButton6:setName("radioButton6");

    obj.radioButton7 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton7:setParent(obj.layout12);
    obj.radioButton7.grid.role = "col";
    obj.radioButton7.grid.width = 1;
    obj.radioButton7:setGroupName("for");
    obj.radioButton7:setField("valfor");
    obj.radioButton7:setFieldValue("7");
    obj.radioButton7:setName("radioButton7");

    obj.radioButton8 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton8:setParent(obj.layout12);
    obj.radioButton8.grid.role = "col";
    obj.radioButton8.grid.width = 1;
    obj.radioButton8:setGroupName("for");
    obj.radioButton8:setField("valfor");
    obj.radioButton8:setFieldValue("8");
    obj.radioButton8:setName("radioButton8");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout10);
    obj.layout13.grid.role = "col";
    obj.layout13.grid.width = 12;
    obj.layout13.grid["auto-height"] = true;
    obj.layout13.grid["margin-bottom"] = 5;
    obj.layout13.grid["cnt-horz-align"] = "center";
    obj.layout13:setName("layout13");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout13);
    obj.label10.grid.role = "col";
    obj.label10.grid.width = 3;
    obj.label10:setHorzTextAlign("leading");
    obj.label10:setText("Constituição");
    obj.label10:setVertTextAlign("trailing");
    obj.label10:setName("label10");
    obj.label10:setFontColor("#9e9e9e");

    obj.radioButton9 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton9:setParent(obj.layout13);
    obj.radioButton9.grid.role = "col";
    obj.radioButton9.grid.width = 1;
    obj.radioButton9:setGroupName("con");
    obj.radioButton9:setField("valcon");
    obj.radioButton9:setFieldValue("1");
    obj.radioButton9:setName("radioButton9");

    obj.radioButton10 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton10:setParent(obj.layout13);
    obj.radioButton10.grid.role = "col";
    obj.radioButton10.grid.width = 1;
    obj.radioButton10:setGroupName("con");
    obj.radioButton10:setField("valcon");
    obj.radioButton10:setFieldValue("2");
    obj.radioButton10:setName("radioButton10");

    obj.radioButton11 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton11:setParent(obj.layout13);
    obj.radioButton11.grid.role = "col";
    obj.radioButton11.grid.width = 1;
    obj.radioButton11:setGroupName("con");
    obj.radioButton11:setField("valcon");
    obj.radioButton11:setFieldValue("3");
    obj.radioButton11:setName("radioButton11");

    obj.radioButton12 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton12:setParent(obj.layout13);
    obj.radioButton12.grid.role = "col";
    obj.radioButton12.grid.width = 1;
    obj.radioButton12:setGroupName("con");
    obj.radioButton12:setField("valcon");
    obj.radioButton12:setFieldValue("4");
    obj.radioButton12:setName("radioButton12");

    obj.radioButton13 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton13:setParent(obj.layout13);
    obj.radioButton13.grid.role = "col";
    obj.radioButton13.grid.width = 1;
    obj.radioButton13:setGroupName("con");
    obj.radioButton13:setField("valcon");
    obj.radioButton13:setFieldValue("5");
    obj.radioButton13:setName("radioButton13");

    obj.radioButton14 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton14:setParent(obj.layout13);
    obj.radioButton14.grid.role = "col";
    obj.radioButton14.grid.width = 1;
    obj.radioButton14:setGroupName("con");
    obj.radioButton14:setField("valcon");
    obj.radioButton14:setFieldValue("6");
    obj.radioButton14:setName("radioButton14");

    obj.radioButton15 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton15:setParent(obj.layout13);
    obj.radioButton15.grid.role = "col";
    obj.radioButton15.grid.width = 1;
    obj.radioButton15:setGroupName("con");
    obj.radioButton15:setField("valcon");
    obj.radioButton15:setFieldValue("7");
    obj.radioButton15:setName("radioButton15");

    obj.radioButton16 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton16:setParent(obj.layout13);
    obj.radioButton16.grid.role = "col";
    obj.radioButton16.grid.width = 1;
    obj.radioButton16:setGroupName("con");
    obj.radioButton16:setField("valcon");
    obj.radioButton16:setFieldValue("8");
    obj.radioButton16:setName("radioButton16");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout10);
    obj.layout14.grid.role = "col";
    obj.layout14.grid.width = 12;
    obj.layout14.grid["auto-height"] = true;
    obj.layout14.grid["margin-bottom"] = 5;
    obj.layout14.grid["cnt-horz-align"] = "center";
    obj.layout14:setName("layout14");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout14);
    obj.label11.grid.role = "col";
    obj.label11.grid.width = 3;
    obj.label11:setHorzTextAlign("leading");
    obj.label11:setText("Destreza");
    obj.label11:setVertTextAlign("trailing");
    obj.label11:setName("label11");
    obj.label11:setFontColor("#9e9e9e");

    obj.radioButton17 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton17:setParent(obj.layout14);
    obj.radioButton17.grid.role = "col";
    obj.radioButton17.grid.width = 1;
    obj.radioButton17:setGroupName("des");
    obj.radioButton17:setField("valdes");
    obj.radioButton17:setFieldValue("1");
    obj.radioButton17:setName("radioButton17");

    obj.radioButton18 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton18:setParent(obj.layout14);
    obj.radioButton18.grid.role = "col";
    obj.radioButton18.grid.width = 1;
    obj.radioButton18:setGroupName("des");
    obj.radioButton18:setField("valdes");
    obj.radioButton18:setFieldValue("2");
    obj.radioButton18:setName("radioButton18");

    obj.radioButton19 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton19:setParent(obj.layout14);
    obj.radioButton19.grid.role = "col";
    obj.radioButton19.grid.width = 1;
    obj.radioButton19:setGroupName("des");
    obj.radioButton19:setField("valdes");
    obj.radioButton19:setFieldValue("3");
    obj.radioButton19:setName("radioButton19");

    obj.radioButton20 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton20:setParent(obj.layout14);
    obj.radioButton20.grid.role = "col";
    obj.radioButton20.grid.width = 1;
    obj.radioButton20:setGroupName("des");
    obj.radioButton20:setField("valdes");
    obj.radioButton20:setFieldValue("4");
    obj.radioButton20:setName("radioButton20");

    obj.radioButton21 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton21:setParent(obj.layout14);
    obj.radioButton21.grid.role = "col";
    obj.radioButton21.grid.width = 1;
    obj.radioButton21:setGroupName("des");
    obj.radioButton21:setField("valdes");
    obj.radioButton21:setFieldValue("5");
    obj.radioButton21:setName("radioButton21");

    obj.radioButton22 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton22:setParent(obj.layout14);
    obj.radioButton22.grid.role = "col";
    obj.radioButton22.grid.width = 1;
    obj.radioButton22:setGroupName("des");
    obj.radioButton22:setField("valdes");
    obj.radioButton22:setFieldValue("6");
    obj.radioButton22:setName("radioButton22");

    obj.radioButton23 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton23:setParent(obj.layout14);
    obj.radioButton23.grid.role = "col";
    obj.radioButton23.grid.width = 1;
    obj.radioButton23:setGroupName("des");
    obj.radioButton23:setField("valdes");
    obj.radioButton23:setFieldValue("7");
    obj.radioButton23:setName("radioButton23");

    obj.radioButton24 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton24:setParent(obj.layout14);
    obj.radioButton24.grid.role = "col";
    obj.radioButton24.grid.width = 1;
    obj.radioButton24:setGroupName("des");
    obj.radioButton24:setField("valdes");
    obj.radioButton24:setFieldValue("8");
    obj.radioButton24:setName("radioButton24");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout10);
    obj.layout15.grid.role = "col";
    obj.layout15.grid.width = 12;
    obj.layout15.grid["auto-height"] = true;
    obj.layout15.grid["margin-bottom"] = 5;
    obj.layout15.grid["cnt-horz-align"] = "center";
    obj.layout15:setName("layout15");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout15);
    obj.label12.grid.role = "col";
    obj.label12.grid.width = 3;
    obj.label12:setHorzTextAlign("leading");
    obj.label12:setText("Percepção");
    obj.label12:setVertTextAlign("trailing");
    obj.label12:setName("label12");
    obj.label12:setFontColor("#9e9e9e");

    obj.radioButton25 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton25:setParent(obj.layout15);
    obj.radioButton25.grid.role = "col";
    obj.radioButton25.grid.width = 1;
    obj.radioButton25:setGroupName("per");
    obj.radioButton25:setField("valper");
    obj.radioButton25:setFieldValue("1");
    obj.radioButton25:setName("radioButton25");

    obj.radioButton26 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton26:setParent(obj.layout15);
    obj.radioButton26.grid.role = "col";
    obj.radioButton26.grid.width = 1;
    obj.radioButton26:setGroupName("per");
    obj.radioButton26:setField("valper");
    obj.radioButton26:setFieldValue("2");
    obj.radioButton26:setName("radioButton26");

    obj.radioButton27 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton27:setParent(obj.layout15);
    obj.radioButton27.grid.role = "col";
    obj.radioButton27.grid.width = 1;
    obj.radioButton27:setGroupName("per");
    obj.radioButton27:setField("valper");
    obj.radioButton27:setFieldValue("3");
    obj.radioButton27:setName("radioButton27");

    obj.radioButton28 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton28:setParent(obj.layout15);
    obj.radioButton28.grid.role = "col";
    obj.radioButton28.grid.width = 1;
    obj.radioButton28:setGroupName("per");
    obj.radioButton28:setField("valper");
    obj.radioButton28:setFieldValue("4");
    obj.radioButton28:setName("radioButton28");

    obj.radioButton29 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton29:setParent(obj.layout15);
    obj.radioButton29.grid.role = "col";
    obj.radioButton29.grid.width = 1;
    obj.radioButton29:setGroupName("per");
    obj.radioButton29:setField("valper");
    obj.radioButton29:setFieldValue("5");
    obj.radioButton29:setName("radioButton29");

    obj.radioButton30 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton30:setParent(obj.layout15);
    obj.radioButton30.grid.role = "col";
    obj.radioButton30.grid.width = 1;
    obj.radioButton30:setGroupName("per");
    obj.radioButton30:setField("valper");
    obj.radioButton30:setFieldValue("6");
    obj.radioButton30:setName("radioButton30");

    obj.radioButton31 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton31:setParent(obj.layout15);
    obj.radioButton31.grid.role = "col";
    obj.radioButton31.grid.width = 1;
    obj.radioButton31:setGroupName("per");
    obj.radioButton31:setField("valper");
    obj.radioButton31:setFieldValue("7");
    obj.radioButton31:setName("radioButton31");

    obj.radioButton32 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton32:setParent(obj.layout15);
    obj.radioButton32.grid.role = "col";
    obj.radioButton32.grid.width = 1;
    obj.radioButton32:setGroupName("per");
    obj.radioButton32:setField("valper");
    obj.radioButton32:setFieldValue("8");
    obj.radioButton32:setName("radioButton32");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout10);
    obj.layout16.grid.role = "col";
    obj.layout16.grid.width = 12;
    obj.layout16.grid["auto-height"] = true;
    obj.layout16.grid["margin-bottom"] = 5;
    obj.layout16.grid["cnt-horz-align"] = "center";
    obj.layout16:setName("layout16");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout16);
    obj.label13.grid.role = "col";
    obj.label13.grid.width = 3;
    obj.label13:setHorzTextAlign("leading");
    obj.label13:setText("Inteligência");
    obj.label13:setVertTextAlign("trailing");
    obj.label13:setName("label13");
    obj.label13:setFontColor("#9e9e9e");

    obj.radioButton33 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton33:setParent(obj.layout16);
    obj.radioButton33.grid.role = "col";
    obj.radioButton33.grid.width = 1;
    obj.radioButton33:setGroupName("int");
    obj.radioButton33:setField("valint");
    obj.radioButton33:setFieldValue("1");
    obj.radioButton33:setName("radioButton33");

    obj.radioButton34 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton34:setParent(obj.layout16);
    obj.radioButton34.grid.role = "col";
    obj.radioButton34.grid.width = 1;
    obj.radioButton34:setGroupName("int");
    obj.radioButton34:setField("valint");
    obj.radioButton34:setFieldValue("2");
    obj.radioButton34:setName("radioButton34");

    obj.radioButton35 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton35:setParent(obj.layout16);
    obj.radioButton35.grid.role = "col";
    obj.radioButton35.grid.width = 1;
    obj.radioButton35:setGroupName("int");
    obj.radioButton35:setField("valint");
    obj.radioButton35:setFieldValue("3");
    obj.radioButton35:setName("radioButton35");

    obj.radioButton36 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton36:setParent(obj.layout16);
    obj.radioButton36.grid.role = "col";
    obj.radioButton36.grid.width = 1;
    obj.radioButton36:setGroupName("int");
    obj.radioButton36:setField("valint");
    obj.radioButton36:setFieldValue("4");
    obj.radioButton36:setName("radioButton36");

    obj.radioButton37 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton37:setParent(obj.layout16);
    obj.radioButton37.grid.role = "col";
    obj.radioButton37.grid.width = 1;
    obj.radioButton37:setGroupName("int");
    obj.radioButton37:setField("valint");
    obj.radioButton37:setFieldValue("5");
    obj.radioButton37:setName("radioButton37");

    obj.radioButton38 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton38:setParent(obj.layout16);
    obj.radioButton38.grid.role = "col";
    obj.radioButton38.grid.width = 1;
    obj.radioButton38:setGroupName("int");
    obj.radioButton38:setField("valint");
    obj.radioButton38:setFieldValue("6");
    obj.radioButton38:setName("radioButton38");

    obj.radioButton39 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton39:setParent(obj.layout16);
    obj.radioButton39.grid.role = "col";
    obj.radioButton39.grid.width = 1;
    obj.radioButton39:setGroupName("int");
    obj.radioButton39:setField("valint");
    obj.radioButton39:setFieldValue("7");
    obj.radioButton39:setName("radioButton39");

    obj.radioButton40 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton40:setParent(obj.layout16);
    obj.radioButton40.grid.role = "col";
    obj.radioButton40.grid.width = 1;
    obj.radioButton40:setGroupName("int");
    obj.radioButton40:setField("valint");
    obj.radioButton40:setFieldValue("8");
    obj.radioButton40:setName("radioButton40");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout10);
    obj.layout17.grid.role = "col";
    obj.layout17.grid.width = 12;
    obj.layout17.grid["auto-height"] = true;
    obj.layout17.grid["margin-bottom"] = 5;
    obj.layout17.grid["cnt-horz-align"] = "center";
    obj.layout17:setName("layout17");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout17);
    obj.label14.grid.role = "col";
    obj.label14.grid.width = 3;
    obj.label14:setHorzTextAlign("leading");
    obj.label14:setText("Força de Vontade");
    obj.label14:setVertTextAlign("trailing");
    obj.label14:setName("label14");
    obj.label14:setFontColor("#9e9e9e");

    obj.radioButton41 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton41:setParent(obj.layout17);
    obj.radioButton41.grid.role = "col";
    obj.radioButton41.grid.width = 1;
    obj.radioButton41:setGroupName("fdv");
    obj.radioButton41:setField("valfdv");
    obj.radioButton41:setFieldValue("1");
    obj.radioButton41:setName("radioButton41");

    obj.radioButton42 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton42:setParent(obj.layout17);
    obj.radioButton42.grid.role = "col";
    obj.radioButton42.grid.width = 1;
    obj.radioButton42:setGroupName("fdv");
    obj.radioButton42:setField("valfdv");
    obj.radioButton42:setFieldValue("2");
    obj.radioButton42:setName("radioButton42");

    obj.radioButton43 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton43:setParent(obj.layout17);
    obj.radioButton43.grid.role = "col";
    obj.radioButton43.grid.width = 1;
    obj.radioButton43:setGroupName("fdv");
    obj.radioButton43:setField("valfdv");
    obj.radioButton43:setFieldValue("3");
    obj.radioButton43:setName("radioButton43");

    obj.radioButton44 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton44:setParent(obj.layout17);
    obj.radioButton44.grid.role = "col";
    obj.radioButton44.grid.width = 1;
    obj.radioButton44:setGroupName("fdv");
    obj.radioButton44:setField("valfdv");
    obj.radioButton44:setFieldValue("4");
    obj.radioButton44:setName("radioButton44");

    obj.radioButton45 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton45:setParent(obj.layout17);
    obj.radioButton45.grid.role = "col";
    obj.radioButton45.grid.width = 1;
    obj.radioButton45:setGroupName("fdv");
    obj.radioButton45:setField("valfdv");
    obj.radioButton45:setFieldValue("5");
    obj.radioButton45:setName("radioButton45");

    obj.radioButton46 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton46:setParent(obj.layout17);
    obj.radioButton46.grid.role = "col";
    obj.radioButton46.grid.width = 1;
    obj.radioButton46:setGroupName("fdv");
    obj.radioButton46:setField("valfdv");
    obj.radioButton46:setFieldValue("6");
    obj.radioButton46:setName("radioButton46");

    obj.radioButton47 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton47:setParent(obj.layout17);
    obj.radioButton47.grid.role = "col";
    obj.radioButton47.grid.width = 1;
    obj.radioButton47:setGroupName("fdv");
    obj.radioButton47:setField("valfdv");
    obj.radioButton47:setFieldValue("7");
    obj.radioButton47:setName("radioButton47");

    obj.radioButton48 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton48:setParent(obj.layout17);
    obj.radioButton48.grid.role = "col";
    obj.radioButton48.grid.width = 1;
    obj.radioButton48:setGroupName("fdv");
    obj.radioButton48:setField("valfdv");
    obj.radioButton48:setFieldValue("8");
    obj.radioButton48:setName("radioButton48");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout10);
    obj.layout18.grid.width = 12;
    obj.layout18.grid["cnt-vert-align"] = "center";
    obj.layout18.grid["margin-bottom"] = 20;
    obj.layout18.grid["margin-top"] = 20;
    obj.layout18:setName("layout18");
    obj.layout18.grid.role = "col";
    obj.layout18.grid["auto-height"] = true;

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout18);
    obj.horzLine9.grid.role = "col";
    obj.horzLine9.grid.width = 12;
    obj.horzLine9:setName("horzLine9");
    obj.horzLine9:setStrokeColor("#999999");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout18);
    obj.label15.grid.role = "col";
    obj.label15.grid.width = 12;
    obj.label15:setFontSize(20);
    obj.label15:setText("HABILIDADES");
    obj.label15:setHorzTextAlign("center");
    obj.label15.grid["margin-top"] = 5;
    obj.label15:setName("label15");
    obj.label15:setFontColor("#9e9e9e");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout10);
    obj.layout19.grid.role = "col";
    obj.layout19.grid.width = 12;
    obj.layout19.grid["auto-height"] = true;
    obj.layout19.grid["margin-bottom"] = 5;
    obj.layout19.grid["cnt-horz-align"] = "center";
    obj.layout19:setName("layout19");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout19);
    obj.label16.grid.role = "col";
    obj.label16.grid.width = 12;
    obj.label16:setText("Esportes");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");
    obj.label16:setFontColor("#9e9e9e");

    obj.radioButton49 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton49:setParent(obj.layout19);
    obj.radioButton49.grid.role = "col";
    obj.radioButton49.grid.width = 1;
    obj.radioButton49:setGroupName("esp");
    obj.radioButton49:setField("valesp");
    obj.radioButton49:setFieldValue("1");
    obj.radioButton49:setName("radioButton49");

    obj.radioButton50 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton50:setParent(obj.layout19);
    obj.radioButton50.grid.role = "col";
    obj.radioButton50.grid.width = 1;
    obj.radioButton50:setGroupName("esp");
    obj.radioButton50:setField("valesp");
    obj.radioButton50:setFieldValue("2");
    obj.radioButton50:setName("radioButton50");

    obj.radioButton51 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton51:setParent(obj.layout19);
    obj.radioButton51.grid.role = "col";
    obj.radioButton51.grid.width = 1;
    obj.radioButton51:setGroupName("esp");
    obj.radioButton51:setField("valesp");
    obj.radioButton51:setFieldValue("3");
    obj.radioButton51:setName("radioButton51");

    obj.radioButton52 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton52:setParent(obj.layout19);
    obj.radioButton52.grid.role = "col";
    obj.radioButton52.grid.width = 1;
    obj.radioButton52:setGroupName("esp");
    obj.radioButton52:setField("valesp");
    obj.radioButton52:setFieldValue("4");
    obj.radioButton52:setName("radioButton52");

    obj.radioButton53 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton53:setParent(obj.layout19);
    obj.radioButton53.grid.role = "col";
    obj.radioButton53.grid.width = 1;
    obj.radioButton53:setGroupName("esp");
    obj.radioButton53:setField("valesp");
    obj.radioButton53:setFieldValue("5");
    obj.radioButton53:setName("radioButton53");

    obj.radioButton54 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton54:setParent(obj.layout19);
    obj.radioButton54.grid.role = "col";
    obj.radioButton54.grid.width = 1;
    obj.radioButton54:setGroupName("esp");
    obj.radioButton54:setField("valesp");
    obj.radioButton54:setFieldValue("6");
    obj.radioButton54:setName("radioButton54");

    obj.radioButton55 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton55:setParent(obj.layout19);
    obj.radioButton55.grid.role = "col";
    obj.radioButton55.grid.width = 1;
    obj.radioButton55:setGroupName("esp");
    obj.radioButton55:setField("valesp");
    obj.radioButton55:setFieldValue("7");
    obj.radioButton55:setName("radioButton55");

    obj.radioButton56 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton56:setParent(obj.layout19);
    obj.radioButton56.grid.role = "col";
    obj.radioButton56.grid.width = 1;
    obj.radioButton56:setGroupName("esp");
    obj.radioButton56:setField("valesp");
    obj.radioButton56:setFieldValue("8");
    obj.radioButton56:setName("radioButton56");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout19);
    obj.button1.grid.role = "col";
    obj.button1.grid.width = 2;
    obj.button1:setText("🎲");
    obj.button1:setName("button1");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout10);
    obj.layout20.grid.role = "col";
    obj.layout20.grid.width = 12;
    obj.layout20.grid["auto-height"] = true;
    obj.layout20.grid["margin-bottom"] = 5;
    obj.layout20.grid["cnt-horz-align"] = "center";
    obj.layout20:setName("layout20");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout20);
    obj.label17.grid.role = "col";
    obj.label17.grid.width = 12;
    obj.label17:setText("Combate Desarmado");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");
    obj.label17:setFontColor("#9e9e9e");

    obj.radioButton57 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton57:setParent(obj.layout20);
    obj.radioButton57.grid.role = "col";
    obj.radioButton57.grid.width = 1;
    obj.radioButton57:setGroupName("combDes");
    obj.radioButton57:setField("valcombDes");
    obj.radioButton57:setFieldValue("1");
    obj.radioButton57:setName("radioButton57");

    obj.radioButton58 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton58:setParent(obj.layout20);
    obj.radioButton58.grid.role = "col";
    obj.radioButton58.grid.width = 1;
    obj.radioButton58:setGroupName("combDes");
    obj.radioButton58:setField("valcombDes");
    obj.radioButton58:setFieldValue("2");
    obj.radioButton58:setName("radioButton58");

    obj.radioButton59 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton59:setParent(obj.layout20);
    obj.radioButton59.grid.role = "col";
    obj.radioButton59.grid.width = 1;
    obj.radioButton59:setGroupName("combDes");
    obj.radioButton59:setField("valcombDes");
    obj.radioButton59:setFieldValue("3");
    obj.radioButton59:setName("radioButton59");

    obj.radioButton60 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton60:setParent(obj.layout20);
    obj.radioButton60.grid.role = "col";
    obj.radioButton60.grid.width = 1;
    obj.radioButton60:setGroupName("combDes");
    obj.radioButton60:setField("valcombDes");
    obj.radioButton60:setFieldValue("4");
    obj.radioButton60:setName("radioButton60");

    obj.radioButton61 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton61:setParent(obj.layout20);
    obj.radioButton61.grid.role = "col";
    obj.radioButton61.grid.width = 1;
    obj.radioButton61:setGroupName("combDes");
    obj.radioButton61:setField("valcombDes");
    obj.radioButton61:setFieldValue("5");
    obj.radioButton61:setName("radioButton61");

    obj.radioButton62 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton62:setParent(obj.layout20);
    obj.radioButton62.grid.role = "col";
    obj.radioButton62.grid.width = 1;
    obj.radioButton62:setGroupName("combDes");
    obj.radioButton62:setField("valcombDes");
    obj.radioButton62:setFieldValue("6");
    obj.radioButton62:setName("radioButton62");

    obj.radioButton63 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton63:setParent(obj.layout20);
    obj.radioButton63.grid.role = "col";
    obj.radioButton63.grid.width = 1;
    obj.radioButton63:setGroupName("combDes");
    obj.radioButton63:setField("valcombDes");
    obj.radioButton63:setFieldValue("7");
    obj.radioButton63:setName("radioButton63");

    obj.radioButton64 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton64:setParent(obj.layout20);
    obj.radioButton64.grid.role = "col";
    obj.radioButton64.grid.width = 1;
    obj.radioButton64:setGroupName("combDes");
    obj.radioButton64:setField("valcombDes");
    obj.radioButton64:setFieldValue("8");
    obj.radioButton64:setName("radioButton64");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout20);
    obj.button2.grid.role = "col";
    obj.button2.grid.width = 2;
    obj.button2:setText("🎲");
    obj.button2:setName("button2");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout10);
    obj.layout21.grid.role = "col";
    obj.layout21.grid.width = 12;
    obj.layout21.grid["auto-height"] = true;
    obj.layout21.grid["margin-bottom"] = 5;
    obj.layout21.grid["cnt-horz-align"] = "center";
    obj.layout21:setName("layout21");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout21);
    obj.label18.grid.role = "col";
    obj.label18.grid.width = 12;
    obj.label18:setText("Armas Brancas");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");
    obj.label18:setFontColor("#9e9e9e");

    obj.radioButton65 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton65:setParent(obj.layout21);
    obj.radioButton65.grid.role = "col";
    obj.radioButton65.grid.width = 1;
    obj.radioButton65:setGroupName("armBra");
    obj.radioButton65:setField("valarmBra");
    obj.radioButton65:setFieldValue("1");
    obj.radioButton65:setName("radioButton65");

    obj.radioButton66 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton66:setParent(obj.layout21);
    obj.radioButton66.grid.role = "col";
    obj.radioButton66.grid.width = 1;
    obj.radioButton66:setGroupName("armBra");
    obj.radioButton66:setField("valarmBra");
    obj.radioButton66:setFieldValue("2");
    obj.radioButton66:setName("radioButton66");

    obj.radioButton67 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton67:setParent(obj.layout21);
    obj.radioButton67.grid.role = "col";
    obj.radioButton67.grid.width = 1;
    obj.radioButton67:setGroupName("armBra");
    obj.radioButton67:setField("valarmBra");
    obj.radioButton67:setFieldValue("3");
    obj.radioButton67:setName("radioButton67");

    obj.radioButton68 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton68:setParent(obj.layout21);
    obj.radioButton68.grid.role = "col";
    obj.radioButton68.grid.width = 1;
    obj.radioButton68:setGroupName("armBra");
    obj.radioButton68:setField("valarmBra");
    obj.radioButton68:setFieldValue("4");
    obj.radioButton68:setName("radioButton68");

    obj.radioButton69 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton69:setParent(obj.layout21);
    obj.radioButton69.grid.role = "col";
    obj.radioButton69.grid.width = 1;
    obj.radioButton69:setGroupName("armBra");
    obj.radioButton69:setField("valarmBra");
    obj.radioButton69:setFieldValue("5");
    obj.radioButton69:setName("radioButton69");

    obj.radioButton70 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton70:setParent(obj.layout21);
    obj.radioButton70.grid.role = "col";
    obj.radioButton70.grid.width = 1;
    obj.radioButton70:setGroupName("armBra");
    obj.radioButton70:setField("valarmBra");
    obj.radioButton70:setFieldValue("6");
    obj.radioButton70:setName("radioButton70");

    obj.radioButton71 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton71:setParent(obj.layout21);
    obj.radioButton71.grid.role = "col";
    obj.radioButton71.grid.width = 1;
    obj.radioButton71:setGroupName("armBra");
    obj.radioButton71:setField("valarmBra");
    obj.radioButton71:setFieldValue("7");
    obj.radioButton71:setName("radioButton71");

    obj.radioButton72 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton72:setParent(obj.layout21);
    obj.radioButton72.grid.role = "col";
    obj.radioButton72.grid.width = 1;
    obj.radioButton72:setGroupName("armBra");
    obj.radioButton72:setField("valarmBra");
    obj.radioButton72:setFieldValue("8");
    obj.radioButton72:setName("radioButton72");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout21);
    obj.button3.grid.role = "col";
    obj.button3.grid.width = 2;
    obj.button3:setText("🎲");
    obj.button3:setName("button3");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout10);
    obj.layout22.grid.role = "col";
    obj.layout22.grid.width = 12;
    obj.layout22.grid["auto-height"] = true;
    obj.layout22.grid["margin-bottom"] = 5;
    obj.layout22.grid["cnt-horz-align"] = "center";
    obj.layout22:setName("layout22");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout22);
    obj.label19.grid.role = "col";
    obj.label19.grid.width = 12;
    obj.label19:setText("Armas de Fogo");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");
    obj.label19:setFontColor("#9e9e9e");

    obj.radioButton73 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton73:setParent(obj.layout22);
    obj.radioButton73.grid.role = "col";
    obj.radioButton73.grid.width = 1;
    obj.radioButton73:setGroupName("armFog");
    obj.radioButton73:setField("valarmFog");
    obj.radioButton73:setFieldValue("1");
    obj.radioButton73:setName("radioButton73");

    obj.radioButton74 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton74:setParent(obj.layout22);
    obj.radioButton74.grid.role = "col";
    obj.radioButton74.grid.width = 1;
    obj.radioButton74:setGroupName("armFog");
    obj.radioButton74:setField("valarmFog");
    obj.radioButton74:setFieldValue("2");
    obj.radioButton74:setName("radioButton74");

    obj.radioButton75 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton75:setParent(obj.layout22);
    obj.radioButton75.grid.role = "col";
    obj.radioButton75.grid.width = 1;
    obj.radioButton75:setGroupName("armFog");
    obj.radioButton75:setField("valarmFog");
    obj.radioButton75:setFieldValue("3");
    obj.radioButton75:setName("radioButton75");

    obj.radioButton76 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton76:setParent(obj.layout22);
    obj.radioButton76.grid.role = "col";
    obj.radioButton76.grid.width = 1;
    obj.radioButton76:setGroupName("armFog");
    obj.radioButton76:setField("valarmFog");
    obj.radioButton76:setFieldValue("4");
    obj.radioButton76:setName("radioButton76");

    obj.radioButton77 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton77:setParent(obj.layout22);
    obj.radioButton77.grid.role = "col";
    obj.radioButton77.grid.width = 1;
    obj.radioButton77:setGroupName("armFog");
    obj.radioButton77:setField("valarmFog");
    obj.radioButton77:setFieldValue("5");
    obj.radioButton77:setName("radioButton77");

    obj.radioButton78 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton78:setParent(obj.layout22);
    obj.radioButton78.grid.role = "col";
    obj.radioButton78.grid.width = 1;
    obj.radioButton78:setGroupName("armFog");
    obj.radioButton78:setField("valarmFog");
    obj.radioButton78:setFieldValue("6");
    obj.radioButton78:setName("radioButton78");

    obj.radioButton79 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton79:setParent(obj.layout22);
    obj.radioButton79.grid.role = "col";
    obj.radioButton79.grid.width = 1;
    obj.radioButton79:setGroupName("armFog");
    obj.radioButton79:setField("valarmFog");
    obj.radioButton79:setFieldValue("7");
    obj.radioButton79:setName("radioButton79");

    obj.radioButton80 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton80:setParent(obj.layout22);
    obj.radioButton80.grid.role = "col";
    obj.radioButton80.grid.width = 1;
    obj.radioButton80:setGroupName("armFog");
    obj.radioButton80:setField("valarmFog");
    obj.radioButton80:setFieldValue("8");
    obj.radioButton80:setName("radioButton80");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout22);
    obj.button4.grid.role = "col";
    obj.button4.grid.width = 2;
    obj.button4:setText("🎲");
    obj.button4:setName("button4");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout10);
    obj.layout23.grid.role = "col";
    obj.layout23.grid.width = 12;
    obj.layout23.grid["auto-height"] = true;
    obj.layout23.grid["margin-bottom"] = 5;
    obj.layout23.grid["cnt-horz-align"] = "center";
    obj.layout23:setName("layout23");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout23);
    obj.label20.grid.role = "col";
    obj.label20.grid.width = 12;
    obj.label20:setText("Ciências");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");
    obj.label20:setFontColor("#9e9e9e");

    obj.radioButton81 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton81:setParent(obj.layout23);
    obj.radioButton81.grid.role = "col";
    obj.radioButton81.grid.width = 1;
    obj.radioButton81:setGroupName("cie");
    obj.radioButton81:setField("valcie");
    obj.radioButton81:setFieldValue("1");
    obj.radioButton81:setName("radioButton81");

    obj.radioButton82 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton82:setParent(obj.layout23);
    obj.radioButton82.grid.role = "col";
    obj.radioButton82.grid.width = 1;
    obj.radioButton82:setGroupName("cie");
    obj.radioButton82:setField("valcie");
    obj.radioButton82:setFieldValue("2");
    obj.radioButton82:setName("radioButton82");

    obj.radioButton83 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton83:setParent(obj.layout23);
    obj.radioButton83.grid.role = "col";
    obj.radioButton83.grid.width = 1;
    obj.radioButton83:setGroupName("cie");
    obj.radioButton83:setField("valcie");
    obj.radioButton83:setFieldValue("3");
    obj.radioButton83:setName("radioButton83");

    obj.radioButton84 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton84:setParent(obj.layout23);
    obj.radioButton84.grid.role = "col";
    obj.radioButton84.grid.width = 1;
    obj.radioButton84:setGroupName("cie");
    obj.radioButton84:setField("valcie");
    obj.radioButton84:setFieldValue("4");
    obj.radioButton84:setName("radioButton84");

    obj.radioButton85 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton85:setParent(obj.layout23);
    obj.radioButton85.grid.role = "col";
    obj.radioButton85.grid.width = 1;
    obj.radioButton85:setGroupName("cie");
    obj.radioButton85:setField("valcie");
    obj.radioButton85:setFieldValue("5");
    obj.radioButton85:setName("radioButton85");

    obj.radioButton86 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton86:setParent(obj.layout23);
    obj.radioButton86.grid.role = "col";
    obj.radioButton86.grid.width = 1;
    obj.radioButton86:setGroupName("cie");
    obj.radioButton86:setField("valcie");
    obj.radioButton86:setFieldValue("6");
    obj.radioButton86:setName("radioButton86");

    obj.radioButton87 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton87:setParent(obj.layout23);
    obj.radioButton87.grid.role = "col";
    obj.radioButton87.grid.width = 1;
    obj.radioButton87:setGroupName("cie");
    obj.radioButton87:setField("valcie");
    obj.radioButton87:setFieldValue("7");
    obj.radioButton87:setName("radioButton87");

    obj.radioButton88 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton88:setParent(obj.layout23);
    obj.radioButton88.grid.role = "col";
    obj.radioButton88.grid.width = 1;
    obj.radioButton88:setGroupName("cie");
    obj.radioButton88:setField("valcie");
    obj.radioButton88:setFieldValue("8");
    obj.radioButton88:setName("radioButton88");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout23);
    obj.button5.grid.role = "col";
    obj.button5.grid.width = 2;
    obj.button5:setText("🎲");
    obj.button5:setName("button5");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout10);
    obj.layout24.grid.role = "col";
    obj.layout24.grid.width = 12;
    obj.layout24.grid["auto-height"] = true;
    obj.layout24.grid["margin-bottom"] = 5;
    obj.layout24.grid["cnt-horz-align"] = "center";
    obj.layout24:setName("layout24");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout24);
    obj.label21.grid.role = "col";
    obj.label21.grid.width = 12;
    obj.label21:setText("Crime");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");
    obj.label21:setFontColor("#9e9e9e");

    obj.radioButton89 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton89:setParent(obj.layout24);
    obj.radioButton89.grid.role = "col";
    obj.radioButton89.grid.width = 1;
    obj.radioButton89:setGroupName("cri");
    obj.radioButton89:setField("valcri");
    obj.radioButton89:setFieldValue("1");
    obj.radioButton89:setName("radioButton89");

    obj.radioButton90 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton90:setParent(obj.layout24);
    obj.radioButton90.grid.role = "col";
    obj.radioButton90.grid.width = 1;
    obj.radioButton90:setGroupName("cri");
    obj.radioButton90:setField("valcri");
    obj.radioButton90:setFieldValue("2");
    obj.radioButton90:setName("radioButton90");

    obj.radioButton91 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton91:setParent(obj.layout24);
    obj.radioButton91.grid.role = "col";
    obj.radioButton91.grid.width = 1;
    obj.radioButton91:setGroupName("cri");
    obj.radioButton91:setField("valcri");
    obj.radioButton91:setFieldValue("3");
    obj.radioButton91:setName("radioButton91");

    obj.radioButton92 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton92:setParent(obj.layout24);
    obj.radioButton92.grid.role = "col";
    obj.radioButton92.grid.width = 1;
    obj.radioButton92:setGroupName("cri");
    obj.radioButton92:setField("valcri");
    obj.radioButton92:setFieldValue("4");
    obj.radioButton92:setName("radioButton92");

    obj.radioButton93 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton93:setParent(obj.layout24);
    obj.radioButton93.grid.role = "col";
    obj.radioButton93.grid.width = 1;
    obj.radioButton93:setGroupName("cri");
    obj.radioButton93:setField("valcri");
    obj.radioButton93:setFieldValue("5");
    obj.radioButton93:setName("radioButton93");

    obj.radioButton94 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton94:setParent(obj.layout24);
    obj.radioButton94.grid.role = "col";
    obj.radioButton94.grid.width = 1;
    obj.radioButton94:setGroupName("cri");
    obj.radioButton94:setField("valcri");
    obj.radioButton94:setFieldValue("6");
    obj.radioButton94:setName("radioButton94");

    obj.radioButton95 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton95:setParent(obj.layout24);
    obj.radioButton95.grid.role = "col";
    obj.radioButton95.grid.width = 1;
    obj.radioButton95:setGroupName("cri");
    obj.radioButton95:setField("valcri");
    obj.radioButton95:setFieldValue("7");
    obj.radioButton95:setName("radioButton95");

    obj.radioButton96 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton96:setParent(obj.layout24);
    obj.radioButton96.grid.role = "col";
    obj.radioButton96.grid.width = 1;
    obj.radioButton96:setGroupName("cri");
    obj.radioButton96:setField("valcri");
    obj.radioButton96:setFieldValue("8");
    obj.radioButton96:setName("radioButton96");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout24);
    obj.button6.grid.role = "col";
    obj.button6.grid.width = 2;
    obj.button6:setText("🎲");
    obj.button6:setName("button6");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout10);
    obj.layout25.grid.role = "col";
    obj.layout25.grid.width = 12;
    obj.layout25.grid["auto-height"] = true;
    obj.layout25.grid["margin-bottom"] = 5;
    obj.layout25.grid["cnt-horz-align"] = "center";
    obj.layout25:setName("layout25");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout25);
    obj.label22.grid.role = "col";
    obj.label22.grid.width = 12;
    obj.label22:setText("Investigação");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");
    obj.label22:setFontColor("#9e9e9e");

    obj.radioButton97 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton97:setParent(obj.layout25);
    obj.radioButton97.grid.role = "col";
    obj.radioButton97.grid.width = 1;
    obj.radioButton97:setGroupName("inv");
    obj.radioButton97:setField("valinv");
    obj.radioButton97:setFieldValue("1");
    obj.radioButton97:setName("radioButton97");

    obj.radioButton98 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton98:setParent(obj.layout25);
    obj.radioButton98.grid.role = "col";
    obj.radioButton98.grid.width = 1;
    obj.radioButton98:setGroupName("inv");
    obj.radioButton98:setField("valinv");
    obj.radioButton98:setFieldValue("2");
    obj.radioButton98:setName("radioButton98");

    obj.radioButton99 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton99:setParent(obj.layout25);
    obj.radioButton99.grid.role = "col";
    obj.radioButton99.grid.width = 1;
    obj.radioButton99:setGroupName("inv");
    obj.radioButton99:setField("valinv");
    obj.radioButton99:setFieldValue("3");
    obj.radioButton99:setName("radioButton99");

    obj.radioButton100 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton100:setParent(obj.layout25);
    obj.radioButton100.grid.role = "col";
    obj.radioButton100.grid.width = 1;
    obj.radioButton100:setGroupName("inv");
    obj.radioButton100:setField("valinv");
    obj.radioButton100:setFieldValue("4");
    obj.radioButton100:setName("radioButton100");

    obj.radioButton101 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton101:setParent(obj.layout25);
    obj.radioButton101.grid.role = "col";
    obj.radioButton101.grid.width = 1;
    obj.radioButton101:setGroupName("inv");
    obj.radioButton101:setField("valinv");
    obj.radioButton101:setFieldValue("5");
    obj.radioButton101:setName("radioButton101");

    obj.radioButton102 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton102:setParent(obj.layout25);
    obj.radioButton102.grid.role = "col";
    obj.radioButton102.grid.width = 1;
    obj.radioButton102:setGroupName("inv");
    obj.radioButton102:setField("valinv");
    obj.radioButton102:setFieldValue("6");
    obj.radioButton102:setName("radioButton102");

    obj.radioButton103 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton103:setParent(obj.layout25);
    obj.radioButton103.grid.role = "col";
    obj.radioButton103.grid.width = 1;
    obj.radioButton103:setGroupName("inv");
    obj.radioButton103:setField("valinv");
    obj.radioButton103:setFieldValue("7");
    obj.radioButton103:setName("radioButton103");

    obj.radioButton104 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton104:setParent(obj.layout25);
    obj.radioButton104.grid.role = "col";
    obj.radioButton104.grid.width = 1;
    obj.radioButton104:setGroupName("inv");
    obj.radioButton104:setField("valinv");
    obj.radioButton104:setFieldValue("8");
    obj.radioButton104:setName("radioButton104");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout25);
    obj.button7.grid.role = "col";
    obj.button7.grid.width = 2;
    obj.button7:setText("🎲");
    obj.button7:setName("button7");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout10);
    obj.layout26.grid.role = "col";
    obj.layout26.grid.width = 12;
    obj.layout26.grid["auto-height"] = true;
    obj.layout26.grid["margin-bottom"] = 5;
    obj.layout26.grid["cnt-horz-align"] = "center";
    obj.layout26:setName("layout26");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout26);
    obj.label23.grid.role = "col";
    obj.label23.grid.width = 12;
    obj.label23:setText("Maquinário");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");
    obj.label23:setFontColor("#9e9e9e");

    obj.radioButton105 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton105:setParent(obj.layout26);
    obj.radioButton105.grid.role = "col";
    obj.radioButton105.grid.width = 1;
    obj.radioButton105:setGroupName("maq");
    obj.radioButton105:setField("valmaq");
    obj.radioButton105:setFieldValue("1");
    obj.radioButton105:setName("radioButton105");

    obj.radioButton106 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton106:setParent(obj.layout26);
    obj.radioButton106.grid.role = "col";
    obj.radioButton106.grid.width = 1;
    obj.radioButton106:setGroupName("maq");
    obj.radioButton106:setField("valmaq");
    obj.radioButton106:setFieldValue("2");
    obj.radioButton106:setName("radioButton106");

    obj.radioButton107 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton107:setParent(obj.layout26);
    obj.radioButton107.grid.role = "col";
    obj.radioButton107.grid.width = 1;
    obj.radioButton107:setGroupName("maq");
    obj.radioButton107:setField("valmaq");
    obj.radioButton107:setFieldValue("3");
    obj.radioButton107:setName("radioButton107");

    obj.radioButton108 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton108:setParent(obj.layout26);
    obj.radioButton108.grid.role = "col";
    obj.radioButton108.grid.width = 1;
    obj.radioButton108:setGroupName("maq");
    obj.radioButton108:setField("valmaq");
    obj.radioButton108:setFieldValue("4");
    obj.radioButton108:setName("radioButton108");

    obj.radioButton109 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton109:setParent(obj.layout26);
    obj.radioButton109.grid.role = "col";
    obj.radioButton109.grid.width = 1;
    obj.radioButton109:setGroupName("maq");
    obj.radioButton109:setField("valmaq");
    obj.radioButton109:setFieldValue("5");
    obj.radioButton109:setName("radioButton109");

    obj.radioButton110 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton110:setParent(obj.layout26);
    obj.radioButton110.grid.role = "col";
    obj.radioButton110.grid.width = 1;
    obj.radioButton110:setGroupName("maq");
    obj.radioButton110:setField("valmaq");
    obj.radioButton110:setFieldValue("6");
    obj.radioButton110:setName("radioButton110");

    obj.radioButton111 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton111:setParent(obj.layout26);
    obj.radioButton111.grid.role = "col";
    obj.radioButton111.grid.width = 1;
    obj.radioButton111:setGroupName("maq");
    obj.radioButton111:setField("valmaq");
    obj.radioButton111:setFieldValue("7");
    obj.radioButton111:setName("radioButton111");

    obj.radioButton112 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton112:setParent(obj.layout26);
    obj.radioButton112.grid.role = "col";
    obj.radioButton112.grid.width = 1;
    obj.radioButton112:setGroupName("maq");
    obj.radioButton112:setField("valmaq");
    obj.radioButton112:setFieldValue("8");
    obj.radioButton112:setName("radioButton112");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout26);
    obj.button8.grid.role = "col";
    obj.button8.grid.width = 2;
    obj.button8:setText("🎲");
    obj.button8:setName("button8");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout10);
    obj.layout27.grid.role = "col";
    obj.layout27.grid.width = 12;
    obj.layout27.grid["auto-height"] = true;
    obj.layout27.grid["margin-bottom"] = 5;
    obj.layout27.grid["cnt-horz-align"] = "center";
    obj.layout27:setName("layout27");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout27);
    obj.label24.grid.role = "col";
    obj.label24.grid.width = 12;
    obj.label24:setText("Manipulação");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");
    obj.label24:setFontColor("#9e9e9e");

    obj.radioButton113 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton113:setParent(obj.layout27);
    obj.radioButton113.grid.role = "col";
    obj.radioButton113.grid.width = 1;
    obj.radioButton113:setGroupName("man");
    obj.radioButton113:setField("valman");
    obj.radioButton113:setFieldValue("1");
    obj.radioButton113:setName("radioButton113");

    obj.radioButton114 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton114:setParent(obj.layout27);
    obj.radioButton114.grid.role = "col";
    obj.radioButton114.grid.width = 1;
    obj.radioButton114:setGroupName("man");
    obj.radioButton114:setField("valman");
    obj.radioButton114:setFieldValue("2");
    obj.radioButton114:setName("radioButton114");

    obj.radioButton115 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton115:setParent(obj.layout27);
    obj.radioButton115.grid.role = "col";
    obj.radioButton115.grid.width = 1;
    obj.radioButton115:setGroupName("man");
    obj.radioButton115:setField("valman");
    obj.radioButton115:setFieldValue("3");
    obj.radioButton115:setName("radioButton115");

    obj.radioButton116 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton116:setParent(obj.layout27);
    obj.radioButton116.grid.role = "col";
    obj.radioButton116.grid.width = 1;
    obj.radioButton116:setGroupName("man");
    obj.radioButton116:setField("valman");
    obj.radioButton116:setFieldValue("4");
    obj.radioButton116:setName("radioButton116");

    obj.radioButton117 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton117:setParent(obj.layout27);
    obj.radioButton117.grid.role = "col";
    obj.radioButton117.grid.width = 1;
    obj.radioButton117:setGroupName("man");
    obj.radioButton117:setField("valman");
    obj.radioButton117:setFieldValue("5");
    obj.radioButton117:setName("radioButton117");

    obj.radioButton118 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton118:setParent(obj.layout27);
    obj.radioButton118.grid.role = "col";
    obj.radioButton118.grid.width = 1;
    obj.radioButton118:setGroupName("man");
    obj.radioButton118:setField("valman");
    obj.radioButton118:setFieldValue("6");
    obj.radioButton118:setName("radioButton118");

    obj.radioButton119 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton119:setParent(obj.layout27);
    obj.radioButton119.grid.role = "col";
    obj.radioButton119.grid.width = 1;
    obj.radioButton119:setGroupName("man");
    obj.radioButton119:setField("valman");
    obj.radioButton119:setFieldValue("7");
    obj.radioButton119:setName("radioButton119");

    obj.radioButton120 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton120:setParent(obj.layout27);
    obj.radioButton120.grid.role = "col";
    obj.radioButton120.grid.width = 1;
    obj.radioButton120:setGroupName("man");
    obj.radioButton120:setField("valman");
    obj.radioButton120:setFieldValue("8");
    obj.radioButton120:setName("radioButton120");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout27);
    obj.button9.grid.role = "col";
    obj.button9.grid.width = 2;
    obj.button9:setText("🎲");
    obj.button9:setName("button9");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout10);
    obj.layout28.grid.role = "col";
    obj.layout28.grid.width = 12;
    obj.layout28.grid["auto-height"] = true;
    obj.layout28.grid["margin-bottom"] = 5;
    obj.layout28.grid["cnt-horz-align"] = "center";
    obj.layout28:setName("layout28");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout28);
    obj.label25.grid.role = "col";
    obj.label25.grid.width = 12;
    obj.label25:setText("Medicina");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");
    obj.label25:setFontColor("#9e9e9e");

    obj.radioButton121 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton121:setParent(obj.layout28);
    obj.radioButton121.grid.role = "col";
    obj.radioButton121.grid.width = 1;
    obj.radioButton121:setGroupName("med");
    obj.radioButton121:setField("valmed");
    obj.radioButton121:setFieldValue("1");
    obj.radioButton121:setName("radioButton121");

    obj.radioButton122 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton122:setParent(obj.layout28);
    obj.radioButton122.grid.role = "col";
    obj.radioButton122.grid.width = 1;
    obj.radioButton122:setGroupName("med");
    obj.radioButton122:setField("valmed");
    obj.radioButton122:setFieldValue("2");
    obj.radioButton122:setName("radioButton122");

    obj.radioButton123 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton123:setParent(obj.layout28);
    obj.radioButton123.grid.role = "col";
    obj.radioButton123.grid.width = 1;
    obj.radioButton123:setGroupName("med");
    obj.radioButton123:setField("valmed");
    obj.radioButton123:setFieldValue("3");
    obj.radioButton123:setName("radioButton123");

    obj.radioButton124 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton124:setParent(obj.layout28);
    obj.radioButton124.grid.role = "col";
    obj.radioButton124.grid.width = 1;
    obj.radioButton124:setGroupName("med");
    obj.radioButton124:setField("valmed");
    obj.radioButton124:setFieldValue("4");
    obj.radioButton124:setName("radioButton124");

    obj.radioButton125 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton125:setParent(obj.layout28);
    obj.radioButton125.grid.role = "col";
    obj.radioButton125.grid.width = 1;
    obj.radioButton125:setGroupName("med");
    obj.radioButton125:setField("valmed");
    obj.radioButton125:setFieldValue("5");
    obj.radioButton125:setName("radioButton125");

    obj.radioButton126 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton126:setParent(obj.layout28);
    obj.radioButton126.grid.role = "col";
    obj.radioButton126.grid.width = 1;
    obj.radioButton126:setGroupName("med");
    obj.radioButton126:setField("valmed");
    obj.radioButton126:setFieldValue("6");
    obj.radioButton126:setName("radioButton126");

    obj.radioButton127 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton127:setParent(obj.layout28);
    obj.radioButton127.grid.role = "col";
    obj.radioButton127.grid.width = 1;
    obj.radioButton127:setGroupName("med");
    obj.radioButton127:setField("valmed");
    obj.radioButton127:setFieldValue("7");
    obj.radioButton127:setName("radioButton127");

    obj.radioButton128 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton128:setParent(obj.layout28);
    obj.radioButton128.grid.role = "col";
    obj.radioButton128.grid.width = 1;
    obj.radioButton128:setGroupName("med");
    obj.radioButton128:setField("valmed");
    obj.radioButton128:setFieldValue("8");
    obj.radioButton128:setName("radioButton128");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout28);
    obj.button10.grid.role = "col";
    obj.button10.grid.width = 2;
    obj.button10:setText("🎲");
    obj.button10:setName("button10");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout10);
    obj.layout29.grid.role = "col";
    obj.layout29.grid.width = 12;
    obj.layout29.grid["auto-height"] = true;
    obj.layout29.grid["margin-bottom"] = 5;
    obj.layout29.grid["cnt-horz-align"] = "center";
    obj.layout29:setName("layout29");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout29);
    obj.label26.grid.role = "col";
    obj.label26.grid.width = 12;
    obj.label26:setText("Sobrevivência");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");
    obj.label26:setFontColor("#9e9e9e");

    obj.radioButton129 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton129:setParent(obj.layout29);
    obj.radioButton129.grid.role = "col";
    obj.radioButton129.grid.width = 1;
    obj.radioButton129:setGroupName("sob");
    obj.radioButton129:setField("valsob");
    obj.radioButton129:setFieldValue("1");
    obj.radioButton129:setName("radioButton129");

    obj.radioButton130 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton130:setParent(obj.layout29);
    obj.radioButton130.grid.role = "col";
    obj.radioButton130.grid.width = 1;
    obj.radioButton130:setGroupName("sob");
    obj.radioButton130:setField("valsob");
    obj.radioButton130:setFieldValue("2");
    obj.radioButton130:setName("radioButton130");

    obj.radioButton131 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton131:setParent(obj.layout29);
    obj.radioButton131.grid.role = "col";
    obj.radioButton131.grid.width = 1;
    obj.radioButton131:setGroupName("sob");
    obj.radioButton131:setField("valsob");
    obj.radioButton131:setFieldValue("3");
    obj.radioButton131:setName("radioButton131");

    obj.radioButton132 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton132:setParent(obj.layout29);
    obj.radioButton132.grid.role = "col";
    obj.radioButton132.grid.width = 1;
    obj.radioButton132:setGroupName("sob");
    obj.radioButton132:setField("valsob");
    obj.radioButton132:setFieldValue("4");
    obj.radioButton132:setName("radioButton132");

    obj.radioButton133 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton133:setParent(obj.layout29);
    obj.radioButton133.grid.role = "col";
    obj.radioButton133.grid.width = 1;
    obj.radioButton133:setGroupName("sob");
    obj.radioButton133:setField("valsob");
    obj.radioButton133:setFieldValue("5");
    obj.radioButton133:setName("radioButton133");

    obj.radioButton134 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton134:setParent(obj.layout29);
    obj.radioButton134.grid.role = "col";
    obj.radioButton134.grid.width = 1;
    obj.radioButton134:setGroupName("sob");
    obj.radioButton134:setField("valsob");
    obj.radioButton134:setFieldValue("6");
    obj.radioButton134:setName("radioButton134");

    obj.radioButton135 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton135:setParent(obj.layout29);
    obj.radioButton135.grid.role = "col";
    obj.radioButton135.grid.width = 1;
    obj.radioButton135:setGroupName("sob");
    obj.radioButton135:setField("valsob");
    obj.radioButton135:setFieldValue("7");
    obj.radioButton135:setName("radioButton135");

    obj.radioButton136 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton136:setParent(obj.layout29);
    obj.radioButton136.grid.role = "col";
    obj.radioButton136.grid.width = 1;
    obj.radioButton136:setGroupName("sob");
    obj.radioButton136:setField("valsob");
    obj.radioButton136:setFieldValue("8");
    obj.radioButton136:setName("radioButton136");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout29);
    obj.button11.grid.role = "col";
    obj.button11.grid.width = 2;
    obj.button11:setText("🎲");
    obj.button11:setName("button11");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout1);
    obj.layout30.grid.width = 4;
    obj.layout30.grid["min-height"] = 200;
    obj.layout30.grid["margin-right"] = 20;
    obj.layout30.grid["margin-left"] = 20;
    obj.layout30.grid["margin-bottom"] = 5;
    obj.layout30:setName("layout30");
    obj.layout30.grid.role = "col";
    obj.layout30.grid["auto-height"] = true;

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31.grid.width = 12;
    obj.layout31.grid["margin-bottom"] = 5;
    obj.layout31.grid["cnt-horz-align"] = "center";
    obj.layout31:setName("layout31");
    obj.layout31.grid.role = "col";
    obj.layout31.grid["auto-height"] = true;

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout31);
    obj.rectangle1.grid.role = "col";
    obj.rectangle1.grid.width = 12;
    obj.rectangle1.grid["auto-height"] = true;
    obj.rectangle1.grid["min-height"] = 300;
    obj.rectangle1.grid["max-width"] = 250;
    obj.rectangle1:setName("rectangle1");
    lfm_setPropAsString(obj.rectangle1, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setStrokeColor("#999999");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setColor("#343434");
    obj.rectangle1.grid["padding-top"] = 20;
    obj.rectangle1.grid["padding-left"] = 20;
    obj.rectangle1.grid["padding-right"] = 20;
    obj.rectangle1.grid["padding-bottom"] = 20;

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setEditable(true);
    obj.image2.grid.role = "col";
    obj.image2.grid.width = 12;
    obj.image2:setStyle("autoFit");
    obj.image2:setField("imgPers");
    obj.image2.grid["vert-tile"] = true;
    obj.image2:setName("image2");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout30);
    obj.layout32.grid.width = 12;
    obj.layout32.grid["cnt-vert-align"] = "center";
    obj.layout32.grid["margin-bottom"] = 20;
    obj.layout32.grid["margin-top"] = 20;
    obj.layout32:setName("layout32");
    obj.layout32.grid.role = "col";
    obj.layout32.grid["auto-height"] = true;

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.layout32);
    obj.horzLine10.grid.role = "col";
    obj.horzLine10.grid.width = 12;
    obj.horzLine10:setName("horzLine10");
    obj.horzLine10:setStrokeColor("#999999");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout32);
    obj.label27.grid.role = "col";
    obj.label27.grid.width = 12;
    obj.label27:setFontSize(20);
    obj.label27:setText("VANTAGENS E DESVANTAGENS");
    obj.label27:setHorzTextAlign("center");
    obj.label27.grid["margin-top"] = 5;
    obj.label27:setName("label27");
    obj.label27:setFontColor("#9e9e9e");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout30);
    obj.layout33.grid.width = 12;
    obj.layout33.grid.gutter = 10;
    obj.layout33:setName("layout33");
    obj.layout33.grid.role = "col";
    obj.layout33.grid["auto-height"] = true;

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout33);
    obj.label28.grid.role = "col";
    obj.label28.grid.width = 8;
    obj.label28:setHorzTextAlign("leading");
    obj.label28:setText("Nome");
    obj.label28:setName("label28");
    obj.label28:setFontColor("#9e9e9e");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout33);
    obj.label29.grid.role = "col";
    obj.label29.grid.width = 2;
    obj.label29:setHorzTextAlign("center");
    obj.label29:setText("Pts.");
    obj.label29:setName("label29");
    obj.label29:setFontColor("#9e9e9e");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout33);
    obj.button12.grid.role = "col";
    obj.button12.grid.width = 2;
    obj.button12:setText("➕");
    obj.button12:setName("button12");

    obj.rclVantDesv = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclVantDesv:setParent(obj.layout33);
    obj.rclVantDesv:setName("rclVantDesv");
    obj.rclVantDesv:setField("vantDesv");
    obj.rclVantDesv:setTemplateForm("frmVantDesv");
    obj.rclVantDesv.grid.role = "col";
    obj.rclVantDesv.grid.width = 12;
    obj.rclVantDesv.grid["min-height"] = 300;
    obj.rclVantDesv.grid["margin-top"] = 10;

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout1);
    obj.layout34.grid.width = 3;
    obj.layout34.grid["min-height"] = 200;
    obj.layout34.grid["margin-right"] = 20;
    obj.layout34.grid["margin-left"] = 20;
    obj.layout34.grid["margin-bottom"] = 5;
    obj.layout34:setName("layout34");
    obj.layout34.grid.role = "col";
    obj.layout34.grid["auto-height"] = true;

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout34);
    obj.layout35.grid.width = 12;
    obj.layout35.grid["margin-bottom"] = 5;
    obj.layout35.grid["min-height"] = 150;
    obj.layout35:setName("layout35");
    obj.layout35.grid.role = "col";
    obj.layout35.grid["auto-height"] = true;

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout35);
    obj.layout36.grid.width = 12;
    obj.layout36.grid["cnt-vert-align"] = "center";
    obj.layout36.grid["margin-bottom"] = 20;
    obj.layout36.grid["margin-top"] = 20;
    obj.layout36:setName("layout36");
    obj.layout36.grid.role = "col";
    obj.layout36.grid["auto-height"] = true;

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.layout36);
    obj.horzLine11.grid.role = "col";
    obj.horzLine11.grid.width = 12;
    obj.horzLine11:setName("horzLine11");
    obj.horzLine11:setStrokeColor("#999999");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout36);
    obj.label30.grid.role = "col";
    obj.label30.grid.width = 12;
    obj.label30:setFontSize(20);
    obj.label30:setText("SAÚDE E ARMADURA");
    obj.label30:setHorzTextAlign("center");
    obj.label30.grid["margin-top"] = 5;
    obj.label30:setName("label30");
    obj.label30:setFontColor("#9e9e9e");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout35);
    obj.rectangle2.grid.role = "col";
    obj.rectangle2.grid.width = 6;
    obj.rectangle2.grid["cnt-vert-align"] = "center";
    obj.rectangle2:setName("rectangle2");
    lfm_setPropAsString(obj.rectangle2, "corners", "topLeft topRight bottomRight bottomLeft");
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setXradius(15);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setStrokeColor("#999999");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setColor("#343434");
    obj.rectangle2.grid["padding-top"] = 20;
    obj.rectangle2.grid["padding-left"] = 20;
    obj.rectangle2.grid["padding-right"] = 20;
    obj.rectangle2.grid["padding-bottom"] = 20;

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle2);
    obj.edit8:setField("pv");
    obj.edit8.grid.role = "col";
    obj.edit8.grid.width = 12;
    obj.edit8:setFontSize(20);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setName("edit8");
    obj.edit8:setTransparent(true);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout35);
    obj.rectangle3.grid.role = "col";
    obj.rectangle3.grid.width = 6;
    obj.rectangle3.grid["cnt-vert-align"] = "center";
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

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle3);
    obj.edit9:setField("Defesa");
    obj.edit9.grid.role = "col";
    obj.edit9.grid.width = 12;
    obj.edit9:setFontSize(20);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setName("edit9");
    obj.edit9:setTransparent(true);

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout35);
    obj.label31.grid.role = "col";
    obj.label31.grid.width = 6;
    obj.label31:setHorzTextAlign("center");
    obj.label31:setText("Pontos de Vida");
    obj.label31:setName("label31");
    obj.label31:setFontColor("#9e9e9e");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout35);
    obj.label32.grid.role = "col";
    obj.label32.grid.width = 6;
    obj.label32:setHorzTextAlign("center");
    obj.label32:setText("Defesa");
    obj.label32:setName("label32");
    obj.label32:setFontColor("#9e9e9e");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout34);
    obj.layout37.grid.width = 12;
    obj.layout37.grid["cnt-vert-align"] = "center";
    obj.layout37.grid["margin-bottom"] = 20;
    obj.layout37.grid["margin-top"] = 20;
    obj.layout37:setName("layout37");
    obj.layout37.grid.role = "col";
    obj.layout37.grid["auto-height"] = true;

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.layout37);
    obj.horzLine12.grid.role = "col";
    obj.horzLine12.grid.width = 12;
    obj.horzLine12:setName("horzLine12");
    obj.horzLine12:setStrokeColor("#999999");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout37);
    obj.label33.grid.role = "col";
    obj.label33.grid.width = 12;
    obj.label33:setFontSize(20);
    obj.label33:setText("INFECTOS");
    obj.label33:setHorzTextAlign("center");
    obj.label33.grid["margin-top"] = 5;
    obj.label33:setName("label33");
    obj.label33:setFontColor("#9e9e9e");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout34);
    obj.textEditor1.grid.role = "col";
    obj.textEditor1.grid.width = 12;
    obj.textEditor1.grid["min-height"] = 200;
    obj.textEditor1:setField("infectos");
    obj.textEditor1:setName("textEditor1");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout34);
    obj.layout38.grid.width = 12;
    obj.layout38.grid["cnt-vert-align"] = "center";
    obj.layout38.grid["margin-bottom"] = 20;
    obj.layout38.grid["margin-top"] = 20;
    obj.layout38:setName("layout38");
    obj.layout38.grid.role = "col";
    obj.layout38.grid["auto-height"] = true;

    obj.horzLine13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine13:setParent(obj.layout38);
    obj.horzLine13.grid.role = "col";
    obj.horzLine13.grid.width = 12;
    obj.horzLine13:setName("horzLine13");
    obj.horzLine13:setStrokeColor("#999999");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout38);
    obj.label34.grid.role = "col";
    obj.label34.grid.width = 12;
    obj.label34:setFontSize(20);
    obj.label34:setText("ANOTÇÕES");
    obj.label34:setHorzTextAlign("center");
    obj.label34.grid["margin-top"] = 5;
    obj.label34:setName("label34");
    obj.label34:setFontColor("#9e9e9e");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout34);
    obj.textEditor2.grid.role = "col";
    obj.textEditor2.grid.width = 12;
    obj.textEditor2.grid["min-height"] = 200;
    obj.textEditor2:setField("anotacoes");
    obj.textEditor2:setName("textEditor2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Equipamento");
    obj.tab2:setName("tab2");

    obj.Equipamento = GUI.fromHandle(_obj_newObject("form"));
    obj.Equipamento:setParent(obj.tab2);
    obj.Equipamento:setName("Equipamento");
    obj.Equipamento:setAlign("client");
    obj.Equipamento:setTheme("dark");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.Equipamento);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.scrollBox2);
    obj.layout39.grid.width = 12;
    obj.layout39.grid["min-width"] = 800;
    obj.layout39.grid["padding-bottom"] = 50;
    obj.layout39.grid["padding-top"] = 50;
    obj.layout39.grid["padding-left"] = 200;
    obj.layout39.grid["padding-right"] = 200;
    obj.layout39:setName("layout39");
    obj.layout39.grid.role = "col";
    obj.layout39.grid["auto-height"] = true;

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout39);
    obj.layout40.grid.width = 8;
    obj.layout40.grid["padding-right"] = 50;
    obj.layout40:setName("layout40");
    obj.layout40.grid.role = "col";
    obj.layout40.grid["auto-height"] = true;

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41.grid.role = "col";
    obj.layout41.grid.width = 12;
    obj.layout41.grid["auto-height"] = true;
    obj.layout41.grid["margin-bottom"] = 5;
    obj.layout41:setName("layout41");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout41);
    obj.edit10.grid.role = "col";
    obj.edit10.grid.width = 12;
    obj.edit10:setHorzTextAlign("leading");
    obj.edit10:setTransparent(true);
    obj.edit10:setField("info_ARMAS");
    obj.edit10:setType("text");
    obj.edit10:setFontSize(20);
    obj.edit10:setName("edit10");

    obj.horzLine14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine14:setParent(obj.layout41);
    obj.horzLine14.grid.role = "col";
    obj.horzLine14.grid.width = 12;
    obj.horzLine14:setName("horzLine14");
    obj.horzLine14:setStrokeColor("#999999");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout41);
    obj.label35.grid.role = "col";
    obj.label35.grid.width = 12;
    obj.label35:setHorzTextAlign("leading");
    obj.label35:setText("ARMAS");
    obj.label35:setVertTextAlign("trailing");
    obj.label35:setName("label35");
    obj.label35:setFontColor("#9e9e9e");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout40);
    obj.label36.grid.role = "col";
    obj.label36.grid.width = 2;
    obj.label36:setText("Arma");
    obj.label36:setName("label36");
    obj.label36:setFontColor("#9e9e9e");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout40);
    obj.label37.grid.role = "col";
    obj.label37.grid.width = 2;
    obj.label37:setText("Dificuldade");
    obj.label37:setName("label37");
    obj.label37:setFontColor("#9e9e9e");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout40);
    obj.label38.grid.role = "col";
    obj.label38.grid.width = 1;
    obj.label38:setText("Dano");
    obj.label38:setName("label38");
    obj.label38:setFontColor("#9e9e9e");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout40);
    obj.label39.grid.role = "col";
    obj.label39.grid.width = 2;
    obj.label39:setText("Alcance");
    obj.label39:setName("label39");
    obj.label39:setFontColor("#9e9e9e");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout40);
    obj.label40.grid.role = "col";
    obj.label40.grid.width = 2;
    obj.label40:setText("Pente");
    obj.label40:setName("label40");
    obj.label40:setFontColor("#9e9e9e");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout40);
    obj.label41.grid.role = "col";
    obj.label41.grid.width = 2;
    obj.label41:setText("Cdt");
    obj.label41:setName("label41");
    obj.label41:setFontColor("#9e9e9e");

    obj.addArma = GUI.fromHandle(_obj_newObject("button"));
    obj.addArma:setParent(obj.layout40);
    obj.addArma:setName("addArma");
    obj.addArma.grid.role = "col";
    obj.addArma.grid.width = 1;
    obj.addArma:setText("➕");

    obj.rclArmas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmas:setParent(obj.layout40);
    obj.rclArmas:setName("rclArmas");
    obj.rclArmas:setField("armas");
    obj.rclArmas:setTemplateForm("frmArma");
    obj.rclArmas.grid.role = "col";
    obj.rclArmas.grid.width = 12;
    obj.rclArmas.grid["min-height"] = 300;
    obj.rclArmas.grid["margin-top"] = 10;

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout39);
    obj.layout42.grid.width = 4;
    obj.layout42:setName("layout42");
    obj.layout42.grid.role = "col";
    obj.layout42.grid["auto-height"] = true;

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout42);
    obj.layout43.grid.role = "col";
    obj.layout43.grid.width = 12;
    obj.layout43.grid["auto-height"] = true;
    obj.layout43.grid["margin-bottom"] = 5;
    obj.layout43:setName("layout43");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout43);
    obj.edit11.grid.role = "col";
    obj.edit11.grid.width = 12;
    obj.edit11:setHorzTextAlign("leading");
    obj.edit11:setTransparent(true);
    obj.edit11:setField("info_ARMADURA");
    obj.edit11:setType("text");
    obj.edit11:setFontSize(20);
    obj.edit11:setName("edit11");

    obj.horzLine15 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine15:setParent(obj.layout43);
    obj.horzLine15.grid.role = "col";
    obj.horzLine15.grid.width = 12;
    obj.horzLine15:setName("horzLine15");
    obj.horzLine15:setStrokeColor("#999999");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout43);
    obj.label42.grid.role = "col";
    obj.label42.grid.width = 12;
    obj.label42:setHorzTextAlign("leading");
    obj.label42:setText("ARMADURA");
    obj.label42:setVertTextAlign("trailing");
    obj.label42:setName("label42");
    obj.label42:setFontColor("#9e9e9e");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout42);
    obj.label43.grid.role = "col";
    obj.label43.grid.width = 4;
    obj.label43:setText("Armadura");
    obj.label43:setName("label43");
    obj.label43:setFontColor("#9e9e9e");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout42);
    obj.label44.grid.role = "col";
    obj.label44.grid.width = 3;
    obj.label44:setText("Resistência");
    obj.label44:setName("label44");
    obj.label44:setFontColor("#9e9e9e");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout42);
    obj.label45.grid.role = "col";
    obj.label45.grid.width = 3;
    obj.label45:setText("Especial");
    obj.label45:setName("label45");
    obj.label45:setFontColor("#9e9e9e");

    obj.addArmadura = GUI.fromHandle(_obj_newObject("button"));
    obj.addArmadura:setParent(obj.layout42);
    obj.addArmadura:setName("addArmadura");
    obj.addArmadura.grid.role = "col";
    obj.addArmadura.grid.width = 2;
    obj.addArmadura:setText("➕");

    obj.rclArmadura = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmadura:setParent(obj.layout42);
    obj.rclArmadura:setName("rclArmadura");
    obj.rclArmadura:setField("armadura");
    obj.rclArmadura:setTemplateForm("frmArmadura");
    obj.rclArmadura.grid.role = "col";
    obj.rclArmadura.grid.width = 12;
    obj.rclArmadura.grid["min-height"] = 300;
    obj.rclArmadura.grid["margin-top"] = 10;

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout39);
    obj.layout44.grid.width = 12;
    obj.layout44.grid["min-height"] = 800;
    obj.layout44.grid["cnt-horz-align"] = "center";
    obj.layout44.grid["cnt-vert-align"] = "center";
    obj.layout44:setName("layout44");
    obj.layout44.grid.role = "col";
    obj.layout44.grid["auto-height"] = true;

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout44);
    obj.layout45.grid.width = 12;
    obj.layout45.grid["cnt-vert-align"] = "center";
    obj.layout45.grid["margin-bottom"] = 20;
    obj.layout45.grid["margin-top"] = 20;
    obj.layout45:setName("layout45");
    obj.layout45.grid.role = "col";
    obj.layout45.grid["auto-height"] = true;

    obj.horzLine16 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine16:setParent(obj.layout45);
    obj.horzLine16.grid.role = "col";
    obj.horzLine16.grid.width = 12;
    obj.horzLine16:setName("horzLine16");
    obj.horzLine16:setStrokeColor("#999999");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout45);
    obj.label46.grid.role = "col";
    obj.label46.grid.width = 12;
    obj.label46:setFontSize(20);
    obj.label46:setText("CRÉDITOS");
    obj.label46:setHorzTextAlign("center");
    obj.label46.grid["margin-top"] = 5;
    obj.label46:setName("label46");
    obj.label46:setFontColor("#9e9e9e");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout44);
    obj.layout46.grid.width = 6;
    obj.layout46.grid["auto-height"] = true;
    obj.layout46.grid["min-height"] = 300;
    obj.layout46.grid["margin-bottom"] = 30;
    obj.layout46:setName("layout46");
    obj.layout46.grid.role = "col";

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout46);
    obj.image3:setSRC("/img/xerem_profile.png");
    obj.image3:setAlign("client");
    obj.image3:setStyle("proportional");
    obj.image3:setName("image3");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout44);
    obj.layout47.grid.width = 6;
    obj.layout47:setName("layout47");
    obj.layout47.grid.role = "col";
    obj.layout47.grid["auto-height"] = true;

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout47);
    obj.button13:setText(" Red Star por Eric S.A. Araújo (Hobbit)");
    obj.button13.grid.role = "col";
    obj.button13.grid.width = 6;
    obj.button13.grid["break-line-after"] = true;
    obj.button13.grid["margin-bottom"] = 5;
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout47);
    obj.button14:setText("Ficha - Xerém Destrói O RPG de Mesa");
    obj.button14.grid.role = "col";
    obj.button14.grid.width = 6;
    obj.button14:setName("button14");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            Dialogs.choose("Escolha a Característica", {'Força', 'Constituição', 'Destreza', 'Percepção', 'Inteligência', 'Força de Vontade'},
                                    function(selected, seletedIndex, car)
                                        if selected then
                                        
                                            local carVal = 1
            
                                            if car == 'Força' then
                                                carVal = sheet.valfor
                                            end
                                            if car == 'Constituição' then
                                                carVal = sheet.valcon
                                            end
                                            if car == 'Destreza' then
                                                carVal = sheet.valdes
                                            end
                                            if car == 'Percepção' then
                                                carVal = sheet.valper
                                            end
                                            if car == 'Inteligência' then
                                                carVal = sheet.valint
                                            end
                                            if car == 'Força de Vontade' then
                                                carVal = sheet.valfdv
                                            end
                                            
                                            Dialogs.inputQuery("Dificuldade", "Insira a dificuldade", '+1',
                                                function(dif)
                                                    rolarTeste('Esportes', carVal or 1, sheet.valesp or 0, dif);
                                                end
                                            );
                                        else
                                            showMessage('Cancelando!')
                                        end;  
                                    end);
        end);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (event)
            Dialogs.choose("Escolha a Característica", {'Força', 'Constituição', 'Destreza', 'Percepção', 'Inteligência', 'Força de Vontade'},
                                    function(selected, seletedIndex, car)
                                        if selected then
                                        
                                            local carVal = 1
            
                                            if car == 'Força' then
                                                carVal = sheet.valfor
                                            end
                                            if car == 'Constituição' then
                                                carVal = sheet.valcon
                                            end
                                            if car == 'Destreza' then
                                                carVal = sheet.valdes
                                            end
                                            if car == 'Percepção' then
                                                carVal = sheet.valper
                                            end
                                            if car == 'Inteligência' then
                                                carVal = sheet.valint
                                            end
                                            if car == 'Força de Vontade' then
                                                carVal = sheet.valfdv
                                            end
                                            
                                            Dialogs.inputQuery("Dificuldade", "Insira a dificuldade", '+1',
                                                function(dif)
                                                    rolarTeste('Combate Desarmado', carVal or 1, sheet.valcombDes or 0, dif);
                                                end
                                            );
                                        else
                                            showMessage('Cancelando!')
                                        end;  
                                    end);
        end);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (event)
            Dialogs.choose("Escolha a Característica", {'Força', 'Constituição', 'Destreza', 'Percepção', 'Inteligência', 'Força de Vontade'},
                                    function(selected, seletedIndex, car)
                                        if selected then
                                        
                                            local carVal = 1
            
                                            if car == 'Força' then
                                                carVal = sheet.valfor
                                            end
                                            if car == 'Constituição' then
                                                carVal = sheet.valcon
                                            end
                                            if car == 'Destreza' then
                                                carVal = sheet.valdes
                                            end
                                            if car == 'Percepção' then
                                                carVal = sheet.valper
                                            end
                                            if car == 'Inteligência' then
                                                carVal = sheet.valint
                                            end
                                            if car == 'Força de Vontade' then
                                                carVal = sheet.valfdv
                                            end
                                            
                                            Dialogs.inputQuery("Dificuldade", "Insira a dificuldade", '+1',
                                                function(dif)
                                                    rolarTeste('Armas Brancas', carVal or 1, sheet.valarmBra or 0, dif);
                                                end
                                            );
                                        else
                                            showMessage('Cancelando!')
                                        end;  
                                    end);
        end);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (event)
            Dialogs.choose("Escolha a Característica", {'Força', 'Constituição', 'Destreza', 'Percepção', 'Inteligência', 'Força de Vontade'},
                                    function(selected, seletedIndex, car)
                                        if selected then
                                        
                                            local carVal = 1
            
                                            if car == 'Força' then
                                                carVal = sheet.valfor
                                            end
                                            if car == 'Constituição' then
                                                carVal = sheet.valcon
                                            end
                                            if car == 'Destreza' then
                                                carVal = sheet.valdes
                                            end
                                            if car == 'Percepção' then
                                                carVal = sheet.valper
                                            end
                                            if car == 'Inteligência' then
                                                carVal = sheet.valint
                                            end
                                            if car == 'Força de Vontade' then
                                                carVal = sheet.valfdv
                                            end
                                            
                                            Dialogs.inputQuery("Dificuldade", "Insira a dificuldade", '+1',
                                                function(dif)
                                                    rolarTeste('Armas de Fogo', carVal or 1, sheet.valarmFog or 0, dif);
                                                end
                                            );
                                        else
                                            showMessage('Cancelando!')
                                        end;  
                                    end);
        end);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (event)
            Dialogs.choose("Escolha a Característica", {'Força', 'Constituição', 'Destreza', 'Percepção', 'Inteligência', 'Força de Vontade'},
                                    function(selected, seletedIndex, car)
                                        if selected then
                                        
                                            local carVal = 1
            
                                            if car == 'Força' then
                                                carVal = sheet.valfor
                                            end
                                            if car == 'Constituição' then
                                                carVal = sheet.valcon
                                            end
                                            if car == 'Destreza' then
                                                carVal = sheet.valdes
                                            end
                                            if car == 'Percepção' then
                                                carVal = sheet.valper
                                            end
                                            if car == 'Inteligência' then
                                                carVal = sheet.valint
                                            end
                                            if car == 'Força de Vontade' then
                                                carVal = sheet.valfdv
                                            end
                                            
                                            Dialogs.inputQuery("Dificuldade", "Insira a dificuldade", '+1',
                                                function(dif)
                                                    rolarTeste('Ciências', carVal or 1, sheet.valcie or 0, dif);
                                                end
                                            );
                                        else
                                            showMessage('Cancelando!')
                                        end;  
                                    end);
        end);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (event)
            Dialogs.choose("Escolha a Característica", {'Força', 'Constituição', 'Destreza', 'Percepção', 'Inteligência', 'Força de Vontade'},
                                    function(selected, seletedIndex, car)
                                        if selected then
                                        
                                            local carVal = 1
            
                                            if car == 'Força' then
                                                carVal = sheet.valfor
                                            end
                                            if car == 'Constituição' then
                                                carVal = sheet.valcon
                                            end
                                            if car == 'Destreza' then
                                                carVal = sheet.valdes
                                            end
                                            if car == 'Percepção' then
                                                carVal = sheet.valper
                                            end
                                            if car == 'Inteligência' then
                                                carVal = sheet.valint
                                            end
                                            if car == 'Força de Vontade' then
                                                carVal = sheet.valfdv
                                            end
                                            
                                            Dialogs.inputQuery("Dificuldade", "Insira a dificuldade", '+1',
                                                function(dif)
                                                    rolarTeste('Crime', carVal or 1, sheet.valcri or 0, dif);
                                                end
                                            );
                                        else
                                            showMessage('Cancelando!')
                                        end;  
                                    end);
        end);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (event)
            Dialogs.choose("Escolha a Característica", {'Força', 'Constituição', 'Destreza', 'Percepção', 'Inteligência', 'Força de Vontade'},
                                    function(selected, seletedIndex, car)
                                        if selected then
                                        
                                            local carVal = 1
            
                                            if car == 'Força' then
                                                carVal = sheet.valfor
                                            end
                                            if car == 'Constituição' then
                                                carVal = sheet.valcon
                                            end
                                            if car == 'Destreza' then
                                                carVal = sheet.valdes
                                            end
                                            if car == 'Percepção' then
                                                carVal = sheet.valper
                                            end
                                            if car == 'Inteligência' then
                                                carVal = sheet.valint
                                            end
                                            if car == 'Força de Vontade' then
                                                carVal = sheet.valfdv
                                            end
                                            
                                            Dialogs.inputQuery("Dificuldade", "Insira a dificuldade", '+1',
                                                function(dif)
                                                    rolarTeste('Investigação', carVal or 1, sheet.valinv or 0, dif);
                                                end
                                            );
                                        else
                                            showMessage('Cancelando!')
                                        end;  
                                    end);
        end);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (event)
            Dialogs.choose("Escolha a Característica", {'Força', 'Constituição', 'Destreza', 'Percepção', 'Inteligência', 'Força de Vontade'},
                                    function(selected, seletedIndex, car)
                                        if selected then
                                        
                                            local carVal = 1
            
                                            if car == 'Força' then
                                                carVal = sheet.valfor
                                            end
                                            if car == 'Constituição' then
                                                carVal = sheet.valcon
                                            end
                                            if car == 'Destreza' then
                                                carVal = sheet.valdes
                                            end
                                            if car == 'Percepção' then
                                                carVal = sheet.valper
                                            end
                                            if car == 'Inteligência' then
                                                carVal = sheet.valint
                                            end
                                            if car == 'Força de Vontade' then
                                                carVal = sheet.valfdv
                                            end
                                            
                                            Dialogs.inputQuery("Dificuldade", "Insira a dificuldade", '+1',
                                                function(dif)
                                                    rolarTeste('Maquinário', carVal or 1, sheet.valmaq or 0, dif);
                                                end
                                            );
                                        else
                                            showMessage('Cancelando!')
                                        end;  
                                    end);
        end);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (event)
            Dialogs.choose("Escolha a Característica", {'Força', 'Constituição', 'Destreza', 'Percepção', 'Inteligência', 'Força de Vontade'},
                                    function(selected, seletedIndex, car)
                                        if selected then
                                        
                                            local carVal = 1
            
                                            if car == 'Força' then
                                                carVal = sheet.valfor
                                            end
                                            if car == 'Constituição' then
                                                carVal = sheet.valcon
                                            end
                                            if car == 'Destreza' then
                                                carVal = sheet.valdes
                                            end
                                            if car == 'Percepção' then
                                                carVal = sheet.valper
                                            end
                                            if car == 'Inteligência' then
                                                carVal = sheet.valint
                                            end
                                            if car == 'Força de Vontade' then
                                                carVal = sheet.valfdv
                                            end
                                            
                                            Dialogs.inputQuery("Dificuldade", "Insira a dificuldade", '+1',
                                                function(dif)
                                                    rolarTeste('Manipulação', carVal or 1, sheet.valman or 0, dif);
                                                end
                                            );
                                        else
                                            showMessage('Cancelando!')
                                        end;  
                                    end);
        end);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (event)
            Dialogs.choose("Escolha a Característica", {'Força', 'Constituição', 'Destreza', 'Percepção', 'Inteligência', 'Força de Vontade'},
                                    function(selected, seletedIndex, car)
                                        if selected then
                                        
                                            local carVal = 1
            
                                            if car == 'Força' then
                                                carVal = sheet.valfor
                                            end
                                            if car == 'Constituição' then
                                                carVal = sheet.valcon
                                            end
                                            if car == 'Destreza' then
                                                carVal = sheet.valdes
                                            end
                                            if car == 'Percepção' then
                                                carVal = sheet.valper
                                            end
                                            if car == 'Inteligência' then
                                                carVal = sheet.valint
                                            end
                                            if car == 'Força de Vontade' then
                                                carVal = sheet.valfdv
                                            end
                                            
                                            Dialogs.inputQuery("Dificuldade", "Insira a dificuldade", '+1',
                                                function(dif)
                                                    rolarTeste('Medicina', carVal or 1, sheet.valmed or 0, dif);
                                                end
                                            );
                                        else
                                            showMessage('Cancelando!')
                                        end;  
                                    end);
        end);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (event)
            Dialogs.choose("Escolha a Característica", {'Força', 'Constituição', 'Destreza', 'Percepção', 'Inteligência', 'Força de Vontade'},
                                    function(selected, seletedIndex, car)
                                        if selected then
                                        
                                            local carVal = 1
            
                                            if car == 'Força' then
                                                carVal = sheet.valfor
                                            end
                                            if car == 'Constituição' then
                                                carVal = sheet.valcon
                                            end
                                            if car == 'Destreza' then
                                                carVal = sheet.valdes
                                            end
                                            if car == 'Percepção' then
                                                carVal = sheet.valper
                                            end
                                            if car == 'Inteligência' then
                                                carVal = sheet.valint
                                            end
                                            if car == 'Força de Vontade' then
                                                carVal = sheet.valfdv
                                            end
                                            
                                            Dialogs.inputQuery("Dificuldade", "Insira a dificuldade", '+1',
                                                function(dif)
                                                    rolarTeste('Sobrevivência', carVal or 1, sheet.valsob or 0, dif);
                                                end
                                            );
                                        else
                                            showMessage('Cancelando!')
                                        end;  
                                    end);
        end);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (event)
            self.rclVantDesv:append();
        end);

    obj._e_event12 = obj.addArma:addEventListener("onClick",
        function (event)
            self.rclArmas:append();
        end);

    obj._e_event13 = obj.addArmadura:addEventListener("onClick",
        function (event)
            self.rclArmadura:append();
        end);

    obj._e_event14 = obj.button14:addEventListener("onClick",
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
        if self.radioButton119 ~= nil then self.radioButton119:destroy(); self.radioButton119 = nil; end;
        if self.radioButton43 ~= nil then self.radioButton43:destroy(); self.radioButton43 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.radioButton29 ~= nil then self.radioButton29:destroy(); self.radioButton29 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.radioButton69 ~= nil then self.radioButton69:destroy(); self.radioButton69 = nil; end;
        if self.radioButton107 ~= nil then self.radioButton107:destroy(); self.radioButton107 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.radioButton55 ~= nil then self.radioButton55:destroy(); self.radioButton55 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.rclArmas ~= nil then self.rclArmas:destroy(); self.rclArmas = nil; end;
        if self.radioButton66 ~= nil then self.radioButton66:destroy(); self.radioButton66 = nil; end;
        if self.radioButton10 ~= nil then self.radioButton10:destroy(); self.radioButton10 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.radioButton50 ~= nil then self.radioButton50:destroy(); self.radioButton50 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.radioButton8 ~= nil then self.radioButton8:destroy(); self.radioButton8 = nil; end;
        if self.radioButton23 ~= nil then self.radioButton23:destroy(); self.radioButton23 = nil; end;
        if self.radioButton132 ~= nil then self.radioButton132:destroy(); self.radioButton132 = nil; end;
        if self.radioButton63 ~= nil then self.radioButton63:destroy(); self.radioButton63 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.radioButton86 ~= nil then self.radioButton86:destroy(); self.radioButton86 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.radioButton121 ~= nil then self.radioButton121:destroy(); self.radioButton121 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.radioButton6 ~= nil then self.radioButton6:destroy(); self.radioButton6 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.radioButton124 ~= nil then self.radioButton124:destroy(); self.radioButton124 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.radioButton76 ~= nil then self.radioButton76:destroy(); self.radioButton76 = nil; end;
        if self.radioButton91 ~= nil then self.radioButton91:destroy(); self.radioButton91 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.radioButton110 ~= nil then self.radioButton110:destroy(); self.radioButton110 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.radioButton35 ~= nil then self.radioButton35:destroy(); self.radioButton35 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.radioButton94 ~= nil then self.radioButton94:destroy(); self.radioButton94 = nil; end;
        if self.rclVantDesv ~= nil then self.rclVantDesv:destroy(); self.rclVantDesv = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.radioButton108 ~= nil then self.radioButton108:destroy(); self.radioButton108 = nil; end;
        if self.radioButton115 ~= nil then self.radioButton115:destroy(); self.radioButton115 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.radioButton38 ~= nil then self.radioButton38:destroy(); self.radioButton38 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.radioButton47 ~= nil then self.radioButton47:destroy(); self.radioButton47 = nil; end;
        if self.radioButton78 ~= nil then self.radioButton78:destroy(); self.radioButton78 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.Geral ~= nil then self.Geral:destroy(); self.Geral = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.radioButton103 ~= nil then self.radioButton103:destroy(); self.radioButton103 = nil; end;
        if self.radioButton40 ~= nil then self.radioButton40:destroy(); self.radioButton40 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.radioButton106 ~= nil then self.radioButton106:destroy(); self.radioButton106 = nil; end;
        if self.rclArmadura ~= nil then self.rclArmadura:destroy(); self.rclArmadura = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.radioButton54 ~= nil then self.radioButton54:destroy(); self.radioButton54 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.horzLine16 ~= nil then self.horzLine16:destroy(); self.horzLine16 = nil; end;
        if self.radioButton67 ~= nil then self.radioButton67:destroy(); self.radioButton67 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.radioButton17 ~= nil then self.radioButton17:destroy(); self.radioButton17 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.radioButton9 ~= nil then self.radioButton9:destroy(); self.radioButton9 = nil; end;
        if self.radioButton24 ~= nil then self.radioButton24:destroy(); self.radioButton24 = nil; end;
        if self.radioButton133 ~= nil then self.radioButton133:destroy(); self.radioButton133 = nil; end;
        if self.radioButton82 ~= nil then self.radioButton82:destroy(); self.radioButton82 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.radioButton87 ~= nil then self.radioButton87:destroy(); self.radioButton87 = nil; end;
        if self.radioButton120 ~= nil then self.radioButton120:destroy(); self.radioButton120 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.radioButton7 ~= nil then self.radioButton7:destroy(); self.radioButton7 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.radioButton88 ~= nil then self.radioButton88:destroy(); self.radioButton88 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.radioButton127 ~= nil then self.radioButton127:destroy(); self.radioButton127 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.radioButton31 ~= nil then self.radioButton31:destroy(); self.radioButton31 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.radioButton71 ~= nil then self.radioButton71:destroy(); self.radioButton71 = nil; end;
        if self.radioButton90 ~= nil then self.radioButton90:destroy(); self.radioButton90 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.radioButton111 ~= nil then self.radioButton111:destroy(); self.radioButton111 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.radioButton34 ~= nil then self.radioButton34:destroy(); self.radioButton34 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.radioButton44 ~= nil then self.radioButton44:destroy(); self.radioButton44 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.radioButton102 ~= nil then self.radioButton102:destroy(); self.radioButton102 = nil; end;
        if self.radioButton41 ~= nil then self.radioButton41:destroy(); self.radioButton41 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.radioButton105 ~= nil then self.radioButton105:destroy(); self.radioButton105 = nil; end;
        if self.radioButton13 ~= nil then self.radioButton13:destroy(); self.radioButton13 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.radioButton53 ~= nil then self.radioButton53:destroy(); self.radioButton53 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.radioButton20 ~= nil then self.radioButton20:destroy(); self.radioButton20 = nil; end;
        if self.radioButton60 ~= nil then self.radioButton60:destroy(); self.radioButton60 = nil; end;
        if self.radioButton16 ~= nil then self.radioButton16:destroy(); self.radioButton16 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.radioButton129 ~= nil then self.radioButton129:destroy(); self.radioButton129 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.addArmadura ~= nil then self.addArmadura:destroy(); self.addArmadura = nil; end;
        if self.radioButton134 ~= nil then self.radioButton134:destroy(); self.radioButton134 = nil; end;
        if self.radioButton25 ~= nil then self.radioButton25:destroy(); self.radioButton25 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.radioButton83 ~= nil then self.radioButton83:destroy(); self.radioButton83 = nil; end;
        if self.radioButton19 ~= nil then self.radioButton19:destroy(); self.radioButton19 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.radioButton59 ~= nil then self.radioButton59:destroy(); self.radioButton59 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.radioButton99 ~= nil then self.radioButton99:destroy(); self.radioButton99 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.radioButton84 ~= nil then self.radioButton84:destroy(); self.radioButton84 = nil; end;
        if self.Equipamento ~= nil then self.Equipamento:destroy(); self.Equipamento = nil; end;
        if self.radioButton123 ~= nil then self.radioButton123:destroy(); self.radioButton123 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.radioButton75 ~= nil then self.radioButton75:destroy(); self.radioButton75 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.radioButton89 ~= nil then self.radioButton89:destroy(); self.radioButton89 = nil; end;
        if self.radioButton126 ~= nil then self.radioButton126:destroy(); self.radioButton126 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.radioButton30 ~= nil then self.radioButton30:destroy(); self.radioButton30 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.radioButton70 ~= nil then self.radioButton70:destroy(); self.radioButton70 = nil; end;
        if self.radioButton97 ~= nil then self.radioButton97:destroy(); self.radioButton97 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.radioButton116 ~= nil then self.radioButton116:destroy(); self.radioButton116 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.radioButton37 ~= nil then self.radioButton37:destroy(); self.radioButton37 = nil; end;
        if self.radioButton48 ~= nil then self.radioButton48:destroy(); self.radioButton48 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.radioButton45 ~= nil then self.radioButton45:destroy(); self.radioButton45 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.radioButton101 ~= nil then self.radioButton101:destroy(); self.radioButton101 = nil; end;
        if self.radioButton57 ~= nil then self.radioButton57:destroy(); self.radioButton57 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.horzLine15 ~= nil then self.horzLine15:destroy(); self.horzLine15 = nil; end;
        if self.addArma ~= nil then self.addArma:destroy(); self.addArma = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.radioButton104 ~= nil then self.radioButton104:destroy(); self.radioButton104 = nil; end;
        if self.radioButton64 ~= nil then self.radioButton64:destroy(); self.radioButton64 = nil; end;
        if self.radioButton12 ~= nil then self.radioButton12:destroy(); self.radioButton12 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.radioButton52 ~= nil then self.radioButton52:destroy(); self.radioButton52 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.radioButton130 ~= nil then self.radioButton130:destroy(); self.radioButton130 = nil; end;
        if self.radioButton21 ~= nil then self.radioButton21:destroy(); self.radioButton21 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.radioButton61 ~= nil then self.radioButton61:destroy(); self.radioButton61 = nil; end;
        if self.radioButton15 ~= nil then self.radioButton15:destroy(); self.radioButton15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.radioButton128 ~= nil then self.radioButton128:destroy(); self.radioButton128 = nil; end;
        if self.radioButton135 ~= nil then self.radioButton135:destroy(); self.radioButton135 = nil; end;
        if self.radioButton26 ~= nil then self.radioButton26:destroy(); self.radioButton26 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.radioButton80 ~= nil then self.radioButton80:destroy(); self.radioButton80 = nil; end;
        if self.radioButton18 ~= nil then self.radioButton18:destroy(); self.radioButton18 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.radioButton58 ~= nil then self.radioButton58:destroy(); self.radioButton58 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.radioButton98 ~= nil then self.radioButton98:destroy(); self.radioButton98 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.radioButton85 ~= nil then self.radioButton85:destroy(); self.radioButton85 = nil; end;
        if self.radioButton122 ~= nil then self.radioButton122:destroy(); self.radioButton122 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.Styles ~= nil then self.Styles:destroy(); self.Styles = nil; end;
        if self.radioButton74 ~= nil then self.radioButton74:destroy(); self.radioButton74 = nil; end;
        if self.radioButton93 ~= nil then self.radioButton93:destroy(); self.radioButton93 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.radioButton112 ~= nil then self.radioButton112:destroy(); self.radioButton112 = nil; end;
        if self.radioButton33 ~= nil then self.radioButton33:destroy(); self.radioButton33 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.radioButton73 ~= nil then self.radioButton73:destroy(); self.radioButton73 = nil; end;
        if self.radioButton96 ~= nil then self.radioButton96:destroy(); self.radioButton96 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.radioButton117 ~= nil then self.radioButton117:destroy(); self.radioButton117 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.radioButton36 ~= nil then self.radioButton36:destroy(); self.radioButton36 = nil; end;
        if self.radioButton49 ~= nil then self.radioButton49:destroy(); self.radioButton49 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.radioButton118 ~= nil then self.radioButton118:destroy(); self.radioButton118 = nil; end;
        if self.radioButton42 ~= nil then self.radioButton42:destroy(); self.radioButton42 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.radioButton28 ~= nil then self.radioButton28:destroy(); self.radioButton28 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.radioButton68 ~= nil then self.radioButton68:destroy(); self.radioButton68 = nil; end;
        if self.radioButton100 ~= nil then self.radioButton100:destroy(); self.radioButton100 = nil; end;
        if self.radioButton56 ~= nil then self.radioButton56:destroy(); self.radioButton56 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.horzLine14 ~= nil then self.horzLine14:destroy(); self.horzLine14 = nil; end;
        if self.radioButton65 ~= nil then self.radioButton65:destroy(); self.radioButton65 = nil; end;
        if self.radioButton11 ~= nil then self.radioButton11:destroy(); self.radioButton11 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.radioButton51 ~= nil then self.radioButton51:destroy(); self.radioButton51 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.horzLine13 ~= nil then self.horzLine13:destroy(); self.horzLine13 = nil; end;
        if self.radioButton131 ~= nil then self.radioButton131:destroy(); self.radioButton131 = nil; end;
        if self.radioButton22 ~= nil then self.radioButton22:destroy(); self.radioButton22 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.radioButton62 ~= nil then self.radioButton62:destroy(); self.radioButton62 = nil; end;
        if self.radioButton14 ~= nil then self.radioButton14:destroy(); self.radioButton14 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.radioButton136 ~= nil then self.radioButton136:destroy(); self.radioButton136 = nil; end;
        if self.radioButton27 ~= nil then self.radioButton27:destroy(); self.radioButton27 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.radioButton81 ~= nil then self.radioButton81:destroy(); self.radioButton81 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.radioButton125 ~= nil then self.radioButton125:destroy(); self.radioButton125 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.radioButton92 ~= nil then self.radioButton92:destroy(); self.radioButton92 = nil; end;
        if self.radioButton77 ~= nil then self.radioButton77:destroy(); self.radioButton77 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.radioButton113 ~= nil then self.radioButton113:destroy(); self.radioButton113 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.radioButton32 ~= nil then self.radioButton32:destroy(); self.radioButton32 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.radioButton72 ~= nil then self.radioButton72:destroy(); self.radioButton72 = nil; end;
        if self.radioButton95 ~= nil then self.radioButton95:destroy(); self.radioButton95 = nil; end;
        if self.radioButton109 ~= nil then self.radioButton109:destroy(); self.radioButton109 = nil; end;
        if self.radioButton114 ~= nil then self.radioButton114:destroy(); self.radioButton114 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.radioButton39 ~= nil then self.radioButton39:destroy(); self.radioButton39 = nil; end;
        if self.radioButton46 ~= nil then self.radioButton46:destroy(); self.radioButton46 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.radioButton79 ~= nil then self.radioButton79:destroy(); self.radioButton79 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRedStar()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRedStar();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRedStar = {
    newEditor = newfrmFichaRedStar, 
    new = newfrmFichaRedStar, 
    name = "frmFichaRedStar", 
    dataType = "fichaRedStar", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Ficha Red Star", 
    description=""};

frmFichaRedStar = _frmFichaRedStar;
Firecast.registrarForm(_frmFichaRedStar);
Firecast.registrarDataType(_frmFichaRedStar);

return _frmFichaRedStar;
