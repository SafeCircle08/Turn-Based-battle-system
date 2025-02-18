frame = 0;
x = 260;
y = 50;
image_xscale = 1.4
instance_deactivate_object(self);

attScaleX = 0.8;
attScaleY = 0.4;
frameStart = 0;
yAdder = 65;
instance_create_layer(240, 70, "Effect", oThinkingAttributes);
attScaleX = 0.6;
attScaleY = 0.3;
frameStart = 569;
yAdder = 80;
instance_create_layer(220, 90, "Effect", oThinkingAttributes);
attScaleX = 0.3;
attScaleY = 0.2;
frameStart = -20;
yAdder = 90;
instance_create_layer(240, 120, "Effect", oThinkingAttributes);

//instance_create_layer()