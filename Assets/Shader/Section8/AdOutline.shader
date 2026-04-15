Shader "MyShader/Section8/AdOutline"
{
    Properties
    {
        _Color ("Outline Color", Color) = (1,1,1,1)
        _MainTex ("Main Texture", 2D) = "white" {}
        _Outline ("Outline Width", Range(0,5)) = 1      
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        struct Input
        {
            float2 uv_MainTex;
        };

        sampler2D _MainTex;
        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
        }
        ENDCG

        Pass
        {
            Cull Front
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal: NORMAL;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                fixed4 color : COLOR;
            };

            float _Outline;
            float4 _Color;

            v2f vert(appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                //convert normal data form obj space to view space
                float3 norm = normalize(mul((float3x3)UNITY_MATRIX_IT_MV, v.normal));
                //convert normal from view space to projection space 
                float2 offset = TransformViewToProjection(norm.xy);
                //o.pos.z is depth correction
                o.pos.xy += offset * o.pos.z * _Outline;
                o.color = _Color;
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                return i.color;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
