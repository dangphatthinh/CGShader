Shader "Practice/Gradient"
{
    Properties
    {
        [HideInInspector] _MainTex ("Texture", 2D) = "white" {}
        _ColorFrom ("Color From", Color) = (1,1,1,1)
        _ColorTo ("Color To", Color) = (1,1,1,1)
        _LinearPosFrom ("Position From" , Range(0,0.99)) = 0
        _LinearPosTo ("Position To" , Range(0.01,1)) = 1
    }
    SubShader
    {
        Tags
        {
            "Queue"="Transparent"
            "IgnoreProjector" = "True"
            "RenderType"="Transparent"
        }
        LOD 100
 
        ZWrite Off
        Blend SrcAlpha OneMinusSrcAlpha
 
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
 
            #include "UnityCG.cginc"
 
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };
 
            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };
 
            sampler2D _MainTex;
            float4 _ColorFrom;
            float4 _ColorTo;
            float _LinearPosFrom;
            float _LinearPosTo;
 
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }
 
            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col;
                if(i.uv.x <= _LinearPosFrom)
                {
                    col = _ColorFrom;
                }
                else if(i.uv.x >= _LinearPosTo)
                {
                    col = _ColorTo;
                }
                else
                {
                    col = lerp(_ColorFrom, _ColorTo, (i.uv.x - _LinearPosFrom) / (_LinearPosTo - _LinearPosFrom));
                }
                return col;
            }
            ENDCG
        }
    }
}