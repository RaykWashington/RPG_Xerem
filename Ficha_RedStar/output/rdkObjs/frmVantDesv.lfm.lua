require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmVantDesv()
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
    obj:setName("frmVantDesv");
    obj.grid["auto-height"] = true;

    obj.Styles = GUI.fromHandle(_obj_newObject("form"));
    obj.Styles:setParent(obj);
    obj.Styles:setName("Styles");
    obj.Styles:setAlign("client");
    obj.Styles:setTheme("dark");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1.grid.role = "col";
    obj.layout1.grid.width = 10;
    obj.layout1.grid["min-height"] = 20;
    obj.layout1:setName("layout1");
    obj.layout1.grid["auto-height"] = true;

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 10;
    obj.edit1:setField("$(atributo)");
    obj.edit1:setName("edit1");
    obj.edit1:setTransparent(true);

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2.grid.role = "col";
    obj.edit2.grid.width = 2;
    obj.edit2:setType("number");
    obj.edit2:setField("valor$(atributo)");
    obj.edit2:setName("edit2");
    obj.edit2:setTransparent(true);

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout1);
    obj.horzLine1.grid.role = "col";
    obj.horzLine1.grid.width = 10;
    obj.horzLine1:setName("horzLine1");
    obj.horzLine1:setStrokeColor("#999999");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout1);
    obj.horzLine2.grid.role = "col";
    obj.horzLine2.grid.width = 2;
    obj.horzLine2:setName("horzLine2");
    obj.horzLine2:setStrokeColor("#999999");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1.grid.role = "col";
    obj.button1.grid.width = 2;
    obj.button1:setText("➖");
    obj.button1.grid["vert-tile"] = true;
    obj.button1:setName("button1");

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

        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.Styles ~= nil then self.Styles:destroy(); self.Styles = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmVantDesv()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmVantDesv();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmVantDesv = {
    newEditor = newfrmVantDesv, 
    new = newfrmVantDesv, 
    name = "frmVantDesv", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmVantDesv = _frmVantDesv;
Firecast.registrarForm(_frmVantDesv);

return _frmVantDesv;
