// ! /Engine/Private/BasePassVertexShader.usf:Main
// Compiled by ShaderConductor
// @Inputs: f2:in_ATTRIBUTE0
// @UniformBlocks: TranslucentBasePass(0),View(1),Primitive(2),NiagaraSpriteVFLooseParameters(3),NiagaraSpriteVF(4)
// @Samplers: NiagaraSpriteVFLooseParameters_CutoutGeometry(0:1),NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat(1:1),NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf(2:1),NiagaraSpriteVFLooseParameters_SortedIndices(3:1),TranslucentBasePass_Shared_Fog_FogInscatteringColorCubemap(4:1),View_DistantSkyLightLutTexture(5:1),View_CameraAerialPerspectiveVolume(6:1)
// @SamplerStates: 0:TranslucentBasePass_Shared_Fog_FogInscatteringColorSampler,1:View_DistantSkyLightLutTextureSampler,2:View_CameraAerialPerspectiveVolumeSampler


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

struct type_TranslucentBasePass
{
    char _m0_pad[1856];
    float4 TranslucentBasePass_Shared_Fog_ExponentialFogParameters;
    float4 TranslucentBasePass_Shared_Fog_ExponentialFogParameters2;
    float4 TranslucentBasePass_Shared_Fog_ExponentialFogColorParameter;
    float4 TranslucentBasePass_Shared_Fog_ExponentialFogParameters3;
    float4 TranslucentBasePass_Shared_Fog_SkyAtmosphereAmbientContributionColorScale;
    float4 TranslucentBasePass_Shared_Fog_InscatteringLightDirection;
    float4 TranslucentBasePass_Shared_Fog_DirectionalInscatteringColor;
    float2 TranslucentBasePass_Shared_Fog_SinCosInscatteringColorCubemapRotation;
    float3 TranslucentBasePass_Shared_Fog_FogInscatteringTextureParameters;
};

struct type_View
{
    float4x4 View_TranslatedWorldToClip;
    char _m1_pad[896];
    float3 View_ViewTilePosition;
    char _m2_pad[16];
    float3 View_ViewForward;
    float3 View_ViewUp;
    float3 View_ViewRight;
    float3 View_HMDViewNoRollUp;
    float3 View_HMDViewNoRollRight;
    char _m7_pad[32];
    float3 View_RelativeWorldCameraOrigin;
    float3 View_TranslatedWorldCameraOrigin;
    char _m9_pad[16];
    float3 View_RelativePreViewTranslation;
    char _m10_pad[832];
    float4 View_ViewSizeAndInvSize;
    char _m11_pad[108];
    float View_OneOverPreExposure;
    char _m12_pad[384];
    float4 View_AtmosphereLightDirection[2];
    float4 View_AtmosphereLightIlluminanceOnGroundPostTransmittance[2];
    char _m14_pad[228];
    float View_SkyAtmosphereHeightFogContribution;
    float4 View_SkyAtmosphereCameraAerialPerspectiveVolumeSizeAndInvSize;
    float View_SkyAtmosphereAerialPerspectiveStartDepthKm;
    float View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolution;
    float View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolutionInv;
    char _m19_pad[4];
    float View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKmInv;
    float View_SkyAtmosphereApplyCameraAerialPerspectiveVolume;
    char _m21_pad[24];
    float View_RealTimeReflectionCapture;
    char _m22_pad[796];
    float View_VolumetricFogMaxDistance;
    char _m23_pad[848];
    float4 View_TanAndInvTanHalfFOV;
};

struct type_Primitive
{
    char _m0_pad[16];
    float3 Primitive_TilePosition;
    float4x4 Primitive_LocalToRelativeWorld;
    char _m2_pad[256];
    float3 Primitive_InvNonUniformScale;
};

struct type_NiagaraSpriteVFLooseParameters
{
    uint NiagaraSpriteVFLooseParameters_NumCutoutVerticesPerFrame;
    uint NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride;
    uint NiagaraSpriteVFLooseParameters_ParticleAlignmentMode;
    uint NiagaraSpriteVFLooseParameters_ParticleFacingMode;
    uint NiagaraSpriteVFLooseParameters_SortedIndicesOffset;
};

struct type_NiagaraSpriteVF
{
    uint NiagaraSpriteVF_bLocalSpace;
    char _m1_pad[16];
    float4 NiagaraSpriteVF_NormalsSphereCenter;
    float4 NiagaraSpriteVF_NormalsCylinderUnitDirection;
    float4 NiagaraSpriteVF_SubImageSize;
    packed_float3 NiagaraSpriteVF_CameraFacingBlend;
    float NiagaraSpriteVF_RemoveHMDRoll;
    char _m6_pad[16];
    float NiagaraSpriteVF_RotationScale;
    float NiagaraSpriteVF_RotationBias;
    float NiagaraSpriteVF_NormalsType;
    float2 NiagaraSpriteVF_DefaultPivotOffset;
    char _m10_pad[8];
    int NiagaraSpriteVF_PositionDataOffset;
    char _m11_pad[4];
    int NiagaraSpriteVF_VelocityDataOffset;
    char _m12_pad[4];
    int NiagaraSpriteVF_RotationDataOffset;
    char _m13_pad[4];
    int NiagaraSpriteVF_SizeDataOffset;
    char _m14_pad[4];
    int NiagaraSpriteVF_SubimageDataOffset;
    int NiagaraSpriteVF_ColorDataOffset;
    char _m16_pad[20];
    int NiagaraSpriteVF_FacingDataOffset;
    char _m17_pad[4];
    int NiagaraSpriteVF_AlignmentDataOffset;
    char _m18_pad[4];
    int NiagaraSpriteVF_SubImageBlendMode;
    int NiagaraSpriteVF_CameraOffsetDataOffset;
    char _m20_pad[4];
    int NiagaraSpriteVF_UVScaleDataOffset;
    int NiagaraSpriteVF_PivotOffsetDataOffset;
    char _m22_pad[16];
    float4 NiagaraSpriteVF_DefaultPos;
    char _m23_pad[16];
    float2 NiagaraSpriteVF_DefaultSize;
    char _m24_pad[8];
    float2 NiagaraSpriteVF_DefaultUVScale;
    float3 NiagaraSpriteVF_DefaultVelocity;
    char _m26_pad[16];
    packed_float3 NiagaraSpriteVF_SystemLWCTile;
    float NiagaraSpriteVF_DefaultRotation;
    char _m28_pad[16];
    float4 NiagaraSpriteVF_DefaultColor;
    char _m29_pad[4];
    float NiagaraSpriteVF_DefaultCamOffset;
    char _m30_pad[8];
    float NiagaraSpriteVF_DefaultSubImage;
    float4 NiagaraSpriteVF_DefaultFacing;
    char _m32_pad[16];
    float4 NiagaraSpriteVF_DefaultAlignment;
    char _m33_pad[80];
    int NiagaraSpriteVF_PixelCoverageEnabled;
    float4 NiagaraSpriteVF_PixelCoverageColorBlend;
};

constant float2 _132 = {};
constant float3x3 _133 = {};
constant float4 _134 = {};
constant float2 _135 = {};

struct Main_out
{
    float4 out_var_TEXCOORD10 [[user(locn0)]];
    float4 out_var_TEXCOORD11 [[user(locn1)]];
    float4 out_var_TEXCOORD0 [[user(locn2)]];
    float4 out_var_TEXCOORD1_0 [[user(locn3)]];
    float4 out_var_TEXCOORD7 [[user(locn4)]];
    float3 out_var_TEXCOORD9 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
};

struct Main_in
{
    float2 in_var_ATTRIBUTE0 [[attribute(0)]];
};

vertex Main_out Main_0000b276_df941a35(Main_in in [[stage_in]], constant type_TranslucentBasePass& TranslucentBasePass [[buffer(0)]], constant type_View& View [[buffer(1)]], constant type_Primitive& Primitive [[buffer(2)]], constant type_NiagaraSpriteVFLooseParameters& NiagaraSpriteVFLooseParameters [[buffer(3)]], constant type_NiagaraSpriteVF& NiagaraSpriteVF [[buffer(4)]], texture_buffer<float> NiagaraSpriteVFLooseParameters_CutoutGeometry [[texture(0)]], texture_buffer<float> NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat [[texture(1)]], texture_buffer<float> NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf [[texture(2)]], texture_buffer<uint> NiagaraSpriteVFLooseParameters_SortedIndices [[texture(3)]], texturecube<float> TranslucentBasePass_Shared_Fog_FogInscatteringColorCubemap [[texture(4)]], texture2d<float> View_DistantSkyLightLutTexture [[texture(5)]], texture3d<float> View_CameraAerialPerspectiveVolume [[texture(6)]], sampler TranslucentBasePass_Shared_Fog_FogInscatteringColorSampler [[sampler(0)]], sampler View_DistantSkyLightLutTextureSampler [[sampler(1)]], sampler View_CameraAerialPerspectiveVolumeSampler [[sampler(2)]], uint gl_VertexIndex [[vertex_id]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseVertex [[base_vertex]], uint gl_BaseInstance [[base_instance]])
{
    Main_out out = {};
    spvUnsafeArray<float4, 1> out_var_TEXCOORD1 = {};
    float3 _201 = -View.View_ViewTilePosition;
    uint _211;
    if (NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_SortedIndicesOffset != 4294967295u)
    {
        _211 = NiagaraSpriteVFLooseParameters_SortedIndices.read(uint((NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_SortedIndicesOffset + (gl_InstanceIndex - gl_BaseInstance)))).x;
    }
    else
    {
        _211 = (gl_InstanceIndex - gl_BaseInstance);
    }
    float3 _275;
    do
    {
        if (NiagaraSpriteVF.NiagaraSpriteVF_PositionDataOffset == (-1))
        {
            _275 = NiagaraSpriteVF.NiagaraSpriteVF_DefaultPos.xyz;
            break;
        }
        float3 _274;
        do
        {
            uint _224 = uint(NiagaraSpriteVF.NiagaraSpriteVF_PositionDataOffset);
            int _228 = int(_224 & 2147483647u);
            if ((_224 & 2147483648u) != 0u)
            {
                _274 = float3(NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_228) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_228 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_228 + 2) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            else
            {
                _274 = float3(NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_228) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_228 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_228 + 2) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            break; // unreachable workaround
        } while(false);
        _275 = _274;
        break;
    } while(false);
    bool _304;
    float4 _284 = float4(Primitive.Primitive_LocalToRelativeWorld[0].xyz, 0.0);
    float4 _289 = float4(Primitive.Primitive_LocalToRelativeWorld[1].xyz, 0.0);
    float4 _294 = float4(Primitive.Primitive_LocalToRelativeWorld[2].xyz, 0.0);
    float3 _320;
    float3 _321;
    do
    {
        _304 = NiagaraSpriteVF.NiagaraSpriteVF_bLocalSpace != 0u;
        if (_304)
        {
            _320 = Primitive.Primitive_TilePosition;
            _321 = fma(_275.zzz, _294.xyz, fma(_275.xxx, _284.xyz, _275.yyy * _289.xyz)) + float4(Primitive.Primitive_LocalToRelativeWorld[3].xyz, 1.0).xyz;
            break;
        }
        _320 = float3(NiagaraSpriteVF.NiagaraSpriteVF_SystemLWCTile);
        _321 = _275;
        break;
    } while(false);
    float _358;
    do
    {
        if (NiagaraSpriteVF.NiagaraSpriteVF_RotationDataOffset == (-1))
        {
            _358 = NiagaraSpriteVF.NiagaraSpriteVF_DefaultRotation;
            break;
        }
        float _357;
        do
        {
            uint _333 = uint(NiagaraSpriteVF.NiagaraSpriteVF_RotationDataOffset);
            int _337 = int(_333 & 2147483647u);
            if ((_333 & 2147483648u) != 0u)
            {
                _357 = NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_337) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x;
                break;
            }
            else
            {
                _357 = NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_337) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x;
                break;
            }
            break; // unreachable workaround
        } while(false);
        _358 = _357;
        break;
    } while(false);
    float _359 = _358 * 0.0174532942473888397216796875;
    float _364 = fma(_359, NiagaraSpriteVF.NiagaraSpriteVF_RotationScale, NiagaraSpriteVF.NiagaraSpriteVF_RotationBias);
    float2 _415;
    do
    {
        if (NiagaraSpriteVF.NiagaraSpriteVF_SizeDataOffset == (-1))
        {
            _415 = NiagaraSpriteVF.NiagaraSpriteVF_DefaultSize;
            break;
        }
        float2 _414;
        do
        {
            uint _376 = uint(NiagaraSpriteVF.NiagaraSpriteVF_SizeDataOffset);
            int _380 = int(_376 & 2147483647u);
            if ((_376 & 2147483648u) != 0u)
            {
                _414 = float2(NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_380) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_380 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            else
            {
                _414 = float2(NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_380) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_380 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            break; // unreachable workaround
        } while(false);
        _415 = _414;
        break;
    } while(false);
    float3 _478;
    do
    {
        if (NiagaraSpriteVF.NiagaraSpriteVF_VelocityDataOffset == (-1))
        {
            _478 = NiagaraSpriteVF.NiagaraSpriteVF_DefaultVelocity;
            break;
        }
        float3 _477;
        do
        {
            uint _427 = uint(NiagaraSpriteVF.NiagaraSpriteVF_VelocityDataOffset);
            int _431 = int(_427 & 2147483647u);
            if ((_427 & 2147483648u) != 0u)
            {
                _477 = float3(NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_431) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_431 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_431 + 2) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            else
            {
                _477 = float3(NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_431) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_431 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_431 + 2) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            break; // unreachable workaround
        } while(false);
        _478 = _477;
        break;
    } while(false);
    float3 _479 = _284.xyz;
    float3 _480 = _289.xyz;
    float3 _481 = _294.xyz;
    float3 _500;
    do
    {
        if (_304)
        {
            _500 = fma(_481 * Primitive.Primitive_InvNonUniformScale.z, _478.zzz, fma(_479 * Primitive.Primitive_InvNonUniformScale.x, _478.xxx, (_480 * Primitive.Primitive_InvNonUniformScale.y) * _478.yyy));
            break;
        }
        _500 = _478;
        break;
    } while(false);
    float _537;
    do
    {
        if (NiagaraSpriteVF.NiagaraSpriteVF_SubimageDataOffset == (-1))
        {
            _537 = NiagaraSpriteVF.NiagaraSpriteVF_DefaultSubImage;
            break;
        }
        float _536;
        do
        {
            uint _512 = uint(NiagaraSpriteVF.NiagaraSpriteVF_SubimageDataOffset);
            int _516 = int(_512 & 2147483647u);
            if ((_512 & 2147483648u) != 0u)
            {
                _536 = NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_516) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x;
                break;
            }
            else
            {
                _536 = NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_516) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x;
                break;
            }
            break; // unreachable workaround
        } while(false);
        _537 = _536;
        break;
    } while(false);
    float3 _601;
    do
    {
        if (NiagaraSpriteVF.NiagaraSpriteVF_FacingDataOffset == (-1))
        {
            _601 = NiagaraSpriteVF.NiagaraSpriteVF_DefaultFacing.xyz;
            break;
        }
        float3 _600;
        do
        {
            uint _550 = uint(NiagaraSpriteVF.NiagaraSpriteVF_FacingDataOffset);
            int _554 = int(_550 & 2147483647u);
            if ((_550 & 2147483648u) != 0u)
            {
                _600 = float3(NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_554) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_554 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_554 + 2) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            else
            {
                _600 = float3(NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_554) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_554 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_554 + 2) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            break; // unreachable workaround
        } while(false);
        _601 = _600;
        break;
    } while(false);
    float3 _620;
    do
    {
        if (_304)
        {
            _620 = fma(_481 * Primitive.Primitive_InvNonUniformScale.z, _601.zzz, fma(_479 * Primitive.Primitive_InvNonUniformScale.x, _601.xxx, (_480 * Primitive.Primitive_InvNonUniformScale.y) * _601.yyy));
            break;
        }
        _620 = _601;
        break;
    } while(false);
    float3 _688;
    do
    {
        if (NiagaraSpriteVF.NiagaraSpriteVF_AlignmentDataOffset == (-1))
        {
            _688 = NiagaraSpriteVF.NiagaraSpriteVF_DefaultAlignment.xyz;
            break;
        }
        float3 _687;
        do
        {
            uint _637 = uint(NiagaraSpriteVF.NiagaraSpriteVF_AlignmentDataOffset);
            int _641 = int(_637 & 2147483647u);
            if ((_637 & 2147483648u) != 0u)
            {
                _687 = float3(NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_641) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_641 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_641 + 2) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            else
            {
                _687 = float3(NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_641) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_641 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_641 + 2) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            break; // unreachable workaround
        } while(false);
        _688 = _687;
        break;
    } while(false);
    float3 _707;
    do
    {
        if (_304)
        {
            _707 = fma(_481 * Primitive.Primitive_InvNonUniformScale.z, _688.zzz, fma(_479 * Primitive.Primitive_InvNonUniformScale.x, _688.xxx, (_480 * Primitive.Primitive_InvNonUniformScale.y) * _688.yyy));
            break;
        }
        _707 = _688;
        break;
    } while(false);
    float2 _762;
    do
    {
        if (NiagaraSpriteVF.NiagaraSpriteVF_PivotOffsetDataOffset == (-1))
        {
            _762 = NiagaraSpriteVF.NiagaraSpriteVF_DefaultPivotOffset;
            break;
        }
        float2 _761;
        do
        {
            uint _723 = uint(NiagaraSpriteVF.NiagaraSpriteVF_PivotOffsetDataOffset);
            int _727 = int(_723 & 2147483647u);
            if ((_723 & 2147483648u) != 0u)
            {
                _761 = float2(NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_727) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_727 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            else
            {
                _761 = float2(NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_727) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_727 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            break; // unreachable workaround
        } while(false);
        _762 = _761;
        break;
    } while(false);
    float2 _813;
    do
    {
        if (NiagaraSpriteVF.NiagaraSpriteVF_UVScaleDataOffset == (-1))
        {
            _813 = NiagaraSpriteVF.NiagaraSpriteVF_DefaultUVScale;
            break;
        }
        float2 _812;
        do
        {
            uint _774 = uint(NiagaraSpriteVF.NiagaraSpriteVF_UVScaleDataOffset);
            int _778 = int(_774 & 2147483647u);
            if ((_774 & 2147483648u) != 0u)
            {
                _812 = float2(NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_778) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_778 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            else
            {
                _812 = float2(NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_778) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_778 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            break; // unreachable workaround
        } while(false);
        _813 = _812;
        break;
    } while(false);
    float3 _814 = View.View_ViewTilePosition - _320;
    float3 _815 = View.View_RelativeWorldCameraOrigin - _321;
    float3 _816 = _814 * 2097152.0;
    float3 _817 = _816 + _815;
    float _818 = length(_817);
    float _819 = precise::max(_818, 9.9999999747524270787835121154785e-07);
    float3 _820 = float3(_819);
    float3 _821 = _817 / _820;
    float _858;
    do
    {
        if (NiagaraSpriteVF.NiagaraSpriteVF_CameraOffsetDataOffset == (-1))
        {
            _858 = NiagaraSpriteVF.NiagaraSpriteVF_DefaultCamOffset;
            break;
        }
        float _857;
        do
        {
            uint _833 = uint(NiagaraSpriteVF.NiagaraSpriteVF_CameraOffsetDataOffset);
            int _837 = int(_833 & 2147483647u);
            if ((_833 & 2147483648u) != 0u)
            {
                _857 = NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_837) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x;
                break;
            }
            else
            {
                _857 = NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_837) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x;
                break;
            }
            break; // unreachable workaround
        } while(false);
        _858 = _857;
        break;
    } while(false);
    float3 _859 = _821 * _858;
    float4 _934;
    do
    {
        if (NiagaraSpriteVF.NiagaraSpriteVF_ColorDataOffset == (-1))
        {
            _934 = NiagaraSpriteVF.NiagaraSpriteVF_DefaultColor;
            break;
        }
        float4 _933;
        do
        {
            uint _871 = uint(NiagaraSpriteVF.NiagaraSpriteVF_ColorDataOffset);
            int _875 = int(_871 & 2147483647u);
            if ((_871 & 2147483648u) != 0u)
            {
                _933 = float4(NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_875) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_875 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_875 + 2) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataHalf.read(uint(((uint(_875 + 3) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            else
            {
                _933 = float4(NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_875) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_875 + 1) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_875 + 2) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x, NiagaraSpriteVFLooseParameters_NiagaraParticleDataFloat.read(uint(((uint(_875 + 3) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NiagaraFloatDataStride) + _211))).x);
                break;
            }
            break; // unreachable workaround
        } while(false);
        _934 = _933;
        break;
    } while(false);
    float _935 = length(_500);
    float3 _943 = float3(NiagaraSpriteVF.NiagaraSpriteVF_RemoveHMDRoll);
    float3 _944 = mix(View.View_ViewRight, View.View_HMDViewNoRollRight, _943);
    float3 _945 = mix(View.View_ViewUp, View.View_HMDViewNoRollUp, _943);
    float3 _946 = -_945;
    float3 _947 = -View.View_ViewForward;
    bool _950 = NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_ParticleFacingMode == 2u;
    bool3 _951 = bool3(_950);
    float3 _952 = select(_821, _620 / float3(precise::max(length(_620), 9.9999999747524270787835121154785e-07)), _951);
    float3 _958 = mix(select(float3(0.0, 0.0, 1.0), _500 / float3(_935), bool3(_935 > 9.9999999747524270787835121154785e-07)), _707 / float3(precise::max(length(_707), 9.9999999747524270787835121154785e-07)), float3(float(NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_ParticleAlignmentMode == 2u)));
    float3 _959 = cross(_952, _958);
    float3 _963 = _959 / float3(precise::max(length(_959), 9.9999999747524270787835121154785e-07));
    float3 _969 = cross(_947, _945);
    float3 _973 = _969 / float3(precise::max(length(_969), 9.9999999747524270787835121154785e-07));
    float3 _975 = cross(_952, _945);
    float3 _979 = _975 / float3(precise::max(length(_975), 9.9999999747524270787835121154785e-07));
    float3 _981 = cross(_821, float3(0.0, 0.0, 1.0));
    float3 _985 = _981 / float3(precise::max(length(_981), 9.9999999747524270787835121154785e-07));
    float3 _1023;
    float3 _1024;
    if (NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_ParticleAlignmentMode == 0u)
    {
        float3 _1021;
        float3 _1022;
        if (NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_ParticleFacingMode == 4u)
        {
            float3 _1018 = float3(fast::clamp(fma(dot(_817, _817), NiagaraSpriteVF.NiagaraSpriteVF_CameraFacingBlend[1], -NiagaraSpriteVF.NiagaraSpriteVF_CameraFacingBlend[2]), 0.0, 1.0));
            _1021 = mix(cross(_821, _981), _946, _1018);
            _1022 = mix(_981, _944, _1018);
        }
        else
        {
            float3 _1007;
            float3 _1008;
            if (NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_ParticleFacingMode == 0u)
            {
                _1007 = _946;
                _1008 = _944;
            }
            else
            {
                float3 _1005;
                float3 _1006;
                if (NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_ParticleFacingMode == 1u)
                {
                    _1005 = cross(_947, _973);
                    _1006 = _973;
                }
                else
                {
                    _1005 = select(cross(_821, _985), cross(_952, _979), _951);
                    _1006 = select(_985, _979, _951);
                }
                _1007 = _1005;
                _1008 = _1006;
            }
            _1021 = _1007;
            _1022 = _1008;
        }
        _1023 = _1021;
        _1024 = _1022;
    }
    else
    {
        _1023 = mix(-_958, cross(_952, _963), float3(float(_950)));
        _1024 = _963;
    }
    float _1025 = sin(_364);
    float _1026 = cos(_364);
    float3 _1027 = _1024 * _1025;
    float3 _1028 = _1023 * _1025;
    float3 _1029 = _1024 * _1026;
    float3 _1030 = _1023 * _1026;
    float3 _1031 = _1028 + _1029;
    float3 _1032 = _1030 - _1027;
    float2 _1035 = float2(int2(sign(_415)));
    float2 _1088;
    float2 _1089;
    if (NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NumCutoutVerticesPerFrame > 0u)
    {
        uint _1056 = (gl_VertexIndex - gl_BaseVertex) & ((NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NumCutoutVerticesPerFrame == 8u) ? 7u : 3u);
        float _1064 = _1035.x;
        float _1065 = _1035.y;
        uint _1072;
        if ((_1064 * _1065) < 0.0)
        {
            _1072 = (NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NumCutoutVerticesPerFrame - 1u) - _1056;
        }
        else
        {
            _1072 = _1056;
        }
        float4 _1076 = NiagaraSpriteVFLooseParameters_CutoutGeometry.read(uint(((uint(fmod(_537, NiagaraSpriteVF.NiagaraSpriteVF_SubImageSize.x * NiagaraSpriteVF.NiagaraSpriteVF_SubImageSize.y)) * NiagaraSpriteVFLooseParameters.NiagaraSpriteVFLooseParameters_NumCutoutVerticesPerFrame) + _1072)));
        float _1079 = _1076.x;
        float2 _1082;
        _1082.x = (_1064 < 0.0) ? (1.0 - _1079) : _1079;
        float _1084 = _1076.y;
        _1082.y = (_1065 < 0.0) ? (1.0 - _1084) : _1084;
        _1088 = _1082;
        _1089 = _1076.xy;
    }
    else
    {
        float2 _1047;
        _1047.x = (_1035.x < 0.0) ? (1.0 - in.in_var_ATTRIBUTE0.x) : in.in_var_ATTRIBUTE0.x;
        _1047.y = (_1035.y < 0.0) ? (1.0 - in.in_var_ATTRIBUTE0.y) : in.in_var_ATTRIBUTE0.y;
        _1088 = in.in_var_ATTRIBUTE0;
        _1089 = _1047;
    }
    float2 _1092 = abs(_415);
    float4 _1126;
    float _1127;
    if (NiagaraSpriteVF.NiagaraSpriteVF_PixelCoverageEnabled != 0)
    {
        float _1105 = precise::max(_1092.x, _1092.y);
        float _1106 = _1105 * 0.5;
        float _1115 = precise::max(((View.View_ViewSizeAndInvSize.z * View.View_TanAndInvTanHalfFOV.x) * dot(((_320 - View.View_ViewTilePosition) * 2097152.0) + (_321 - View.View_RelativeWorldCameraOrigin), View.View_ViewForward)) * 2.0, _1106);
        float _1118 = fast::clamp(_1105 / _1115, 0.0, 1.0);
        _1126 = fma(_934 * (_1118 * _1118), NiagaraSpriteVF.NiagaraSpriteVF_PixelCoverageColorBlend, _934 * (float4(1.0) - NiagaraSpriteVF.NiagaraSpriteVF_PixelCoverageColorBlend));
        _1127 = _1115 / _1106;
    }
    else
    {
        _1126 = _934;
        _1127 = 1.0;
    }
    float2x3 _1128 = float2x3(_1031, _1032);
    float2 _1129 = _1092 * _1127;
    float2 _1130 = _1088 - _762;
    float2 _1131 = _1129 * _1130;
    float3 _1132 = _1128 * _1131;
    float3 _1133 = _859 + _1132;
    float3 _1134 = _321 + _1133;
    float _1135 = fract(_537);
    float _1137 = (_537 - _1135) + 0.5;
    float2 _1151 = (float2(floor(fmod(_1137, NiagaraSpriteVF.NiagaraSpriteVF_SubImageSize.x)), floor(_1137 * NiagaraSpriteVF.NiagaraSpriteVF_SubImageSize.z)) + fma(_1089 - float2(0.5), _813, float2(0.5))) * NiagaraSpriteVF.NiagaraSpriteVF_SubImageSize.zw;
    float2 _1158 = float2(int2(sign(_813)));
    float _1159 = _1158.x;
    float3 _1160 = _1031 * _1159;
    float3x3 _1161;
    _1161[0] = _1160;
    float _1162 = _1158.y;
    float3 _1163 = _1032 * _1162;
    _1161[1] = _1163;
    float3x3 _1209;
    if (NiagaraSpriteVF.NiagaraSpriteVF_NormalsType < 0.5)
    {
        float3 _1201 = fast::normalize(cross(_1160, _1163));
        float3x3 _1202 = _1161;
        _1202[2] = _1201;
        float3x3 _1208;
        if (_1159 != _1162)
        {
            float3x3 _1207 = _1202;
            _1207[2] = _1201 * (-1.0);
            _1208 = _1207;
        }
        else
        {
            _1208 = _1202;
        }
        _1209 = _1208;
    }
    else
    {
        float3x3 _1199;
        if (NiagaraSpriteVF.NiagaraSpriteVF_NormalsType < 1.5)
        {
            float3x3 _1198 = _1161;
            _1198[2] = fast::normalize((_320 * 2097152.0) + (_321 - NiagaraSpriteVF.NiagaraSpriteVF_NormalsSphereCenter.xyz));
            _1199 = _1198;
        }
        else
        {
            float3 _1182 = _320 * 2097152.0;
            float3x3 _1190 = _1161;
            _1190[2] = fast::normalize(_1182 + (_321 - (NiagaraSpriteVF.NiagaraSpriteVF_NormalsSphereCenter.xyz + (NiagaraSpriteVF.NiagaraSpriteVF_NormalsCylinderUnitDirection.xyz * dot(NiagaraSpriteVF.NiagaraSpriteVF_NormalsCylinderUnitDirection.xyz, _1182 + (_321 - NiagaraSpriteVF.NiagaraSpriteVF_NormalsSphereCenter.xyz))))));
            _1199 = _1190;
        }
        _1209 = _1199;
    }
    float3 _1210 = _320 + _201;
    float3 _1211 = _1134 + View.View_RelativePreViewTranslation;
    float3 _1212 = _1210 * 2097152.0;
    float3 _1213 = _1212 + _1211;
    float _1214 = _1213.x;
    float _1215 = _1213.y;
    float _1216 = _1213.z;
    float4 _1217 = float4(_1214, _1215, _1216, 1.0);
    float4 _1218 = float4(_1217.x, _1217.y, _1217.z, _1217.w);
    float4 _1219 = View.View_TranslatedWorldToClip * _1218;
    float4 _1223 = float4(_1209[0].x, _1209[0].y, _1209[0].z, float4(0.0).w);
    _1223.w = (NiagaraSpriteVF.NiagaraSpriteVF_SubImageBlendMode == 1) ? _1135 : 0.0;
    spvUnsafeArray<float4, 1> _1234 = spvUnsafeArray<float4, 1>({ float4(_1151.x, _1151.y, float4(0.0).z, float4(0.0).w) });
    float3 _1236 = _1217.xyz - View.View_TranslatedWorldCameraOrigin;
    float _1238 = dot(fast::normalize(_1236), View.View_ViewForward);
    float3 _1251 = (View.View_ViewTilePosition * 2097152.0) + View.View_RelativeWorldCameraOrigin;
    float _1252 = _1251.z;
    float _1253 = precise::min(_1252, TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters.z);
    float _1256 = _1236.z + (_1252 - _1253);
    float3 _1257 = _1236;
    _1257.z = _1256;
    float _1258 = dot(_1257, _1257);
    float _1260 = rsqrt(precise::max(_1258, 9.9999999392252902907785028219223e-09));
    float _1261 = _1258 * _1260;
    float3 _1262 = _1257 * _1260;
    float _1269 = precise::max(View.View_VolumetricFogMaxDistance * ((_1238 > 0.001000000047497451305389404296875) ? (1.0 / _1238) : 0.0), TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters.w);
    float _1304;
    float _1305;
    float _1306;
    float _1307;
    if (_1269 > 0.0)
    {
        float _1273 = _1269 * _1260;
        float _1274 = fma(_1273, _1256, _1253);
        _1304 = fma(-_1269, _1260, 1.0) * _1261;
        _1305 = TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters2.z * exp2(-precise::max(-127.0, TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters2.y * (_1274 - TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters2.w)));
        _1306 = TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters3.x * exp2(-precise::max(-127.0, TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters.y * (_1274 - TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters3.y)));
        _1307 = fma(-_1273, _1256, _1256);
    }
    else
    {
        _1304 = _1261;
        _1305 = TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters2.x;
        _1306 = TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters.x;
        _1307 = _1256;
    }
    float _1311 = precise::max(-127.0, TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters.y * _1307);
    float _1323 = precise::max(-127.0, TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters2.y * _1307);
    float _1333 = fma(_1306, (abs(_1311) > 0.00999999977648258209228515625) ? ((1.0 - exp2(-_1311)) / _1311) : fma(-0.2402265071868896484375, _1311, 0.693147182464599609375), _1305 * ((abs(_1323) > 0.00999999977648258209228515625) ? ((1.0 - exp2(-_1323)) / _1323) : fma(-0.2402265071868896484375, _1323, 0.693147182464599609375)));
    float3 _1374;
    if (TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters3.z > 0.0)
    {
        float2 _1359 = float2(dot(_1257.xy, float2(TranslucentBasePass.TranslucentBasePass_Shared_Fog_SinCosInscatteringColorCubemapRotation.y, -TranslucentBasePass.TranslucentBasePass_Shared_Fog_SinCosInscatteringColorCubemapRotation.x)), dot(_1257.xy, TranslucentBasePass.TranslucentBasePass_Shared_Fog_SinCosInscatteringColorCubemapRotation));
        float3 _1360 = float3(_1359.x, _1359.y, _1257.z);
        _1374 = TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogColorParameter.xyz * mix(TranslucentBasePass_Shared_Fog_FogInscatteringColorCubemap.sample(TranslucentBasePass_Shared_Fog_FogInscatteringColorSampler, _1360, level(TranslucentBasePass.TranslucentBasePass_Shared_Fog_FogInscatteringTextureParameters.z)).xyz, TranslucentBasePass_Shared_Fog_FogInscatteringColorCubemap.sample(TranslucentBasePass_Shared_Fog_FogInscatteringColorSampler, _1360, level(0.0)).xyz, float3(fast::clamp(fma(_1261, TranslucentBasePass.TranslucentBasePass_Shared_Fog_FogInscatteringTextureParameters.x, TranslucentBasePass.TranslucentBasePass_Shared_Fog_FogInscatteringTextureParameters.y), 0.0, 1.0)));
    }
    else
    {
        _1374 = TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogColorParameter.xyz;
    }
    float3 _1441;
    if ((TranslucentBasePass.TranslucentBasePass_Shared_Fog_InscatteringLightDirection.w >= 0.0) && (TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters3.z == 0.0))
    {
        float3 _1412 = (TranslucentBasePass.TranslucentBasePass_Shared_Fog_DirectionalInscatteringColor.xyz + ((View.View_AtmosphereLightIlluminanceOnGroundPostTransmittance[0].xyz * View.View_SkyAtmosphereHeightFogContribution) * 0.079577468335628509521484375)) * pow(fast::clamp(dot(_1262, View.View_AtmosphereLightDirection[0].xyz), 0.0, 1.0), TranslucentBasePass.TranslucentBasePass_Shared_Fog_DirectionalInscatteringColor.w);
        float3 _1432;
        if (View.View_AtmosphereLightIlluminanceOnGroundPostTransmittance[1].w > 0.0)
        {
            _1432 = _1412 + ((TranslucentBasePass.TranslucentBasePass_Shared_Fog_DirectionalInscatteringColor.xyz + ((View.View_AtmosphereLightIlluminanceOnGroundPostTransmittance[1].xyz * View.View_SkyAtmosphereHeightFogContribution) * 0.079577468335628509521484375)) * pow(fast::clamp(dot(_1262, View.View_AtmosphereLightDirection[1].xyz), 0.0, 1.0), TranslucentBasePass.TranslucentBasePass_Shared_Fog_DirectionalInscatteringColor.w));
        }
        else
        {
            _1432 = _1412;
        }
        _1441 = _1432 * (1.0 - fast::clamp(exp2(-(_1333 * precise::max(_1304 - TranslucentBasePass.TranslucentBasePass_Shared_Fog_InscatteringLightDirection.w, 0.0))), 0.0, 1.0));
    }
    else
    {
        _1441 = float3(0.0);
    }
    bool _1450 = (TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters3.w > 0.0) && (_1261 > TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogParameters3.w);
    float _1453 = _1450 ? 1.0 : precise::max(fast::clamp(exp2(-(_1333 * _1304)), 0.0, 1.0), TranslucentBasePass.TranslucentBasePass_Shared_Fog_ExponentialFogColorParameter.w);
    float4 _1460 = float4((fma(TranslucentBasePass.TranslucentBasePass_Shared_Fog_SkyAtmosphereAmbientContributionColorScale.xyz * float3(View.View_SkyAtmosphereHeightFogContribution), View_DistantSkyLightLutTexture.sample(View_DistantSkyLightLutTextureSampler, float2(0.5), level(0.0)).xyz, _1374) * (1.0 - _1453)) + select(_1441, float3(0.0), bool3(_1450)), _1453);
    float4 _1536;
    if (View.View_SkyAtmosphereApplyCameraAerialPerspectiveVolume > 0.0)
    {
        float3 _1465 = _1236 * 9.9999997473787516355514526367188e-06;
        float _1474 = precise::max(0.0, length(_1465) - View.View_SkyAtmosphereAerialPerspectiveStartDepthKm);
        float _1477 = sqrt((_1474 * View.View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthSliceLengthKmInv) * View.View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolutionInv);
        float _1478 = _1477 * View.View_SkyAtmosphereCameraAerialPerspectiveVolumeDepthResolution;
        float _1485;
        if (_1478 < 0.707106769084930419921875)
        {
            _1485 = fast::clamp((_1478 * _1478) * 2.0, 0.0, 1.0);
        }
        else
        {
            _1485 = 1.0;
        }
        float _1488 = _1485 * fast::clamp(_1474 * 100000.0, 0.0, 1.0);
        float2 _1515;
        if (View.View_RealTimeReflectionCapture != 0.0)
        {
            float3 _1491 = fast::normalize(_1465);
            float _1492 = _1491.z;
            float _1495 = sqrt(fma(-_1492, _1492, 1.0));
            float2 _1497;
            _1497.y = fma(_1492, 0.5, 0.5);
            float _1502 = acos(_1491.x / _1495);
            _1497.x = (((_1491.y / _1495) < 0.0) ? (6.283185482025146484375 - _1502) : _1502) * 0.15915493667125701904296875;
            _1515 = (_1497 + (View.View_SkyAtmosphereCameraAerialPerspectiveVolumeSizeAndInvSize.zw * 0.5)) * (View.View_SkyAtmosphereCameraAerialPerspectiveVolumeSizeAndInvSize.xy / (View.View_SkyAtmosphereCameraAerialPerspectiveVolumeSizeAndInvSize.xy + float2(1.0)));
        }
        else
        {
            _1515 = fma(_1219.xy / _1219.ww, float2(0.5, -0.5), float2(0.5));
        }
        float4 _1520 = View_CameraAerialPerspectiveVolume.sample(View_CameraAerialPerspectiveVolumeSampler, float3(_1515, _1477), level(0.0));
        float3 _1532 = _1460.xyz + (((_1520.xyz * _1488).xyz * View.View_OneOverPreExposure).xyz * _1453);
        float4 _1533 = float4(_1532.x, _1532.y, _1532.z, _134.w);
        _1533.w = _1453 * fma(-_1488, 1.0 - _1520.w, 1.0);
        _1536 = _1533;
    }
    else
    {
        _1536 = _1460;
    }
    out.out_var_TEXCOORD10 = _1223;
    out.out_var_TEXCOORD11 = float4(_1209[2], float(int(sign(determinant(_1209)))));
    out.out_var_TEXCOORD0 = _1126;
    out_var_TEXCOORD1 = _1234;
    out.out_var_TEXCOORD7 = _1536;
    out.out_var_TEXCOORD9 = _1217.xyz;
    out.gl_Position = _1219;
    out.out_var_TEXCOORD1_0 = out_var_TEXCOORD1[0];
    return out;
}

