require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmXeremGenerica()
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
    obj:setDataType("xeremFichaGenerica");
    obj:setTitle("Xerem Ficha Genérica");
    obj:setName("frmXeremGenerica");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Aba 1");
    obj.tab1:setName("tab1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.tab1);
    obj.layout1:setLeft(20);
    obj.layout1:setTop(40);
    obj.layout1:setWidth(400);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setText("Campo1");
    obj.label1:setName("label1");
    obj.label1:setHorzTextAlign("center");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("left");
    obj.edit1:setTextPrompt("valor1 (int ou dados)");
    obj.edit1:setField("valor1");
    obj.edit1:setName("edit1");
    obj.edit1:setHorzTextAlign("center");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setAlign("left");
    obj.edit2:setTextPrompt("valor2 (int)");
    obj.edit2:setType("number");
    obj.edit2:setField("valor2");
    obj.edit2:setName("edit2");
    obj.edit2:setHorzTextAlign("center");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("right");
    obj.button1:setText("Botão 1");
    obj.button1:setName("button1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Aba 2");
    obj.tab2:setName("tab2");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.tab2);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setOrientation("horizontal");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.flowLayout1);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setName("flowLayout2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout2);
    obj.button2:setText("1");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowLayout2);
    obj.button3:setText("1");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowLayout2);
    obj.button4:setText("1");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.flowLayout2);
    obj.button5:setText("1");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.flowLayout2);
    obj.button6:setText("1");
    obj.button6:setName("button6");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.flowLayout1);
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setName("flowLayout3");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.flowLayout3);
    obj.button7:setText("1");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.flowLayout3);
    obj.button8:setText("1");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.flowLayout3);
    obj.button9:setText("1");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.flowLayout3);
    obj.button10:setText("1");
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.flowLayout3);
    obj.button11:setText("1");
    obj.button11:setName("button11");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Aba3");
    obj.tab3:setName("tab3");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            local rolagem = Firecast.interpretarRolagem(sheet.valor1);
            						rolagem = rolagem:concatenar(sheet.valor2);
            						local mesa = Firecast.getMesaDe(sheet);
            						mesa.chat:rolarDados(rolagem, " Rolagem de Campo 1");
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

        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmXeremGenerica()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmXeremGenerica();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmXeremGenerica = {
    newEditor = newfrmXeremGenerica, 
    new = newfrmXeremGenerica, 
    name = "frmXeremGenerica", 
    dataType = "xeremFichaGenerica", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Xerem Ficha Genérica", 
    description=""};

frmXeremGenerica = _frmXeremGenerica;
Firecast.registrarForm(_frmXeremGenerica);
Firecast.registrarDataType(_frmXeremGenerica);

return _frmXeremGenerica;
