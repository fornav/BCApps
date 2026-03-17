// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.EServices.EDocumentConnector.ForNAV;
codeunit 6411 "ForNAV Peppol Install"
{
    Subtype = Install;
    Access = Internal;

    trigger OnInstallAppPerCompany()
    var
#if DEV
        Upgrade: Codeunit "ForNAV Peppol Upgrade";
#endif
    begin
#if DEV
        Upgrade.UpdateEndpoint();
#endif
    end;
}