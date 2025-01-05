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


		



		local function lancar_dados()
			local mesa = Firecast.getMesaDe(sheet);
			local instinto = sheet.valInstinto;
			local pericia = sheet.valConhecPrat;

			if sheet.agirPorInstinto == true and instinto ~= 0 then -- se for agir por instinto e tiver algum valor no instinto atual
				mesa.chat:rolarDados(instinto.."d6", sheet.nomePersonagem .. " Agindo Por Instinto: " .. sheet.currentInstinto);
			else
				if instinto and pericia ~= 0 then
					instinto = instinto .. "d6";
					pericia = pericia .. "d10";
					local rolagem = Firecast.interpretarRolagem(instinto):concatenar(pericia);
					local promise = mesa.chat:asyncRoll(rolagem, sheet.nomePersonagem .. " agiu com " ..  sheet.currentInstinto .. " e " .. sheet.currentConhecPrat);
					local n, rollObject, logRec = await(promise); -- pegando os tres retornos da promise da rolagem e salvando em 3 variaveis locais
					-- tratando o resultado --
					-- aqui o lance vai ser pegar essa table, e pra cada resultado comparar com uma tabela de valores dos dados especiais do Assimilacao --
					-- mesa.chat:write(rollObject);
				end;
			end;
		end;
		



	


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1.grid.role = "row";
    obj.layout1.grid.width = 12;
    obj.layout1.grid["min-height"] = 700;
    obj.layout1.grid["min-width"] = 500;
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1.grid.role = "container";
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1.grid["padding-top"] = 16;
    obj.rectangle1.grid["padding-bottom"] = 16;

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2.grid.role = "row";
    obj.layout2:setHeight(150);
    obj.layout2:setWidth(500);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setText("NOME:");
    obj.label1.grid.role = "col";
    obj.label1.grid.width = 2;
    obj.label1:setName("label1");
    obj.label1:setHeight(30);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setField("nomePersonagem");
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 10;
    obj.edit1:setName("edit1");
    obj.edit1:setHeight(30);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("Geração:");
    obj.label2.grid.role = "col";
    obj.label2.grid.width = 2;
    obj.label2:setName("label2");
    obj.label2:setHeight(30);

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setField("geracao");
    obj.edit2.grid.role = "col";
    obj.edit2.grid.width = 10;
    obj.edit2:setName("edit2");
    obj.edit2:setHeight(30);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setText("Evento Marcante:");
    obj.label3.grid.role = "col";
    obj.label3.grid.width = 2;
    obj.label3:setName("label3");
    obj.label3:setHeight(30);

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setField("eventoMarcante");
    obj.edit3.grid.role = "col";
    obj.edit3.grid.width = 10;
    obj.edit3:setName("edit3");
    obj.edit3:setHeight(30);

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setText("Posição Social:");
    obj.label4.grid.role = "col";
    obj.label4.grid.width = 2;
    obj.label4:setName("label4");
    obj.label4:setHeight(30);

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setField("posicaoSocial");
    obj.edit4.grid.role = "col";
    obj.edit4.grid.width = 10;
    obj.edit4:setName("edit4");
    obj.edit4:setHeight(30);

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3.grid.role = "col";
    obj.layout3.grid.width = 6;
    obj.layout3.grid["min-height"] = 200;
    obj.layout3.grid["margin-top"] = 10;
    obj.layout3:setName("layout3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setText("PROPOSITOS");
    obj.label5:setName("label5");
    obj.label5:setHeight(30);
    obj.label5:setMargins({top= 10});
    obj.label5:setFontSize(15);
    obj.label5:setHorzTextAlign("center");
    obj.label5.grid.role = "row";
    obj.label5.grid["min-height"] = 25;

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6:setText("Individuais:");
    obj.label6:setHorzTextAlign("leading");
    obj.label6.grid.role = "row";
    obj.label6.grid["min-height"] = 30;
    obj.label6:setName("label6");
    obj.label6:setHeight(30);

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout3);
    obj.textEditor1:setField("propositosIndiv");
    obj.textEditor1.grid.role = "row";
    obj.textEditor1.grid["min-height"] = 60;
    obj.textEditor1:setName("textEditor1");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setText("Relacionais:");
    obj.label7:setHorzTextAlign("leading");
    obj.label7.grid.role = "row";
    obj.label7.grid["min-height"] = 30;
    obj.label7:setName("label7");
    obj.label7:setHeight(30);

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout3);
    obj.textEditor2:setField("propositosRel");
    obj.textEditor2.grid.role = "row";
    obj.textEditor2.grid["min-height"] = 60;
    obj.textEditor2:setName("textEditor2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4.grid.role = "col";
    obj.layout4.grid.width = 6;
    obj.layout4.grid["min-height"] = 200;
    obj.layout4.grid["margin-top"] = 10;
    obj.layout4:setName("layout4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout4);
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setText("Determinacao");
    obj.label8.grid.role = "col";
    obj.label8.grid.width = 6;
    obj.label8:setName("label8");
    obj.label8:setHeight(30);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout4);
    obj.edit5:setField("determinacao");
    obj.edit5.grid.role = "col";
    obj.edit5.grid.width = 6;
    obj.edit5:setName("edit5");
    obj.edit5:setHeight(30);

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5.grid.role = "col";
    obj.layout5.grid.width = 1;
    obj.layout5:setName("layout5");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout4);
    obj.checkBox1:setField("dterm1");
    obj.checkBox1.grid.role = "col";
    obj.checkBox1.grid.width = 1;
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout4);
    obj.checkBox2:setField("dterm2");
    obj.checkBox2.grid.role = "col";
    obj.checkBox2.grid.width = 1;
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout4);
    obj.checkBox3:setField("dterm3");
    obj.checkBox3.grid.role = "col";
    obj.checkBox3.grid.width = 1;
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout4);
    obj.checkBox4:setField("dterm4");
    obj.checkBox4.grid.role = "col";
    obj.checkBox4.grid.width = 1;
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout4);
    obj.checkBox5:setField("dterm5");
    obj.checkBox5.grid.role = "col";
    obj.checkBox5.grid.width = 1;
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout4);
    obj.checkBox6:setField("dterm6");
    obj.checkBox6.grid.role = "col";
    obj.checkBox6.grid.width = 1;
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout4);
    obj.checkBox7:setField("dterm7");
    obj.checkBox7.grid.role = "col";
    obj.checkBox7.grid.width = 1;
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout4);
    obj.checkBox8:setField("dterm8");
    obj.checkBox8.grid.role = "col";
    obj.checkBox8.grid.width = 1;
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout4);
    obj.checkBox9:setField("dterm9");
    obj.checkBox9.grid.role = "col";
    obj.checkBox9.grid.width = 1;
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout4);
    obj.checkBox10:setField("dterm10");
    obj.checkBox10.grid.role = "col";
    obj.checkBox10.grid.width = 1;
    obj.checkBox10:setName("checkBox10");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6.grid.role = "col";
    obj.layout6.grid.width = 1;
    obj.layout6:setName("layout6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout4);
    obj.layout7.grid.role = "col";
    obj.layout7.grid.width = 1;
    obj.layout7:setName("layout7");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout4);
    obj.checkBox11:setField("assim1");
    obj.checkBox11.grid.role = "col";
    obj.checkBox11.grid.width = 1;
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout4);
    obj.checkBox12:setField("assim2");
    obj.checkBox12.grid.role = "col";
    obj.checkBox12.grid.width = 1;
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout4);
    obj.checkBox13:setField("assim3");
    obj.checkBox13.grid.role = "col";
    obj.checkBox13.grid.width = 1;
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout4);
    obj.checkBox14:setField("assim4");
    obj.checkBox14.grid.role = "col";
    obj.checkBox14.grid.width = 1;
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout4);
    obj.checkBox15:setField("assim5");
    obj.checkBox15.grid.role = "col";
    obj.checkBox15.grid.width = 1;
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout4);
    obj.checkBox16:setField("assim6");
    obj.checkBox16.grid.role = "col";
    obj.checkBox16.grid.width = 1;
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout4);
    obj.checkBox17:setField("assim7");
    obj.checkBox17.grid.role = "col";
    obj.checkBox17.grid.width = 1;
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout4);
    obj.checkBox18:setField("assim8");
    obj.checkBox18.grid.role = "col";
    obj.checkBox18.grid.width = 1;
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout4);
    obj.checkBox19:setField("assim9");
    obj.checkBox19.grid.role = "col";
    obj.checkBox19.grid.width = 1;
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout4);
    obj.checkBox20:setField("assim10");
    obj.checkBox20.grid.role = "col";
    obj.checkBox20.grid.width = 1;
    obj.checkBox20:setName("checkBox20");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout4);
    obj.layout8.grid.role = "col";
    obj.layout8.grid.width = 1;
    obj.layout8:setName("layout8");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout4);
    obj.edit6.grid.role = "col";
    obj.edit6.grid.width = 6;
    obj.edit6:setName("edit6");
    obj.edit6:setHeight(30);

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout4);
    obj.label9:setField("assimilacao");
    obj.label9:setHorzTextAlign("leading");
    obj.label9:setText("Assimilação");
    obj.label9.grid.role = "col";
    obj.label9.grid.width = 6;
    obj.label9:setName("label9");
    obj.label9:setHeight(30);

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9.grid.role = "col";
    obj.layout9.grid.width = 6;
    obj.layout9.grid["min-height"] = 600;
    obj.layout9:setName("layout9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout9);
    obj.label10:setText("INSTINTOS");
    obj.label10:setName("label10");
    obj.label10:setHeight(30);
    obj.label10:setMargins({top= 10});
    obj.label10:setFontSize(15);
    obj.label10:setHorzTextAlign("center");
    obj.label10.grid.role = "row";
    obj.label10.grid["min-height"] = 25;

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10.grid.role = "col";
    obj.layout10.grid.width = 4;
    obj.layout10:setMargins({bottom = 4});
    obj.layout10:setName("layout10");

    obj.edReacao = GUI.fromHandle(_obj_newObject("edit"));
    obj.edReacao:setParent(obj.layout10);
    obj.edReacao:setName("edReacao");
    obj.edReacao:setField("Instinto.Reacao");
    obj.edReacao.grid.role = "col";
    obj.edReacao.grid.width = 12;
    obj.edReacao:setHeight(30);

    obj.btnReacao = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnReacao:setParent(obj.layout10);
    obj.btnReacao:setName("btnReacao");
    obj.btnReacao:setText("Reação");
    obj.btnReacao:setGroupName("instintos");
    obj.btnReacao.grid.role = "col";
    obj.btnReacao.grid.width = 12;

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout9);
    obj.layout11.grid.role = "col";
    obj.layout11.grid.width = 4;
    obj.layout11:setMargins({bottom = 4});
    obj.layout11:setName("layout11");

    obj.edPercepcao = GUI.fromHandle(_obj_newObject("edit"));
    obj.edPercepcao:setParent(obj.layout11);
    obj.edPercepcao:setName("edPercepcao");
    obj.edPercepcao:setField("Instinto.Percepcao");
    obj.edPercepcao.grid.role = "col";
    obj.edPercepcao.grid.width = 12;
    obj.edPercepcao:setHeight(30);

    obj.btnPercepcao = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnPercepcao:setParent(obj.layout11);
    obj.btnPercepcao:setName("btnPercepcao");
    obj.btnPercepcao:setText("Percepção");
    obj.btnPercepcao:setGroupName("instintos");
    obj.btnPercepcao.grid.role = "col";
    obj.btnPercepcao.grid.width = 12;

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout9);
    obj.layout12.grid.role = "col";
    obj.layout12.grid.width = 4;
    obj.layout12:setMargins({bottom = 4});
    obj.layout12:setName("layout12");

    obj.edSagacidade = GUI.fromHandle(_obj_newObject("edit"));
    obj.edSagacidade:setParent(obj.layout12);
    obj.edSagacidade:setName("edSagacidade");
    obj.edSagacidade:setField("Instinto.Sagacidade");
    obj.edSagacidade.grid.role = "col";
    obj.edSagacidade.grid.width = 12;
    obj.edSagacidade:setHeight(30);

    obj.btnSagacidade = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnSagacidade:setParent(obj.layout12);
    obj.btnSagacidade:setName("btnSagacidade");
    obj.btnSagacidade:setText("Sagacidade");
    obj.btnSagacidade:setGroupName("instintos");
    obj.btnSagacidade.grid.role = "col";
    obj.btnSagacidade.grid.width = 12;

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout9);
    obj.layout13.grid.role = "col";
    obj.layout13.grid.width = 4;
    obj.layout13:setMargins({bottom = 4});
    obj.layout13:setName("layout13");

    obj.edPotencia = GUI.fromHandle(_obj_newObject("edit"));
    obj.edPotencia:setParent(obj.layout13);
    obj.edPotencia:setName("edPotencia");
    obj.edPotencia:setField("Instinto.Potencia");
    obj.edPotencia.grid.role = "col";
    obj.edPotencia.grid.width = 12;
    obj.edPotencia:setHeight(30);

    obj.btnPotencia = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnPotencia:setParent(obj.layout13);
    obj.btnPotencia:setName("btnPotencia");
    obj.btnPotencia:setText("Potência");
    obj.btnPotencia:setGroupName("instintos");
    obj.btnPotencia.grid.role = "col";
    obj.btnPotencia.grid.width = 12;

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout9);
    obj.layout14.grid.role = "col";
    obj.layout14.grid.width = 4;
    obj.layout14:setMargins({bottom = 4});
    obj.layout14:setName("layout14");

    obj.edInfluencia = GUI.fromHandle(_obj_newObject("edit"));
    obj.edInfluencia:setParent(obj.layout14);
    obj.edInfluencia:setName("edInfluencia");
    obj.edInfluencia:setField("Instinto.Influencia");
    obj.edInfluencia.grid.role = "col";
    obj.edInfluencia.grid.width = 12;
    obj.edInfluencia:setHeight(30);

    obj.btnInfluencia = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnInfluencia:setParent(obj.layout14);
    obj.btnInfluencia:setName("btnInfluencia");
    obj.btnInfluencia:setText("Influência");
    obj.btnInfluencia:setGroupName("instintos");
    obj.btnInfluencia.grid.role = "col";
    obj.btnInfluencia.grid.width = 12;

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout9);
    obj.layout15.grid.role = "col";
    obj.layout15.grid.width = 4;
    obj.layout15:setMargins({bottom = 4});
    obj.layout15:setName("layout15");

    obj.edResolucao = GUI.fromHandle(_obj_newObject("edit"));
    obj.edResolucao:setParent(obj.layout15);
    obj.edResolucao:setName("edResolucao");
    obj.edResolucao:setField("Instinto.Resolucao");
    obj.edResolucao.grid.role = "col";
    obj.edResolucao.grid.width = 12;
    obj.edResolucao:setHeight(30);

    obj.btnResolucao = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnResolucao:setParent(obj.layout15);
    obj.btnResolucao:setName("btnResolucao");
    obj.btnResolucao:setText("Resolução");
    obj.btnResolucao:setGroupName("instintos");
    obj.btnResolucao.grid.role = "col";
    obj.btnResolucao.grid.width = 12;

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout9);
    obj.label11:setText("CONHECIMENTOS");
    obj.label11:setName("label11");
    obj.label11:setHeight(30);
    obj.label11:setMargins({top= 10});
    obj.label11:setFontSize(15);
    obj.label11:setHorzTextAlign("center");
    obj.label11.grid.role = "row";
    obj.label11.grid["min-height"] = 25;

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout9);
    obj.layout16.grid.role = "col";
    obj.layout16.grid.width = 4;
    obj.layout16:setMargins({bottom = 4});
    obj.layout16:setName("layout16");

    obj.edAgrario = GUI.fromHandle(_obj_newObject("edit"));
    obj.edAgrario:setParent(obj.layout16);
    obj.edAgrario:setName("edAgrario");
    obj.edAgrario:setField("ConhecPrat.Agrario");
    obj.edAgrario.grid.role = "col";
    obj.edAgrario.grid.width = 12;
    obj.edAgrario:setHeight(30);

    obj.btnAgrario = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnAgrario:setParent(obj.layout16);
    obj.btnAgrario:setName("btnAgrario");
    obj.btnAgrario:setText("Agrário");
    obj.btnAgrario:setGroupName("conhecPrat");
    obj.btnAgrario.grid.role = "col";
    obj.btnAgrario.grid.width = 12;

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout9);
    obj.layout17.grid.role = "col";
    obj.layout17.grid.width = 4;
    obj.layout17:setMargins({bottom = 4});
    obj.layout17:setName("layout17");

    obj.edBiologico = GUI.fromHandle(_obj_newObject("edit"));
    obj.edBiologico:setParent(obj.layout17);
    obj.edBiologico:setName("edBiologico");
    obj.edBiologico:setField("ConhecPrat.Biologico");
    obj.edBiologico.grid.role = "col";
    obj.edBiologico.grid.width = 12;
    obj.edBiologico:setHeight(30);

    obj.btnBiologico = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnBiologico:setParent(obj.layout17);
    obj.btnBiologico:setName("btnBiologico");
    obj.btnBiologico:setText("Biológico");
    obj.btnBiologico:setGroupName("conhecPrat");
    obj.btnBiologico.grid.role = "col";
    obj.btnBiologico.grid.width = 12;

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout9);
    obj.layout18.grid.role = "col";
    obj.layout18.grid.width = 4;
    obj.layout18:setMargins({bottom = 4});
    obj.layout18:setName("layout18");

    obj.edExato = GUI.fromHandle(_obj_newObject("edit"));
    obj.edExato:setParent(obj.layout18);
    obj.edExato:setName("edExato");
    obj.edExato:setField("ConhecPrat.Exato");
    obj.edExato.grid.role = "col";
    obj.edExato.grid.width = 12;
    obj.edExato:setHeight(30);

    obj.btnExato = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnExato:setParent(obj.layout18);
    obj.btnExato:setName("btnExato");
    obj.btnExato:setText("Exato");
    obj.btnExato:setGroupName("conhecPrat");
    obj.btnExato.grid.role = "col";
    obj.btnExato.grid.width = 12;

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout9);
    obj.layout19.grid.role = "col";
    obj.layout19.grid.width = 4;
    obj.layout19:setMargins({bottom = 4});
    obj.layout19:setName("layout19");

    obj.edMedicina = GUI.fromHandle(_obj_newObject("edit"));
    obj.edMedicina:setParent(obj.layout19);
    obj.edMedicina:setName("edMedicina");
    obj.edMedicina:setField("ConhecPrat.Medicina");
    obj.edMedicina.grid.role = "col";
    obj.edMedicina.grid.width = 12;
    obj.edMedicina:setHeight(30);

    obj.btnMedicina = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnMedicina:setParent(obj.layout19);
    obj.btnMedicina:setName("btnMedicina");
    obj.btnMedicina:setText("Medicina");
    obj.btnMedicina:setGroupName("conhecPrat");
    obj.btnMedicina.grid.role = "col";
    obj.btnMedicina.grid.width = 12;

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout9);
    obj.layout20.grid.role = "col";
    obj.layout20.grid.width = 4;
    obj.layout20:setMargins({bottom = 4});
    obj.layout20:setName("layout20");

    obj.edSocial = GUI.fromHandle(_obj_newObject("edit"));
    obj.edSocial:setParent(obj.layout20);
    obj.edSocial:setName("edSocial");
    obj.edSocial:setField("ConhecPrat.Social");
    obj.edSocial.grid.role = "col";
    obj.edSocial.grid.width = 12;
    obj.edSocial:setHeight(30);

    obj.btnSocial = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnSocial:setParent(obj.layout20);
    obj.btnSocial:setName("btnSocial");
    obj.btnSocial:setText("Social");
    obj.btnSocial:setGroupName("conhecPrat");
    obj.btnSocial.grid.role = "col";
    obj.btnSocial.grid.width = 12;

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout9);
    obj.layout21.grid.role = "col";
    obj.layout21.grid.width = 4;
    obj.layout21:setMargins({bottom = 4});
    obj.layout21:setName("layout21");

    obj.edArtistico = GUI.fromHandle(_obj_newObject("edit"));
    obj.edArtistico:setParent(obj.layout21);
    obj.edArtistico:setName("edArtistico");
    obj.edArtistico:setField("ConhecPrat.Artistico");
    obj.edArtistico.grid.role = "col";
    obj.edArtistico.grid.width = 12;
    obj.edArtistico:setHeight(30);

    obj.btnArtistico = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnArtistico:setParent(obj.layout21);
    obj.btnArtistico:setName("btnArtistico");
    obj.btnArtistico:setText("Artístico");
    obj.btnArtistico:setGroupName("conhecPrat");
    obj.btnArtistico.grid.role = "col";
    obj.btnArtistico.grid.width = 12;

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout9);
    obj.label12:setText("CONHECIMENTOS");
    obj.label12:setName("label12");
    obj.label12:setHeight(30);
    obj.label12:setMargins({top= 10});
    obj.label12:setFontSize(15);
    obj.label12:setHorzTextAlign("center");
    obj.label12.grid.role = "row";
    obj.label12.grid["min-height"] = 25;

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout9);
    obj.layout22.grid.role = "col";
    obj.layout22.grid.width = 4;
    obj.layout22:setMargins({bottom = 4});
    obj.layout22:setName("layout22");

    obj.edEsportivas = GUI.fromHandle(_obj_newObject("edit"));
    obj.edEsportivas:setParent(obj.layout22);
    obj.edEsportivas:setName("edEsportivas");
    obj.edEsportivas:setField("ConhecPrat.Esportivas");
    obj.edEsportivas.grid.role = "col";
    obj.edEsportivas.grid.width = 12;
    obj.edEsportivas:setHeight(30);

    obj.btnEsportivas = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnEsportivas:setParent(obj.layout22);
    obj.btnEsportivas:setName("btnEsportivas");
    obj.btnEsportivas:setText("Esportivas");
    obj.btnEsportivas:setGroupName("conhecPrat");
    obj.btnEsportivas.grid.role = "col";
    obj.btnEsportivas.grid.width = 12;

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout9);
    obj.layout23.grid.role = "col";
    obj.layout23.grid.width = 4;
    obj.layout23:setMargins({bottom = 4});
    obj.layout23:setName("layout23");

    obj.edFerramentas = GUI.fromHandle(_obj_newObject("edit"));
    obj.edFerramentas:setParent(obj.layout23);
    obj.edFerramentas:setName("edFerramentas");
    obj.edFerramentas:setField("ConhecPrat.Ferramentas");
    obj.edFerramentas.grid.role = "col";
    obj.edFerramentas.grid.width = 12;
    obj.edFerramentas:setHeight(30);

    obj.btnFerramentas = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnFerramentas:setParent(obj.layout23);
    obj.btnFerramentas:setName("btnFerramentas");
    obj.btnFerramentas:setText("Ferramentas");
    obj.btnFerramentas:setGroupName("conhecPrat");
    obj.btnFerramentas.grid.role = "col";
    obj.btnFerramentas.grid.width = 12;

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout9);
    obj.layout24.grid.role = "col";
    obj.layout24.grid.width = 4;
    obj.layout24:setMargins({bottom = 4});
    obj.layout24:setName("layout24");

    obj.edOficios = GUI.fromHandle(_obj_newObject("edit"));
    obj.edOficios:setParent(obj.layout24);
    obj.edOficios:setName("edOficios");
    obj.edOficios:setField("ConhecPrat.Oficios");
    obj.edOficios.grid.role = "col";
    obj.edOficios.grid.width = 12;
    obj.edOficios:setHeight(30);

    obj.btnOficios = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnOficios:setParent(obj.layout24);
    obj.btnOficios:setName("btnOficios");
    obj.btnOficios:setText("Ofícios");
    obj.btnOficios:setGroupName("conhecPrat");
    obj.btnOficios.grid.role = "col";
    obj.btnOficios.grid.width = 12;

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout9);
    obj.layout25.grid.role = "col";
    obj.layout25.grid.width = 4;
    obj.layout25:setMargins({bottom = 4});
    obj.layout25:setName("layout25");

    obj.edArmas = GUI.fromHandle(_obj_newObject("edit"));
    obj.edArmas:setParent(obj.layout25);
    obj.edArmas:setName("edArmas");
    obj.edArmas:setField("ConhecPrat.Armas");
    obj.edArmas.grid.role = "col";
    obj.edArmas.grid.width = 12;
    obj.edArmas:setHeight(30);

    obj.btnArmas = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnArmas:setParent(obj.layout25);
    obj.btnArmas:setName("btnArmas");
    obj.btnArmas:setText("Armas");
    obj.btnArmas:setGroupName("conhecPrat");
    obj.btnArmas.grid.role = "col";
    obj.btnArmas.grid.width = 12;

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout9);
    obj.layout26.grid.role = "col";
    obj.layout26.grid.width = 4;
    obj.layout26:setMargins({bottom = 4});
    obj.layout26:setName("layout26");

    obj.edVeiculos = GUI.fromHandle(_obj_newObject("edit"));
    obj.edVeiculos:setParent(obj.layout26);
    obj.edVeiculos:setName("edVeiculos");
    obj.edVeiculos:setField("ConhecPrat.Veiculos");
    obj.edVeiculos.grid.role = "col";
    obj.edVeiculos.grid.width = 12;
    obj.edVeiculos:setHeight(30);

    obj.btnVeiculos = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnVeiculos:setParent(obj.layout26);
    obj.btnVeiculos:setName("btnVeiculos");
    obj.btnVeiculos:setText("Veículos");
    obj.btnVeiculos:setGroupName("conhecPrat");
    obj.btnVeiculos.grid.role = "col";
    obj.btnVeiculos.grid.width = 12;

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout9);
    obj.layout27.grid.role = "col";
    obj.layout27.grid.width = 4;
    obj.layout27:setMargins({bottom = 4});
    obj.layout27:setName("layout27");

    obj.edInfiltracao = GUI.fromHandle(_obj_newObject("edit"));
    obj.edInfiltracao:setParent(obj.layout27);
    obj.edInfiltracao:setName("edInfiltracao");
    obj.edInfiltracao:setField("ConhecPrat.Infiltracao");
    obj.edInfiltracao.grid.role = "col";
    obj.edInfiltracao.grid.width = 12;
    obj.edInfiltracao:setHeight(30);

    obj.btnInfiltracao = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.btnInfiltracao:setParent(obj.layout27);
    obj.btnInfiltracao:setName("btnInfiltracao");
    obj.btnInfiltracao:setText("Infiltração");
    obj.btnInfiltracao:setGroupName("conhecPrat");
    obj.btnInfiltracao.grid.role = "col";
    obj.btnInfiltracao.grid.width = 12;

    obj.chkaAgirPorInstinto = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.chkaAgirPorInstinto:setParent(obj.layout9);
    obj.chkaAgirPorInstinto:setName("chkaAgirPorInstinto");
    obj.chkaAgirPorInstinto:setText("Agir por Instinto");
    obj.chkaAgirPorInstinto:setField("agirPorInstinto");
    obj.chkaAgirPorInstinto.grid.role = "col";
    obj.chkaAgirPorInstinto.grid.width = 12;
    obj.chkaAgirPorInstinto:setHeight(30);
    obj.chkaAgirPorInstinto:setMargins({top=2, bottom= 2});

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout9);
    obj.button1.grid.role = "row";
    obj.button1.grid["min-height"] = 60;
    obj.button1:setText("rolar");
    obj.button1:setName("button1");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle1);
    obj.layout28.grid.role = "col";
    obj.layout28.grid.width = 6;
    obj.layout28.grid["min-height"] = 500;
    obj.layout28:setName("layout28");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout28);
    obj.label13:setText("SAÚDE");
    obj.label13:setName("label13");
    obj.label13:setHeight(30);
    obj.label13:setMargins({top= 10});
    obj.label13:setFontSize(15);
    obj.label13:setHorzTextAlign("center");
    obj.label13.grid.role = "row";
    obj.label13.grid["min-height"] = 25;

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout28);
    obj.label14:setText("5 - Infectado Saudavel");
    obj.label14.grid.role = "col";
    obj.label14.grid.width = 6;
    obj.label14:setName("label14");
    obj.label14:setHeight(30);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout28);
    obj.label15:setText("4 - Infectado Saudavel");
    obj.label15.grid.role = "col";
    obj.label15.grid.width = 6;
    obj.label15:setName("label15");
    obj.label15:setHeight(30);

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout28);
    obj.edit7:setField("saude5");
    obj.edit7.grid.role = "col";
    obj.edit7.grid.width = 6;
    obj.edit7:setName("edit7");
    obj.edit7:setHeight(30);

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout28);
    obj.edit8:setField("saude4");
    obj.edit8.grid.role = "col";
    obj.edit8.grid.width = 6;
    obj.edit8:setName("edit8");
    obj.edit8:setHeight(30);

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout28);
    obj.label16:setText("3 - Infectado -1 sucesso ou adaptacao");
    obj.label16.grid.role = "col";
    obj.label16.grid.width = 6;
    obj.label16:setName("label16");
    obj.label16:setHeight(30);

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout28);
    obj.label17:setText("2 - Infectado -1 sucesso");
    obj.label17.grid.role = "col";
    obj.label17.grid.width = 6;
    obj.label17:setName("label17");
    obj.label17:setHeight(30);

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout28);
    obj.edit9:setField("saude3");
    obj.edit9.grid.role = "col";
    obj.edit9.grid.width = 6;
    obj.edit9:setName("edit9");
    obj.edit9:setHeight(30);

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout28);
    obj.edit10:setField("saude2");
    obj.edit10.grid.role = "col";
    obj.edit10.grid.width = 6;
    obj.edit10:setName("edit10");
    obj.edit10:setHeight(30);

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout28);
    obj.label18:setText("1 - Infectado -2 sucessos");
    obj.label18.grid.role = "col";
    obj.label18.grid.width = 6;
    obj.label18:setName("label18");
    obj.label18:setHeight(30);

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout28);
    obj.label19:setText("o - Infectado Morto");
    obj.label19.grid.role = "col";
    obj.label19.grid.width = 6;
    obj.label19:setName("label19");
    obj.label19:setHeight(30);

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout28);
    obj.edit11:setField("saude1");
    obj.edit11.grid.role = "col";
    obj.edit11.grid.width = 6;
    obj.edit11:setName("edit11");
    obj.edit11:setHeight(30);

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout28);
    obj.edit12:setField("saude0");
    obj.edit12.grid.role = "col";
    obj.edit12.grid.width = 6;
    obj.edit12:setName("edit12");
    obj.edit12:setHeight(30);

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout28);
    obj.label20:setText("CARACTERÍSTICAS E EQUIPAMENTOS");
    obj.label20:setName("label20");
    obj.label20:setHeight(30);
    obj.label20:setMargins({top= 10});
    obj.label20:setFontSize(15);
    obj.label20:setHorzTextAlign("center");
    obj.label20.grid.role = "row";
    obj.label20.grid["min-height"] = 25;

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout28);
    obj.textEditor3:setField("caracteristicas");
    obj.textEditor3.grid.role = "col";
    obj.textEditor3.grid.width = 12;
    obj.textEditor3.grid["min-height"] = 300;
    obj.textEditor3:setHorzTextAlign("leading");
    obj.textEditor3:setName("textEditor3");

    obj._e_event0 = obj.btnReacao:addEventListener("onClick",
        function (event)
            if sheet.Instinto.Reacao ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valInstinto = sheet.Instinto.Reacao; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentInstinto = "Reação"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valInstinto = 0;
            							sheet.currentInstinto = ""
            						end;
        end);

    obj._e_event1 = obj.btnPercepcao:addEventListener("onClick",
        function (event)
            if sheet.Instinto.Percepcao ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valInstinto = sheet.Instinto.Percepcao; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentInstinto = "Percepção"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valInstinto = 0;
            							sheet.currentInstinto = ""
            						end;
        end);

    obj._e_event2 = obj.btnSagacidade:addEventListener("onClick",
        function (event)
            if sheet.Instinto.Sagacidade ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valInstinto = sheet.Instinto.Sagacidade; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentInstinto = "Sagacidade"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valInstinto = 0;
            							sheet.currentInstinto = ""
            						end;
        end);

    obj._e_event3 = obj.btnPotencia:addEventListener("onClick",
        function (event)
            if sheet.Instinto.Potencia ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valInstinto = sheet.Instinto.Potencia; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentInstinto = "Potência"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valInstinto = 0;
            							sheet.currentInstinto = ""
            						end;
        end);

    obj._e_event4 = obj.btnInfluencia:addEventListener("onClick",
        function (event)
            if sheet.Instinto.Influencia ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valInstinto = sheet.Instinto.Influencia; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentInstinto = "Influência"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valInstinto = 0;
            							sheet.currentInstinto = ""
            						end;
        end);

    obj._e_event5 = obj.btnResolucao:addEventListener("onClick",
        function (event)
            if sheet.Instinto.Resolucao ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valInstinto = sheet.Instinto.Resolucao; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentInstinto = "Resolução"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valInstinto = 0;
            							sheet.currentInstinto = ""
            						end;
        end);

    obj._e_event6 = obj.btnAgrario:addEventListener("onClick",
        function (event)
            if sheet.ConhecPrat.Agrario ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valConhecPrat = sheet.ConhecPrat.Agrario; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentConhecPrat = "Agrário"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valConhecPrat = 0;
            							sheet.currentConhecPrat = ""
            						end;
        end);

    obj._e_event7 = obj.btnBiologico:addEventListener("onClick",
        function (event)
            if sheet.ConhecPrat.Biologico ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valConhecPrat = sheet.ConhecPrat.Biologico; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentConhecPrat = "Biológico"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valConhecPrat = 0;
            							sheet.currentConhecPrat = ""
            						end;
        end);

    obj._e_event8 = obj.btnExato:addEventListener("onClick",
        function (event)
            if sheet.ConhecPrat.Exato ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valConhecPrat = sheet.ConhecPrat.Exato; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentConhecPrat = "Exato"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valConhecPrat = 0;
            							sheet.currentConhecPrat = ""
            						end;
        end);

    obj._e_event9 = obj.btnMedicina:addEventListener("onClick",
        function (event)
            if sheet.ConhecPrat.Medicina ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valConhecPrat = sheet.ConhecPrat.Medicina; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentConhecPrat = "Medicina"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valConhecPrat = 0;
            							sheet.currentConhecPrat = ""
            						end;
        end);

    obj._e_event10 = obj.btnSocial:addEventListener("onClick",
        function (event)
            if sheet.ConhecPrat.Social ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valConhecPrat = sheet.ConhecPrat.Social; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentConhecPrat = "Social"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valConhecPrat = 0;
            							sheet.currentConhecPrat = ""
            						end;
        end);

    obj._e_event11 = obj.btnArtistico:addEventListener("onClick",
        function (event)
            if sheet.ConhecPrat.Artistico ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valConhecPrat = sheet.ConhecPrat.Artistico; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentConhecPrat = "Artístico"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valConhecPrat = 0;
            							sheet.currentConhecPrat = ""
            						end;
        end);

    obj._e_event12 = obj.btnEsportivas:addEventListener("onClick",
        function (event)
            if sheet.ConhecPrat.Esportivas ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valConhecPrat = sheet.ConhecPrat.Esportivas; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentConhecPrat = "Esportivas"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valConhecPrat = 0;
            							sheet.currentConhecPrat = ""
            						end;
        end);

    obj._e_event13 = obj.btnFerramentas:addEventListener("onClick",
        function (event)
            if sheet.ConhecPrat.Ferramentas ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valConhecPrat = sheet.ConhecPrat.Ferramentas; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentConhecPrat = "Ferramentas"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valConhecPrat = 0;
            							sheet.currentConhecPrat = ""
            						end;
        end);

    obj._e_event14 = obj.btnOficios:addEventListener("onClick",
        function (event)
            if sheet.ConhecPrat.Oficios ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valConhecPrat = sheet.ConhecPrat.Oficios; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentConhecPrat = "Ofícios"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valConhecPrat = 0;
            							sheet.currentConhecPrat = ""
            						end;
        end);

    obj._e_event15 = obj.btnArmas:addEventListener("onClick",
        function (event)
            if sheet.ConhecPrat.Armas ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valConhecPrat = sheet.ConhecPrat.Armas; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentConhecPrat = "Armas"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valConhecPrat = 0;
            							sheet.currentConhecPrat = ""
            						end;
        end);

    obj._e_event16 = obj.btnVeiculos:addEventListener("onClick",
        function (event)
            if sheet.ConhecPrat.Veiculos ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valConhecPrat = sheet.ConhecPrat.Veiculos; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentConhecPrat = "Veículos"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valConhecPrat = 0;
            							sheet.currentConhecPrat = ""
            						end;
        end);

    obj._e_event17 = obj.btnInfiltracao:addEventListener("onClick",
        function (event)
            if sheet.ConhecPrat.Infiltracao ~= nil then -- a ideia era resetar o valor do campo, nao esta funcionando
            							sheet.valConhecPrat = sheet.ConhecPrat.Infiltracao; -- "sheet.valInstinto = sheet.Instinto.Percepcao" por exemplo. pega o valor do edit
            							sheet.currentConhecPrat = "Infiltração"; -- "sheet.currentInstinto = 'Percepção", pra exibir na jogada de
            						else
            							sheet.valConhecPrat = 0;
            							sheet.currentConhecPrat = ""
            						end;
        end);

    obj._e_event18 = obj.button1:addEventListener("onClick",
        function (event)
            lancar_dados();
        end);

    function obj:_releaseEvents()
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

        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edPercepcao ~= nil then self.edPercepcao:destroy(); self.edPercepcao = nil; end;
        if self.edPotencia ~= nil then self.edPotencia:destroy(); self.edPotencia = nil; end;
        if self.edVeiculos ~= nil then self.edVeiculos:destroy(); self.edVeiculos = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.btnExato ~= nil then self.btnExato:destroy(); self.btnExato = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.btnPotencia ~= nil then self.btnPotencia:destroy(); self.btnPotencia = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edBiologico ~= nil then self.edBiologico:destroy(); self.edBiologico = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.btnInfiltracao ~= nil then self.btnInfiltracao:destroy(); self.btnInfiltracao = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edArmas ~= nil then self.edArmas:destroy(); self.edArmas = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edInfiltracao ~= nil then self.edInfiltracao:destroy(); self.edInfiltracao = nil; end;
        if self.edResolucao ~= nil then self.edResolucao:destroy(); self.edResolucao = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.btnEsportivas ~= nil then self.btnEsportivas:destroy(); self.btnEsportivas = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.btnBiologico ~= nil then self.btnBiologico:destroy(); self.btnBiologico = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edEsportivas ~= nil then self.edEsportivas:destroy(); self.edEsportivas = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edInfluencia ~= nil then self.edInfluencia:destroy(); self.edInfluencia = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.btnResolucao ~= nil then self.btnResolucao:destroy(); self.btnResolucao = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.edSocial ~= nil then self.edSocial:destroy(); self.edSocial = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.btnReacao ~= nil then self.btnReacao:destroy(); self.btnReacao = nil; end;
        if self.edArtistico ~= nil then self.edArtistico:destroy(); self.edArtistico = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edSagacidade ~= nil then self.edSagacidade:destroy(); self.edSagacidade = nil; end;
        if self.btnInfluencia ~= nil then self.btnInfluencia:destroy(); self.btnInfluencia = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.btnMedicina ~= nil then self.btnMedicina:destroy(); self.btnMedicina = nil; end;
        if self.btnSocial ~= nil then self.btnSocial:destroy(); self.btnSocial = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.btnArtistico ~= nil then self.btnArtistico:destroy(); self.btnArtistico = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edMedicina ~= nil then self.edMedicina:destroy(); self.edMedicina = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.btnPercepcao ~= nil then self.btnPercepcao:destroy(); self.btnPercepcao = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edReacao ~= nil then self.edReacao:destroy(); self.edReacao = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.chkaAgirPorInstinto ~= nil then self.chkaAgirPorInstinto:destroy(); self.chkaAgirPorInstinto = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.btnOficios ~= nil then self.btnOficios:destroy(); self.btnOficios = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edOficios ~= nil then self.edOficios:destroy(); self.edOficios = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.btnVeiculos ~= nil then self.btnVeiculos:destroy(); self.btnVeiculos = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.btnSagacidade ~= nil then self.btnSagacidade:destroy(); self.btnSagacidade = nil; end;
        if self.btnArmas ~= nil then self.btnArmas:destroy(); self.btnArmas = nil; end;
        if self.edExato ~= nil then self.edExato:destroy(); self.edExato = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.btnAgrario ~= nil then self.btnAgrario:destroy(); self.btnAgrario = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edAgrario ~= nil then self.edAgrario:destroy(); self.edAgrario = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.btnFerramentas ~= nil then self.btnFerramentas:destroy(); self.btnFerramentas = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.edFerramentas ~= nil then self.edFerramentas:destroy(); self.edFerramentas = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
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
