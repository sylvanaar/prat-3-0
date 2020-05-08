local name, namespace = ...

assert(Prat)

for k, v in pairs(namespace) do
  Prat[k] = v
end
