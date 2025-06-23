require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmItemArmaRanged()
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
    obj:setName("frmItemArmaRanged");
    obj.grid["auto-height"] = true;
    obj.grid["padding-top"] = 8;
    obj.grid["cnt-line-spacing"] = 4;

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setText("-");
    obj.button1.grid.role = "col";
    obj.button1.grid.width = 1;
    obj.button1:setName("button1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setField("$(nomeArma)");
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 3;
    obj.edit1:setName("edit1");
    obj.edit1:setTransparent(true);
    obj.edit1:setHeight(25);

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setField("notas_$(nomeArma)");
    obj.edit2.grid.role = "col";
    obj.edit2.grid.width = 3;
    obj.edit2:setName("edit2");
    obj.edit2:setTransparent(true);
    obj.edit2:setHeight(25);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1.grid.role = "col";
    obj.rectangle1.grid.width = 1;
    obj.rectangle1.grid["auto-height"] = true;
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1.grid["max-height"] = 35;
    lfm_setPropAsString(obj.rectangle1, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setStrokeColor("#343434");
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setColor("#1f1e1e");
    obj.rectangle1.grid["padding-top"] = 5;
    obj.rectangle1.grid["padding-left"] = 8;
    obj.rectangle1.grid["padding-right"] = 8;
    obj.rectangle1.grid["padding-bottom"] = 5;

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setField("ACL_$(nomeArma)");
    obj.edit3.grid.role = "col";
    obj.edit3.grid.width = 12;
    obj.edit3:setType("number");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");
    obj.edit3:setTransparent(true);
    obj.edit3:setHeight(25);

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2.grid.role = "col";
    obj.rectangle2.grid.width = 1;
    obj.rectangle2.grid["auto-height"] = true;
    obj.rectangle2:setName("rectangle2");
    obj.rectangle2.grid["max-height"] = 35;
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
    obj.rectangle2.grid["padding-bottom"] = 5;

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle2);
    obj.edit4:setField("ADI_$(nomeArma)");
    obj.edit4.grid.role = "col";
    obj.edit4.grid.width = 12;
    obj.edit4:setType("number");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");
    obj.edit4:setTransparent(true);
    obj.edit4:setHeight(25);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj);
    obj.rectangle3.grid.role = "col";
    obj.rectangle3.grid.width = 1;
    obj.rectangle3.grid["auto-height"] = true;
    obj.rectangle3:setName("rectangle3");
    obj.rectangle3.grid["max-height"] = 35;
    lfm_setPropAsString(obj.rectangle3, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setXradius(15);
    obj.rectangle3:setYradius(15);
    obj.rectangle3:setStrokeColor("#343434");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3:setColor("#1f1e1e");
    obj.rectangle3.grid["padding-top"] = 5;
    obj.rectangle3.grid["padding-left"] = 8;
    obj.rectangle3.grid["padding-right"] = 8;
    obj.rectangle3.grid["padding-bottom"] = 5;

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle3);
    obj.edit5:setField("POD_$(nomeArma)");
    obj.edit5.grid.role = "col";
    obj.edit5.grid.width = 12;
    obj.edit5:setType("number");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");
    obj.edit5:setTransparent(true);
    obj.edit5:setHeight(25);

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj);
    obj.rectangle4.grid.role = "col";
    obj.rectangle4.grid.width = 1;
    obj.rectangle4.grid["auto-height"] = true;
    obj.rectangle4:setName("rectangle4");
    obj.rectangle4.grid["max-height"] = 35;
    lfm_setPropAsString(obj.rectangle4, "corners", "topRight bottomRight bottomLeft");
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setXradius(15);
    obj.rectangle4:setYradius(15);
    obj.rectangle4:setStrokeColor("#343434");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setColor("#1f1e1e");
    obj.rectangle4.grid["padding-top"] = 5;
    obj.rectangle4.grid["padding-left"] = 8;
    obj.rectangle4.grid["padding-right"] = 8;
    obj.rectangle4.grid["padding-bottom"] = 5;

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle4);
    obj.edit6:setField("MUN_$(nomeArma)");
    obj.edit6.grid.role = "col";
    obj.edit6.grid.width = 12;
    obj.edit6:setType("number");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");
    obj.edit6:setTransparent(true);
    obj.edit6:setHeight(25);

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj);
    obj.checkBox1.grid.role = "col";
    obj.checkBox1.grid.width = 1;
    obj.checkBox1:setName("checkBox1");
    obj.checkBox1:setScale(1.2);
    obj.checkBox1.grid["vert-align"] = "middle";

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj);
    obj.horzLine1.grid.role = "row";
    obj.horzLine1.grid.width = 12;
    obj.horzLine1:setName("horzLine1");
    obj.horzLine1:setStrokeColor("grey");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
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

        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmItemArmaRanged()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmItemArmaRanged();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmItemArmaRanged = {
    newEditor = newfrmItemArmaRanged, 
    new = newfrmItemArmaRanged, 
    name = "frmItemArmaRanged", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmItemArmaRanged = _frmItemArmaRanged;
Firecast.registrarForm(_frmItemArmaRanged);

return _frmItemArmaRanged;
