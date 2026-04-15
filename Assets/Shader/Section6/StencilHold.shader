Shader "MyShader/Section6/StencilHold"
{
    Properties
	{
		_MainTex("Texture", 2D) = "white" {}
	}
    SubShader
    {
        Tags{"Queue" = "Geometry-1"}

        ColorMask 0
        ZWrite off

        Stencil
        {
            Ref 1
            Comp always
            Pass replace
        }
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        struct Input
        {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            fixed4 v = tex2D(_MainTex, IN.uv_MainTex);
            o.Albedo = v.rgb;
        }
        ENDCG
    }
}
