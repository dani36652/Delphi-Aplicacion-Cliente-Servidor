object ServerWebModule: TServerWebModule
  Actions = <
    item
      Default = True
      Name = 'conexion_disponible'
      PathInfo = '/checkconnection'
      OnAction = ServerWebModuleconexion_disponibleAction
    end
    item
      MethodType = mtGet
      Name = 'obtener_clientes'
      PathInfo = '/clientes'
      OnAction = ServerWebModuleobtener_clientesAction
    end
    item
      MethodType = mtGet
      Name = 'obtener_proveedores'
      PathInfo = '/proveedores'
      OnAction = ServerWebModuleobtener_proveedoresAction
    end
    item
      MethodType = mtGet
      Name = 'obtener_gerentes'
      PathInfo = '/gerentes'
      OnAction = ServerWebModuleobtener_gerentesAction
    end
    item
      MethodType = mtGet
      Name = 'obtener_productos'
      PathInfo = '/productos'
      OnAction = ServerWebModuleobtener_productosAction
    end>
  Height = 230
  Width = 415
end
