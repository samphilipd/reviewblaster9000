# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

Rbnk.ApplicationStore = DS.Store.extend({
})

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
Rbnk.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api/v1'
})

Rbnk.RawTransform = DS.Transform.extend(
  deserialize: (serialized) ->
    return serialized
  serialize: (deserialized) ->
    return deserialized
)
