using UnityEngine;
using System.Collections.Generic;

namespace FmdlStudio.Scripts.Static
{
    public static class Utils
    {
        private static readonly Texture2D defaultTex;

        static Utils()
        {
            defaultTex = GenerateDefaultTexture();
        }

        public static Texture2D GetDefaultTextureInstance()
        {
            return UnityEngine.Object.Instantiate(defaultTex);
        }

        private static Texture2D GenerateDefaultTexture()
        {
            Texture2D texture = new Texture2D(512, 512);

            for (int j = 0; j < 512; j++)
                for (int h = 0; h < 512; h++)
                {
                    Color c = new Color(0.25f, 0.25f, 0.25f);

                    if (((j / 32) % 2 == 0 && (h / 32) % 2 != 0) || ((j / 32) % 2 != 0 && (h / 32) % 2 == 0))
                        c = new Color(0.5f, 0.5f, 0.5f);

                    texture.SetPixel(j, h, c);
                } //for

            texture.Apply();

            return texture;
        }

        public static void FixTangents(Transform transform)
        {
            List<Mesh> meshes = new List<Mesh>(0);
            GetMeshes(transform, meshes);

            for (int i = 0; i < meshes.Count; i++)
            {
                Vector4[] tangents = meshes[i].tangents;

                for (int j = 0; j < tangents.Length; j++)
                    tangents[j].w *= -1;

                meshes[i].tangents = tangents;
            } //for
        } //FixTangents

        private static void GetMeshes(Transform transform, List<Mesh> meshes)
        {
            foreach (Transform t in transform)
            {
                if (t.gameObject.GetComponent<SkinnedMeshRenderer>())
                {
                    meshes.Add(t.gameObject.GetComponent<SkinnedMeshRenderer>().sharedMesh);
                    GetMeshes(t, meshes);
                } //if
            } //foreach
        } //GetMeshes ends
    } //class
} //namespace