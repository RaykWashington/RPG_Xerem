require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmArma()
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
    obj:setName("frmArma");
    obj.grid["auto-height"] = true;

    obj.Styles = GUI.fromHandle(_obj_newObject("form"));
    obj.Styles:setParent(obj);
    obj.Styles:setName("Styles");
    obj.Styles:setAlign("client");
    obj.Styles:setTheme("dark");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1.grid.role = "col";
    obj.layout1.grid.width = 11;
    obj.layout1.grid["min-height"] = 20;
    obj.layout1:setName("layout1");
    obj.layout1.grid["auto-height"] = true;

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1.grid.role = "col";
    obj.edit1.grid.width = 3;
    obj.edit1:setField("$(arma)");
    obj.edit1:setName("edit1");
    obj.edit1:setTransparent(true);

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2.grid.role = "col";
    obj.edit2.grid.width = 2;
    obj.edit2:setField("$(arma)Dif");
    obj.edit2:setName("edit2");
    obj.edit2:setTransparent(true);

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3.grid.role = "col";
    obj.edit3.grid.width = 1;
    obj.edit3:setField("$(arma)Dan");
    obj.edit3:setName("edit3");
    obj.edit3:setTransparent(true);

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4.grid.role = "col";
    obj.edit4.grid.width = 2;
    obj.edit4:setField("$(arma)Alc");
    obj.edit4:setName("edit4");
    obj.edit4:setTransparent(true);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5.grid.role = "col";
    obj.edit5.grid.width = 2;
    obj.edit5:setField("$(arma)Pen");
    obj.edit5:setName("edit5");
    obj.edit5:setTransparent(true);

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6.grid.role = "col";
    obj.edit6.grid.width = 2;
    obj.edit6:setField("$(arma)Cdt");
    obj.edit6:setName("edit6");
    obj.edit6:setTransparent(true);

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout1);
    obj.horzLine1.grid.role = "col";
    obj.horzLine1.grid.width = 3;
    obj.horzLine1:setName("horzLine1");
    obj.horzLine1:setStrokeColor("#999999");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout1);
    obj.horzLine2.grid.role = "col";
    obj.horzLine2.grid.width = 2;
    obj.horzLine2:setName("horzLine2");
    obj.horzLine2:setStrokeColor("#999999");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout1);
    obj.horzLine3.grid.role = "col";
    obj.horzLine3.grid.width = 1;
    obj.horzLine3:setName("horzLine3");
    obj.horzLine3:setStrokeColor("#999999");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout1);
    obj.horzLine4.grid.role = "col";
    obj.horzLine4.grid.width = 2;
    obj.horzLine4:setName("horzLine4");
    obj.horzLine4:setStrokeColor("#999999");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout1);
    obj.horzLine5.grid.role = "col";
    obj.horzLine5.grid.width = 2;
    obj.horzLine5:setName("horzLine5");
    obj.horzLine5:setStrokeColor("#999999");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout1);
    obj.horzLine6.grid.role = "col";
    obj.horzLine6.grid.width = 2;
    obj.horzLine6:setName("horzLine6");
    obj.horzLine6:setStrokeColor("#999999");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1.grid.role = "col";
    obj.button1.grid.width = 1;
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
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.Styles ~= nil then self.Styles:destroy(); self.Styles = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmArma()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmArma();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmArma = {
    newEditor = newfrmArma, 
    new = newfrmArma, 
    name = "frmArma", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmArma = _frmArma;
Firecast.registrarForm(_frmArma);

return _frmArma;
