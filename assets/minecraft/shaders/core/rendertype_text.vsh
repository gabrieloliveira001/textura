#version 150

precision highp float;






#define hue(v)  ((.6+.6*cos(6.*(v)+vec4(0, 23, 21, 1)))+vec4(0., 0., 0., 1.) )

#define finalize() { \
    vertexDistance=length((ModelViewMat*vertex).xyz); \
    texCoord0=UV0; \
}

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;


uniform sampler2D Sampler0;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

uniform float GameTime;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

float safeGameTime() {
    float gameTime=GameTime;
    
    if(gameTime <= 0) {
        gameTime=.5;
    }
    return gameTime;
}

float scaledTime() {
    return safeGameTime()*12000.;
}

void f_724610b2(inout vec4 vertex) {
    gl_Position=ProjMat*ModelViewMat*vertex;
}

void f_cda9b593() {
    vertexColor=Color*texelFetch(Sampler2, UV2 / 16, 0);
}


void f_22427dae(inout vec4 vertex) {
    f_724610b2(vertex);
    if(Position.z==0. && gl_Position.x > .95) {
        vertexColor=vec4(0);
    }else{
        f_cda9b593();
    }
    finalize();
}



void f_0f7cf98d() {
    vertexColor=hue(gl_Position.x+safeGameTime()*1000.)*texelFetch(Sampler2, UV2 / 16, 0);
}

void f_5b5c15da() {
    gl_Position.y+=sin(scaledTime()+(gl_Position.x*6)) / 150.;
}

void f_8a89ff2f(inout vec4 vertex) {
    f_724610b2(vertex);
    f_0f7cf98d();
    finalize();
}

void f_4b7e9b6b(inout vec4 vertex) {
    f_724610b2(vertex);
    f_cda9b593();
    f_5b5c15da();
    finalize();
}

void f_077646fd(inout vec4 vertex) {
    f_724610b2(vertex);
    f_5b5c15da();
    f_0f7cf98d();
    finalize();
}

void f_42a888e8(inout vec4 vertex) {
    f_cda9b593();
    float vertexId=mod(gl_VertexID, 4.);
    if(vertex.z <= 0.) {
        if(vertexId==3. || vertexId==0.) {
            vertex.y+=cos(scaledTime() / 4)*.1;
            vertex.y+=max(cos(scaledTime() / 4)*.1, 0.);
        }
    }else{
        if(vertexId==3. || vertexId==0.) {
            vertex.y-=cos(scaledTime() / 4)*3;
            vertex.y-=max(cos(scaledTime() / 4)*4, 0.);
        }
    }
    f_724610b2(vertex);
    finalize();
}

void f_16b338b4(inout vec4 vertex) {
    float vertexId=mod(gl_VertexID, 4.);
    if(vertex.z <= 0.) {
        if(vertexId==3. || vertexId==0.) {
            vertex.y+=cos(scaledTime() / 4)*.1;
            vertex.y+=max(cos(scaledTime() / 4)*.1, 0.);
        }
    }else{
        if(vertexId==3. || vertexId==0.) {
            vertex.y-=cos(scaledTime() / 4)*3;
            vertex.y-=max(cos(scaledTime() / 4)*4, 0.);
        }
    }
    f_0f7cf98d();
    f_724610b2(vertex);
    finalize();
}

void f_712bd9ea(inout vec4 vertex, float speed) {
    f_724610b2(vertex);
    float blink=abs(sin(scaledTime()*speed));
    vertexColor=Color*blink*texelFetch(Sampler2, UV2 / 16, 0);
    finalize();
}



void f_60263462(inout vec4 vertex) {
    f_724610b2(vertex);
    f_cda9b593();
    vertexColor=vec4(1, 1, 1, vertexColor.a); 
    finalize();
}


void main() {
    vec4 vertex=vec4(Position, 1.);
    ivec3 iColor=ivec3(Color.xyz*255+vec3(.5));

    
    
    if(iColor==ivec3(255, 85, 85))
    {
        f_22427dae(vertex);
        return;
    }
    

    
    if(fract(Position.z) < .1) {
        
        
        if(iColor==ivec3(19, 23, 9))
        {
            gl_Position=vec4(2, 2, 2, 1);
            f_cda9b593();
            finalize();
            return;
        }
        

        
        
        if(iColor==ivec3(57, 63, 63)) {
            
            
            f_724610b2(vertex);
            f_cda9b593();
            finalize();
            return;
        }

        
        if(iColor==ivec3(57, 63, 62)) {
            f_4b7e9b6b(vertex);
            return;
        }

        
        if(iColor==ivec3(57, 62, 63)) {
            
            f_4b7e9b6b(vertex);
            return;
        }

        
        if(iColor==ivec3(57, 62, 62)) {
            f_42a888e8(vertex);
            return;
        }

        
        if(iColor==ivec3(57, 61, 63)) {
            f_42a888e8(vertex);
            return;
        }

        
        if(iColor==ivec3(57, 61, 62)) {
            f_712bd9ea(vertex, .5);
            return;
        }

        

        
    }

    
    
    if(iColor==ivec3(78, 92, 36))
    {
        f_60263462(vertex);
        return;
    }
    

    
    
    
    if(iColor==ivec3(230, 255, 254))
    {
        f_8a89ff2f(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 255, 250))
    {
        f_4b7e9b6b(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 251, 254))
    {
        f_077646fd(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 251, 250))
    {
        f_42a888e8(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 247, 254))
    {
        f_16b338b4(vertex);
        return;
    }

    
    if(iColor==ivec3(230, 247, 250))
    {
        f_712bd9ea(vertex, .5);
        return;
    }

    
    

    
    
    
    if(iColor==ivec3(255, 255, 254))
    {
        f_8a89ff2f(vertex);
        return;
    }

    
    if(iColor==ivec3(255, 255, 253))
    {
        f_4b7e9b6b(vertex);
        return;
    }

    
    if(iColor==ivec3(255, 255, 25))
    {
        f_077646fd(vertex);
        return;
    }

    
    if(iColor==ivec3(255, 255, 251))
    {
        f_42a888e8(vertex);
        return;
    }

    
    if(iColor==ivec3(255, 254, 254))
    {
        f_16b338b4(vertex);
        return;
    }
    

    
    f_724610b2(vertex);
    f_cda9b593();
    finalize();
}