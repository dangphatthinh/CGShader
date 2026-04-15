using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ShowDecal : MonoBehaviour
{
    Material mat;
    bool _showDecal = false;

    private void OnMouseDown()
    {
        _showDecal = !_showDecal;
        if(_showDecal)
        {
            mat.SetFloat("_ShowDecal", 1);
        }
        else
        {
            mat.SetFloat("_ShowDecal", 0);
        }
    }

    private void Start()
    {
        mat = this.GetComponent<Renderer>().sharedMaterial;
    }
}
