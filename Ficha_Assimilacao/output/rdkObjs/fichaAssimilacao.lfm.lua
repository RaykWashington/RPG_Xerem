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

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setText("NOME:");
    obj.label1.grid.role = "col";
    obj.label1.grid.width = 2;
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 10;
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setText("Geração:");
    obj.label2.grid.role = "col";
    obj.label2.grid.width = 2;
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2.grid.role = "col";
    obj.edit2.grid.width = 10;
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setText("Evento Marcante:");
    obj.label3.grid.role = "col";
    obj.label3.grid.width = 2;
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3.grid.role = "col";
    obj.edit3.grid.width = 10;
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setText("Posição Social:");
    obj.label4.grid.role = "col";
    obj.label4.grid.width = 2;
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4.grid.role = "col";
    obj.edit4.grid.width = 10;
    obj.edit4:setName("edit4");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1.grid.role = "col";
    obj.layout1.grid.width = 6;
    obj.layout1.grid["min-height"] = 600;
    obj.layout1:setName("layout1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("PROPOSITOS");
    obj.label5.grid.role = "col";
    obj.label5.grid.width = 12;
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setText("Individuais:");
    obj.label6.grid.role = "row";
    obj.label6.grid["min-height"] = 60;
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5.grid.role = "row";
    obj.edit5.grid["min-height"] = 60;
    obj.edit5:setName("edit5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setText("Relacionais:");
    obj.label7.grid.role = "row";
    obj.label7.grid["min-height"] = 60;
    obj.label7:setName("label7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6.grid.role = "row";
    obj.edit6.grid["min-height"] = 60;
    obj.edit6:setName("edit6");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2.grid.role = "col";
    obj.layout2.grid.width = 6;
    obj.layout2.grid["min-height"] = 600;
    obj.layout2:setName("layout2");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setText("Determinacao");
    obj.label8.grid.role = "col";
    obj.label8.grid.width = 6;
    obj.label8:setName("label8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout2);
    obj.edit7.grid.role = "col";
    obj.edit7.grid.width = 6;
    obj.edit7:setName("edit7");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3.grid.role = "col";
    obj.layout3.grid.width = 1;
    obj.layout3:setName("layout3");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout2);
    obj.checkBox1:setField("dterm1");
    obj.checkBox1.grid.role = "col";
    obj.checkBox1.grid.width = 1;
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout2);
    obj.checkBox2:setField("dterm2");
    obj.checkBox2.grid.role = "col";
    obj.checkBox2.grid.width = 1;
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout2);
    obj.checkBox3:setField("dterm3");
    obj.checkBox3.grid.role = "col";
    obj.checkBox3.grid.width = 1;
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout2);
    obj.checkBox4:setField("dterm4");
    obj.checkBox4.grid.role = "col";
    obj.checkBox4.grid.width = 1;
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout2);
    obj.checkBox5:setField("dterm5");
    obj.checkBox5.grid.role = "col";
    obj.checkBox5.grid.width = 1;
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout2);
    obj.checkBox6:setField("dterm6");
    obj.checkBox6.grid.role = "col";
    obj.checkBox6.grid.width = 1;
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout2);
    obj.checkBox7:setField("dterm7");
    obj.checkBox7.grid.role = "col";
    obj.checkBox7.grid.width = 1;
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout2);
    obj.checkBox8:setField("dterm8");
    obj.checkBox8.grid.role = "col";
    obj.checkBox8.grid.width = 1;
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout2);
    obj.checkBox9:setField("dterm9");
    obj.checkBox9.grid.role = "col";
    obj.checkBox9.grid.width = 1;
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout2);
    obj.checkBox10:setField("dterm10");
    obj.checkBox10.grid.role = "col";
    obj.checkBox10.grid.width = 1;
    obj.checkBox10:setName("checkBox10");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4.grid.role = "col";
    obj.layout4.grid.width = 1;
    obj.layout4:setName("layout4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5.grid.role = "col";
    obj.layout5.grid.width = 1;
    obj.layout5:setName("layout5");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout2);
    obj.checkBox11:setField("assim1");
    obj.checkBox11.grid.role = "col";
    obj.checkBox11.grid.width = 1;
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout2);
    obj.checkBox12:setField("assim2");
    obj.checkBox12.grid.role = "col";
    obj.checkBox12.grid.width = 1;
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout2);
    obj.checkBox13:setField("assim3");
    obj.checkBox13.grid.role = "col";
    obj.checkBox13.grid.width = 1;
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout2);
    obj.checkBox14:setField("assim4");
    obj.checkBox14.grid.role = "col";
    obj.checkBox14.grid.width = 1;
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout2);
    obj.checkBox15:setField("assim5");
    obj.checkBox15.grid.role = "col";
    obj.checkBox15.grid.width = 1;
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout2);
    obj.checkBox16:setField("assim6");
    obj.checkBox16.grid.role = "col";
    obj.checkBox16.grid.width = 1;
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout2);
    obj.checkBox17:setField("assim7");
    obj.checkBox17.grid.role = "col";
    obj.checkBox17.grid.width = 1;
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout2);
    obj.checkBox18:setField("assim8");
    obj.checkBox18.grid.role = "col";
    obj.checkBox18.grid.width = 1;
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout2);
    obj.checkBox19:setField("assim9");
    obj.checkBox19.grid.role = "col";
    obj.checkBox19.grid.width = 1;
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout2);
    obj.checkBox20:setField("assim10");
    obj.checkBox20.grid.role = "col";
    obj.checkBox20.grid.width = 1;
    obj.checkBox20:setName("checkBox20");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout2);
    obj.layout6.grid.role = "col";
    obj.layout6.grid.width = 1;
    obj.layout6:setName("layout6");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout2);
    obj.edit8.grid.role = "col";
    obj.edit8.grid.width = 6;
    obj.edit8:setName("edit8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setHorzTextAlign("leading");
    obj.label9:setText("Determinacao");
    obj.label9.grid.role = "col";
    obj.label9.grid.width = 6;
    obj.label9:setName("label9");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
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
