require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmItemEquip()
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
    obj:setName("frmItemEquip");
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
    obj.edit1:setField("$(nomeEquip)");
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 4;
    obj.edit1:setName("edit1");
    obj.edit1:setTransparent(true);
    obj.edit1:setHeight(25);

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setField("desc_$(nomeEquip)");
    obj.edit2.grid.role = "col";
    obj.edit2.grid.width = 5;
    obj.edit2:setName("edit2");
    obj.edit2:setTransparent(true);
    obj.edit2:setHeight(25);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1.grid.role = "col";
    obj.rectangle1.grid.width = 2;
    obj.rectangle1.grid["auto-height"] = true;
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1.grid["max-height"] = 30;
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
    obj.edit3:setField("preco_$(nomeEquip)");
    obj.edit3.grid.role = "col";
    obj.edit3.grid.width = 12;
    obj.edit3:setType("number");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");
    obj.edit3:setTransparent(true);
    obj.edit3:setHeight(25);

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

        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmItemEquip()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmItemEquip();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmItemEquip = {
    newEditor = newfrmItemEquip, 
    new = newfrmItemEquip, 
    name = "frmItemEquip", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmItemEquip = _frmItemEquip;
Firecast.registrarForm(_frmItemEquip);

return _frmItemEquip;
