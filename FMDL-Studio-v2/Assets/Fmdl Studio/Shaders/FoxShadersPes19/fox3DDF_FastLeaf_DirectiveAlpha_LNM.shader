Shader "FoxShaders/fox3DDF_FastLeaf_DirectiveAlpha_LNM" {
Properties {
	_MatParamIndex_0("MatParamIndex_0", Vector) = (0.0, 0.0, 0.0, 0.0)
	_Specular_Value("Specular_Value", Vector) = (0.0, 0.0, 0.0, 0.0)
	_Roughness_Value("Roughness_Value", Vector) = (0.0, 0.0, 0.0, 0.0)
	_Translucent_Value("Translucent_Value", Vector) = (0.0, 0.0, 0.0, 0.0)
	_StartFadeDot("StartFadeDot", Vector) = (0.0, 0.0, 0.0, 0.0)
	_EndFadeDot("EndFadeDot", Vector) = (0.0, 0.0, 0.0, 0.0)
	_Base_Tex_SRGB("Base_Tex_SRGB", 2D) = "white" {}
	_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
}

SubShader {
	Tags {"Queue"="AlphaTest" "IgnoreProjector"="True" "RenderType"="TransparentCutout"}
	LOD 400

CGPROGRAM
#pragma surface surf BlinnPhong alphatest:_Cutoff
#pragma target 3.0

sampler2D _Base_Tex_SRGB;

struct Input {
	float2 uv_Base_Tex_SRGB;
};

void surf (Input IN, inout SurfaceOutput o) {
	fixed4 tex = tex2D(_Base_Tex_SRGB, IN.uv_Base_Tex_SRGB);
	o.Albedo = tex.rgb;
	o.Gloss = tex.a;
	o.Alpha = tex.a;
}
ENDCG
}

FallBack "Standard"
}