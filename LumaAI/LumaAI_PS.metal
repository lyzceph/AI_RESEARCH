// ! /Engine/Private/BasePassPixelShader.usf:MainPS
// Compiled by ShaderConductor
// @Outputs: f4:SV_Target0
// @UniformBlocks: View(0),Primitive(1),TranslucentBasePass(2),Material(3)
// @Samplers: TranslucentBasePass_Shared_Fog_IntegratedLightScattering(0:1)
// @SamplerStates: 0:View_SharedBilinearClampedSampler


#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

struct type_View
{
    char _m0_pad[64];
    float4x4 View_RelativeWorldToClip;
    char _m1_pad[576];
    float4x4 View_SVPositionToTranslatedWorld;
    char _m2_pad[192];
    float3 View_ViewTilePosition;
    float3 View_MatrixTilePosition;
    char _m4_pad[160];
    float3 View_RelativePreViewTranslation;
    char _m5_pad[952];
    float View_PreExposure;
    float View_OneOverPreExposure;
    char _m7_pad[64];
    float View_OutOfBoundsMask;
    char _m8_pad[1392];
    float3 View_VolumetricFogInvGridSize;
    float3 View_VolumetricFogGridZParams;
    char _m10_pad[32];
    float2 View_VolumetricFogScreenToResourceUV;
    float2 View_VolumetricFogUVMax;
};

struct type_Primitive
{
    char _m0_pad[16];
    float3 Primitive_TilePosition;
    char _m1_pad[332];
    float Primitive_ObjectBoundsX;
    float4 Primitive_ObjectRelativeWorldPositionAndRadius;
    char _m3_pad[92];
    float Primitive_ObjectBoundsY;
    char _m4_pad[12];
    float Primitive_ObjectBoundsZ;
    char _m5_pad[96];
    float Primitive_MaxWPOExtent;
};

struct type_TranslucentBasePass
{
    char _m0_pad[1996];
    float TranslucentBasePass_Shared_Fog_ApplyVolumetricFog;
    float TranslucentBasePass_Shared_Fog_VolumetricFogStartDistance;
};

struct type_Material
{
    float4 Material_PreshaderBuffer[3];
};

constant float _92 = {};

struct MainPS_out
{
    float4 out_var_SV_Target0 [[color(0)]];
};

struct MainPS_in
{
    float4 in_var_TEXCOORD0 [[user(locn2)]];
    float4 in_var_TEXCOORD1_0 [[user(locn3)]];
    float4 in_var_TEXCOORD7 [[user(locn4)]];
    float3 in_var_TEXCOORD9 [[user(locn5)]];
};

fragment MainPS_out Main_00001dee_7ca9fabd(MainPS_in in [[stage_in]], constant type_View& View [[buffer(0)]], constant type_Primitive& Primitive [[buffer(1)]], constant type_TranslucentBasePass& TranslucentBasePass [[buffer(2)]], constant type_Material& Material [[buffer(3)]], texture3d<float> TranslucentBasePass_Shared_Fog_IntegratedLightScattering [[texture(0)]], sampler View_SharedBilinearClampedSampler [[sampler(0)]], float4 gl_FragCoord [[position]])
{
    MainPS_out out = {};
    spvUnsafeArray<float4, 1> in_var_TEXCOORD1 = {};
    in_var_TEXCOORD1[0] = in.in_var_TEXCOORD1_0;
    float4 _125 = View.View_SVPositionToTranslatedWorld * float4(gl_FragCoord.xyz, 1.0);
    float3 _129 = _125.xyz / float3(_125.w);
    float3 _130 = _129 - View.View_RelativePreViewTranslation;
    float2 _144 = (float2(in_var_TEXCOORD1[0].x, in_var_TEXCOORD1[0].y) * 4.0) - float2(2.0);
    float _146 = -dot(_144, _144);
    float _151 = fast::clamp((_146 < (-4.0)) ? 0.0 : (exp(_146) * in.in_var_TEXCOORD0.w), 0.0, 1.0);
    bool _155 = TranslucentBasePass.TranslucentBasePass_Shared_Fog_ApplyVolumetricFog > 0.0;
    float4 _238;
    if (_155)
    {
        float4 _173 = View.View_RelativeWorldToClip * (((float4(View.View_ViewTilePosition, 0.0) + float4(-View.View_MatrixTilePosition, 0.0)) * 2097152.0) + float4(_130, 1.0));
        float _174 = _173.w;
        float4 _220;
        float _221;
        if (_155)
        {
            float4 _214 = TranslucentBasePass_Shared_Fog_IntegratedLightScattering.sample(View_SharedBilinearClampedSampler, precise::min(float3(fma((_173.xy / float2(_174)).xy, float2(0.5, -0.5), float2(0.5)), (log2(fma(_174, View.View_VolumetricFogGridZParams.x, View.View_VolumetricFogGridZParams.y)) * View.View_VolumetricFogGridZParams.z) * View.View_VolumetricFogInvGridSize.z) * float3(View.View_VolumetricFogScreenToResourceUV, 1.0), float3(View.View_VolumetricFogUVMax, 1.0)), level(0.0));
            float3 _218 = _214.xyz * View.View_OneOverPreExposure;
            _220 = float4(_218.x, _218.y, _218.z, _214.w);
            _221 = TranslucentBasePass.TranslucentBasePass_Shared_Fog_VolumetricFogStartDistance;
        }
        else
        {
            _220 = float4(0.0, 0.0, 0.0, 1.0);
            _221 = 0.0;
        }
        float4 _226 = mix(float4(0.0, 0.0, 0.0, 1.0), _220, float4(fast::clamp(((float4(_92, _92, _92, 1.0) * (1.0 / gl_FragCoord.w)).w - _221) * 100000000.0, 0.0, 1.0)));
        float _229 = _226.w;
        _238 = float4(_226.xyz + (in.in_var_TEXCOORD7.xyz * _229), _229 * in.in_var_TEXCOORD7.w);
    }
    else
    {
        _238 = in.in_var_TEXCOORD7;
    }
    float3 _239 = precise::max(mix(pow(fast::clamp(in.in_var_TEXCOORD0.xyz, float3(0.0), float3(1.0)), float3(2.2000000476837158203125)) * 0.4000000059604644775390625, Material.Material_PreshaderBuffer[1].xyz, float3(Material.Material_PreshaderBuffer[1].w)), float3(0.0));
    float _313;
    float3 _314;
    if (View.View_OutOfBoundsMask > 0.0)
    {
        float _311;
        float3 _312;
        if (any(abs(((View.View_ViewTilePosition - Primitive.Primitive_TilePosition) * 2097152.0) + (_130 - Primitive.Primitive_ObjectRelativeWorldPositionAndRadius.xyz)) > (float3(Primitive.Primitive_ObjectBoundsX, Primitive.Primitive_ObjectBoundsY, Primitive.Primitive_ObjectBoundsZ) + float3(1.0))))
        {
            float3 _270 = View.View_ViewTilePosition * float3(0.57700002193450927734375);
            float3 _271 = _130 * float3(0.57700002193450927734375);
            _311 = 1.0;
            _312 = mix(float3(1.0, 1.0, 0.0), float3(0.0, 1.0, 1.0), float3(float3(fract(fma((_271.x + _271.y) + _271.z, 0.00200000009499490261077880859375, fract(((_270.x + _270.y) + _270.z) * 4194.30419921875)))) > float3(0.5)));
        }
        else
        {
            float _309;
            float3 _310;
            if (Primitive.Primitive_MaxWPOExtent > 0.0)
            {
                float3 _294 = abs(_129 - in.in_var_TEXCOORD9);
                float _304 = 1.0 - fast::clamp(abs(precise::max(_294.x, precise::max(_294.y, _294.z)) - Primitive.Primitive_MaxWPOExtent) * 20.0, 0.0, 1.0);
                _309 = float(int(sign(_304)));
                _310 = float3(1.0, 0.0, 1.0) * _304;
            }
            else
            {
                _309 = _151;
                _310 = _239;
            }
            _311 = _309;
            _312 = _310;
        }
        _313 = _311;
        _314 = _312;
    }
    else
    {
        _313 = _151;
        _314 = _239;
    }
    float4 _322 = float4((_314 * _238.w) + _238.xyz, _313);
    float3 _328 = precise::min((_322.xyz * View.View_PreExposure).xyz, float3(32256.0));
    out.out_var_SV_Target0 = float4(_328.x, _328.y, _328.z, _322.w);
    return out;
}

