t = [];
while isempty(t)
 [~, t] = RTBoxSimple('read')
if ~isempty(t), return; end
end