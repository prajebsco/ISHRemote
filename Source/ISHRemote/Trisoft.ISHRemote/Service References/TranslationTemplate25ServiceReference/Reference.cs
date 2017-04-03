﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Trisoft.ISHRemote.TranslationTemplate25ServiceReference {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="InfoShareFault", Namespace="http://sdl.com/trisoft/2012/06/WebServices/Contracts/Faults/API25/")]
    [System.SerializableAttribute()]
    public partial class InfoShareFault : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string DescriptionField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private long InfoShareErrorNumberField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string OriginField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string XMLDetailField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Description {
            get {
                return this.DescriptionField;
            }
            set {
                if ((object.ReferenceEquals(this.DescriptionField, value) != true)) {
                    this.DescriptionField = value;
                    this.RaisePropertyChanged("Description");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public long InfoShareErrorNumber {
            get {
                return this.InfoShareErrorNumberField;
            }
            set {
                if ((this.InfoShareErrorNumberField.Equals(value) != true)) {
                    this.InfoShareErrorNumberField = value;
                    this.RaisePropertyChanged("InfoShareErrorNumber");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Origin {
            get {
                return this.OriginField;
            }
            set {
                if ((object.ReferenceEquals(this.OriginField, value) != true)) {
                    this.OriginField = value;
                    this.RaisePropertyChanged("Origin");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string XMLDetail {
            get {
                return this.XMLDetailField;
            }
            set {
                if ((object.ReferenceEquals(this.XMLDetailField, value) != true)) {
                    this.XMLDetailField = value;
                    this.RaisePropertyChanged("XMLDetail");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/", ConfigurationName="TranslationTemplate25ServiceReference.TranslationTemplate")]
    public interface TranslationTemplate {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Ret" +
            "rieve", ReplyAction="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Ret" +
            "rieveResponse")]
        [System.ServiceModel.FaultContractAttribute(typeof(Trisoft.ISHRemote.TranslationTemplate25ServiceReference.InfoShareFault), Action="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Ret" +
            "rieveInfoShareFault", Name="InfoShareFault", Namespace="http://sdl.com/trisoft/2012/06/WebServices/Contracts/Faults/API25/")]
        [return: System.ServiceModel.MessageParameterAttribute(Name="xmlTranslationTemplateList")]
        string Retrieve();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Ret" +
            "rieve", ReplyAction="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Ret" +
            "rieveResponse")]
        [return: System.ServiceModel.MessageParameterAttribute(Name="xmlTranslationTemplateList")]
        System.Threading.Tasks.Task<string> RetrieveAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Cre" +
            "ate", ReplyAction="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Cre" +
            "ateResponse")]
        [System.ServiceModel.FaultContractAttribute(typeof(Trisoft.ISHRemote.TranslationTemplate25ServiceReference.InfoShareFault), Action="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Cre" +
            "ateInfoShareFault", Name="InfoShareFault", Namespace="http://sdl.com/trisoft/2012/06/WebServices/Contracts/Faults/API25/")]
        void Create(string xmlTranslationTemplateList);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Cre" +
            "ate", ReplyAction="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Cre" +
            "ateResponse")]
        System.Threading.Tasks.Task CreateAsync(string xmlTranslationTemplateList);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Del" +
            "ete", ReplyAction="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Del" +
            "eteResponse")]
        [System.ServiceModel.FaultContractAttribute(typeof(Trisoft.ISHRemote.TranslationTemplate25ServiceReference.InfoShareFault), Action="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Del" +
            "eteInfoShareFault", Name="InfoShareFault", Namespace="http://sdl.com/trisoft/2012/06/WebServices/Contracts/Faults/API25/")]
        void Delete();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Del" +
            "ete", ReplyAction="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Del" +
            "eteResponse")]
        System.Threading.Tasks.Task DeleteAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Del" +
            "eteByTypeAndAlias", ReplyAction="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Del" +
            "eteByTypeAndAliasResponse")]
        [System.ServiceModel.FaultContractAttribute(typeof(Trisoft.ISHRemote.TranslationTemplate25ServiceReference.InfoShareFault), Action="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Del" +
            "eteByTypeAndAliasInfoShareFault", Name="InfoShareFault", Namespace="http://sdl.com/trisoft/2012/06/WebServices/Contracts/Faults/API25/")]
        void DeleteByTypeAndAlias(string translationJobType, string alias);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Del" +
            "eteByTypeAndAlias", ReplyAction="http://sdl.com/trisoft/2012/06/WebServices/Services/API25/TranslationTemplate/Del" +
            "eteByTypeAndAliasResponse")]
        System.Threading.Tasks.Task DeleteByTypeAndAliasAsync(string translationJobType, string alias);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface TranslationTemplateChannel : Trisoft.ISHRemote.TranslationTemplate25ServiceReference.TranslationTemplate, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class TranslationTemplateClient : System.ServiceModel.ClientBase<Trisoft.ISHRemote.TranslationTemplate25ServiceReference.TranslationTemplate>, Trisoft.ISHRemote.TranslationTemplate25ServiceReference.TranslationTemplate {
        
        public TranslationTemplateClient() {
        }
        
        public TranslationTemplateClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public TranslationTemplateClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public TranslationTemplateClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public TranslationTemplateClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string Retrieve() {
            return base.Channel.Retrieve();
        }
        
        public System.Threading.Tasks.Task<string> RetrieveAsync() {
            return base.Channel.RetrieveAsync();
        }
        
        public void Create(string xmlTranslationTemplateList) {
            base.Channel.Create(xmlTranslationTemplateList);
        }
        
        public System.Threading.Tasks.Task CreateAsync(string xmlTranslationTemplateList) {
            return base.Channel.CreateAsync(xmlTranslationTemplateList);
        }
        
        public void Delete() {
            base.Channel.Delete();
        }
        
        public System.Threading.Tasks.Task DeleteAsync() {
            return base.Channel.DeleteAsync();
        }
        
        public void DeleteByTypeAndAlias(string translationJobType, string alias) {
            base.Channel.DeleteByTypeAndAlias(translationJobType, alias);
        }
        
        public System.Threading.Tasks.Task DeleteByTypeAndAliasAsync(string translationJobType, string alias) {
            return base.Channel.DeleteByTypeAndAliasAsync(translationJobType, alias);
        }
    }
}